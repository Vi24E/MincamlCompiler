# バグ報告: 最適化iter≧1でmin-rtレイトレーサーの描画結果が不正になる

## 概要

min-caml-basicコンパイラで `-iter 1` 以上の最適化を行うと、min-rtレイトレーサーの描画結果が不正になる。具体的には、Rチャンネルが系統的に高い値に偏り、G/Bチャンネルが低い値に偏る（テクスチャ・拡散反射成分の欠落と推測される）。

- **再現方法**: `dune exec mincaml -- -virtual -iter 1 test/minrt` → Rustバックエンド → tkasm → sim
- **正常ケース**: `-iter 0`（最適化なし）で正しい描画が得られる
- **発症条件**: 最初の最適化イテレーション（iter=1）の Elim パス（Pass 5: 死コード除去）以降

## 調査方法と結果

### 1. イテレーションレベルの二分探索

| イテレーション | 正確度 | 差分チャンネル数 | 最大誤差 |
|---|---|---|---|
| iter=0（基準） | 100% | 0 | 0 |
| iter=1 | 92.71% | 224/3072 | 255 |
| iter=2 | 92.71% | 224 | 255 |
| iter=3 | — | タイムアウト（無限ループ）| — |
| iter=4 | 92.71% | 224 | 255 |
| iter=5 | 92.71% | 224 | 255 |

→ **バグはiter=1（最初のイテレーション）で発生**。iter=3の無限ループはSROA関連の別問題。

### 2. パスレベルの二分探索（iter=1内部）

| パス | 内容 | 正確度 | 差分チャンネル | 最大誤差 |
|---|---|---|---|---|
| Pass 1 (VariableChecker) | 変数チェック | 100% | 0 | 0 |
| Pass 2 (ArrayScalarize) | 配列スカラー化 | 100% | 0 | 0 |
| Pass 3 (TupleElim) | タプル除去 | 100% | 0 | 0 |
| Pass 4 (ArrayElim) | 配列除去 | **100%** | **0** | **0** |
| **Pass 5 (Elim)** | **死コード除去** | **94.17%** | **179** | **11** |
| Pass 7 (CommonExpElim) | 共通部分式除去 | 94.17% | 179 | 11 |
| Pass 10 (Beta) | Beta簡約 | 92.71% | 224 | 255 |

→ **第一の劣化ポイント: Pass 5 (Elim)** で179チャンネルに誤差発生（max_err=11）
→ **第二の劣化ポイント: Pass 8-10 (Inline/Assoc/Beta)** で45チャンネル追加、最大誤差が255に拡大

### 3. ピクセル誤差パターンの分析（Pass 5時点）

```
R diffs: 155ピクセル (全て参照より高い: +155, 低い: 0)
G diffs:  13ピクセル (高い: 1, 低い: 12)  
B diffs:  13ピクセル (高い: 1, 低い: 12)
```

例:
```
px(0,0): ref=(25,4,4) test=(25,0,0)  → G,B が 0 に
px(12,0): ref=(22,0,0) test=(25,0,0) → R が 22→25 に上昇
```

**R値が系統的に上昇・G/B値がゼロに近づく一方向性のエラーパターン**。レイトレーサーの拡散反射・テクスチャ色成分の計算結果が欠落し、環境光（ambient）のみが出力されている可能性が高い。

### 4. IR（中間表現）レベルの分析

Elimパスの前後でKNormal IRを比較した結果：

- **除去されたLetRec関数**: `o_color_red.2555`, `o_color_green.2568`, `o_color_blue.2581`, `raytracing.4442`, `scan_line.4745`, `rt.4825` 等（全て既にインライン展開済みで呼び出し元なし）
- **除去されたLet束縛**: `cobj.103xx` 系のエイリアス束縛、未使用のUnit束縛等
- **生存する実行パス**: `scan_start.4806` → `scan_point.4630` → `utexture.4235` は前後で意味的に同一

**IR上ではElimの変換は正当に見える**（除去された関数・変数は全てfv解析で「未使用」と判定されたもの）。

### 5. 仮想アセンブリ・着色アセンブリの分析

| | Pass 4 | Pass 5 |
|---|---|---|
| 仮想レジスタ命令数 | 14,715行 | 7,904行 |
| 着色後命令数 | 29,475行 | 23,479行 |
| 関数数 | 160 | 141 |
| スピル数（1st iter） | 47 | 37 |

- 仮想アセンブリの意味的比較: 生存関数（scan_point, utexture等）は**意味的に同一**（dead movのみの差）
- 着色アセンブリ: **402関数で構造的差異**あり。差異は全てレジスタ割当ての違い（異なるレジスタ選択、dead mov命令の有無）

