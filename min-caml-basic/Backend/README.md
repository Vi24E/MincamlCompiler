# Rust Backend README

このディレクトリは、`min-caml-basic/test/minrt.s`（virtual 寄りアセンブリ）を受け取り、最終アセンブリ `minrt_colored.s` を生成する Rust 製 Backend です。

## 結論（現状）

- peephole 最適化は現状動作しています。
- `tester/test.py --v2` で `minrt` を実行した検証では、`100%` 一致で完走することを確認済みです（2026-02-19 時点）。
- beta move ルールも有効で、単独効果は小さいですが `cycles` を減らす方向に働きます。

## パイプライン概要

実行エントリは `src/main.rs` です。大まかな流れは次の通りです。

1. 入力読込
- `input::read_assembly_file` で入力アセンブリを `Instruction` 列に変換。

2. Peephole Stage1（frontend-like regs）
- ルールファイル（通常 `rules.txt`）を適用。

3. 引数 move 正規化
- 関数エントリ/関数呼び出し直前の引数 move を `shuffle_moves` で安全に並べ替え。
- cycle を含む move 連鎖は `%i31` / `%f31` を scratch として処理。

4. 反復処理（最大 20 回）
- `analysis::analyze`:
  - DEF/USE
  - CFG successor
  - liveness fixed point（worklist）
- `InterferenceGraph::build`:
  - ノードは仮想レジスタ `%vi*`, `%vf*` のみ
  - 物理レジスタ制約は forbidden color として記録
- `coloring::Coloring`:
  - レジスタ彩色
- spill があれば `spilling::perform_spilling` で書き換えて再解析
- spill が無ければ次へ

5. Peephole Stage2（virtual regs）
- 彩色確定後、finalize 前にもう一度 peephole。

6. finalize
- `finalize::finalize_code` でプロローグ/エピローグやフレーム調整を挿入。

7. 物理化 + Peephole Stage3（physical regs）
- `codegen::resolve_instructions` で仮想→物理割り当て解決。
- 解決後アセンブリに対して peephole。

8. 出力
- `codegen::emit_assembly` で `minrt_colored.s` を生成。

## モジュール対応

- `src/main.rs`: パイプライン統括、stage制御、反復制御。
- `src/input.rs`: アセンブリ読込/パース。
- `src/analysis.rs`: DEF/USE、CFG、liveness、干渉グラフ構築。
- `src/coloring.rs`: 彩色ロジック。
- `src/spilling.rs`: spill 展開。
- `src/finalize.rs`: 関数フレーム関連の最終整形。
- `src/codegen.rs`: 物理化と文字列アセンブリ出力。
- `src/peephole.rs`: ルール駆動 peephole 最適化。

## Peephole 最適化の仕様

### ルール形式

`rules.txt` に以下形式で記述します。

```text
mov %r1, %r2
mov %r3, %r1
->
mov %r3, %r2;
```

- `%r1`, `%r2` はプレースホルダ
- `;` でルール終端
- `//` コメント可

### 安全性チェック（実装側）

- プレースホルダの distinct 制約:
  - 異なる `%rX` は同一実レジスタへ束縛しない。
- 非隣接マッチ対応:
  - アンカーから逆走査して条件に合う命令を探す。
- 介在命令干渉チェック:
  - 束縛済みレジスタ集合への USE/DEF が途中にあれば不採用。
- deadness チェック:
  - 変換で消える DEF が RHS で再定義されず、かつ anchor の `live_out` に残っていれば不採用。
  - ブロック内については USE/DEF 位置インデックスで「次の overwrite 前 USE」を検査。

## 実行方法

```bash
cd min-caml-basic/Backend
cargo run -- ../test/minrt.s
```

生成物:
- `minrt_colored.s`

## デバッグ用環境変数

- `BACKEND_PEEPHOLE_STAGE1=0/1`
- `BACKEND_PEEPHOLE_STAGE2=0/1`
- `BACKEND_PEEPHOLE_STAGE3=0/1`
- `BACKEND_RULES_PATH=...`（デフォルト `rules.txt`）
- `BACKEND_DEBUG_CALL=1`（call 周辺 liveness ログ）
- `BACKEND_DEBUG_CALL_LIMIT=<N>`

例:

```bash
BACKEND_PEEPHOLE_STAGE3=0 cargo run -- ../test/minrt.s
BACKEND_RULES_PATH=rules_no_beta.txt cargo run -- ../test/minrt.s
```

## 補足ファイル

- `rules_no_beta.txt`, `rules_only_beta.txt`, `rules_empty.txt` は切り分け検証用に作成した派生ルールです。
- 通常運用は `rules.txt` を使ってください。