### 6. バックエンドの検証

- **OCamlバックエンド（TKA/）**: Pass 4, Pass 5ともに無限ループ（90秒タイムアウト）→ 別問題があり検証不能
- **Rustバックエンド**: Pass 4 = 正常、Pass 5 = 不正

## 原因の推定

調査結果を総合すると、バグは以下のメカニズムで発生していると推定される：

### 直接原因: Rustバックエンド（Backend/）のレジスタ割当てが、入力コードのサイズ・構造の変化に対して脆弱

1. **Elimパス自体のIR変換は正当**: 除去された関数・変数は全てfv解析で未使用と正しく判定されている
2. **仮想アセンブリも意味的に等価**: 死コード除去前後で、実行される命令列は同じ
3. **しかし着色（レジスタ割当て）結果が異なる**: 死コードの存在/非存在が干渉グラフの構造を変え、異なるスピル／レジスタ選択を引き起こしている
4. **異なるレジスタ割当てが不正な実行結果を生む**: レジスタcoloring自体にバグがあり、特定のスピルパターンで値が失われる（R=25固定、G=B=0はスピル/リストアの欠落を示唆）

### 根拠

- IR的に同じ意味のコードが、バックエンドを通すと異なる実行結果になる
- Pass 4（死コードあり）→ 正常、Pass 5（死コード除去後）→ 異常
- 差異はレジスタ割当てのみ（意味的な命令差はない）
- スピル数が47→37に変化しており、スピル戦略の違いが原因の可能性
- 第二の劣化（Inline後、max_err=255）も同じメカニズムで説明可能：コード変換によりレジスタ圧力が変化し、別のスピルバグが顕在化

### 可能性のある具体的バグ箇所

1. **Backend/src/ のスピル処理**: スピル/リストアのペアが不整合を起こし、レジスタの値が保存されない
2. **Backend/src/ の干渉グラフ構築**: ライブ変数解析が不正確で、生存範囲が重なる変数が同じレジスタに割り当てられる
3. **Backend/src/ の関数呼び出し規約**: caller-save/callee-saveの処理に不備があり、特定のレジスタ割り当てパターンで値が破壊される

## 再現手順

```bash
cd min-caml-basic

# 正常（iter=0 基準画像）
dune exec mincaml -- -virtual -iter 0 test/minrt
cd Backend && cargo run --release -- ../test/minrt.s && cd ..
../bill_sim/tkasm Backend/minrt_colored.s -o test/minrt.bin
../bill_sim/sim test/minrt.bin --headless < ../bill_sim/input.bin > /tmp/ref.ppm

# Pass 4まで（正常）
STOP_AT_ITER=1 STOP_AFTER_PASS=4 dune exec mincaml -- -virtual -iter 1 test/minrt
cd Backend && cargo run --release -- ../test/minrt.s && cd ..
../bill_sim/tkasm Backend/minrt_colored.s -o test/minrt.bin
../bill_sim/sim test/minrt.bin --headless < ../bill_sim/input.bin > /tmp/pass4.ppm

# Pass 5まで（異常）
STOP_AT_ITER=1 STOP_AFTER_PASS=5 dune exec mincaml -- -virtual -iter 1 test/minrt
cd Backend && cargo run --release -- ../test/minrt.s && cd ..
../bill_sim/tkasm Backend/minrt_colored.s -o test/minrt.bin
../bill_sim/sim test/minrt.bin --headless < ../bill_sim/input.bin > /tmp/pass5.ppm

# 比較
python3 tools/compare_ppm.py /tmp/ref.ppm /tmp/pass4.ppm  # → 100%
python3 tools/compare_ppm.py /tmp/ref.ppm /tmp/pass5.ppm  # → 94.17%
```

## 推奨する今後の調査方針

1. **Rustバックエンドのスピル処理のデバッグ**: `BACKEND_LIVE_STATS=1` 等の環境変数を使い、Pass 4 vs Pass 5 で異なるスピル対象関数のスピル/リストア命令を検証する
2. **具体的な不正関数の特定**: 着色アセンブリの402の差分関数のうち、`scan_point`, `utexture`, `accumulate_vec_mul` 等のホットパス関数のレジスタ割当てを手動で検証する
3. **最小再現ケースの構築**: min-rtの特定関数のみを抽出した小さなテストケースで、バックエンドのバグを再現する

## 環境情報

- macOS
- dune build（devプロファイル）
- Rustバックエンド: `cargo run --release`
- シミュレータ: `bill_sim/sim`（headlessモード）
- 入力データ: `bill_sim/input.bin`（contest.sld前処理済み）
