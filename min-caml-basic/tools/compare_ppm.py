#!/usr/bin/env python3
import sys
def read_ppm(path):
    with open(path, 'r') as f:
        magic = f.readline().strip()
        tokens = []
        for line in f:
            line = line.split('#')[0]
            for t in line.split():
                try:
                    tokens.append(int(t))
                except ValueError:
                    break
            else:
                continue
            break
        w, h = tokens[0], tokens[1]
        maxval = tokens[2]
        data = tokens[3:]
        return w, h, maxval, data

f1, f2 = sys.argv[1], sys.argv[2]
w0, h0, m0, d0 = read_ppm(f1)
w5, h5, m5, d5 = read_ppm(f2)
print(f'{f1}: {w0}x{h0} max={m0} pixels={len(d0)//3}')
print(f'{f2}: {w5}x{h5} max={m5} pixels={len(d5)//3}')
total = min(len(d0), len(d5)) // 3
diff = 0
max_err = 0
for i in range(total):
    for c in range(3):
        e = abs(d0[i*3+c] - d5[i*3+c])
        if e > 0:
            diff += 1
            max_err = max(max_err, e)
accuracy = (total*3 - diff) / (total*3) * 100
print(f'diff_channels: {diff}/{total*3} accuracy={accuracy:.2f}% max_err={max_err}')
count = 0
for i in range(total):
    r0, g0, b0 = d0[i*3], d0[i*3+1], d0[i*3+2]
    r5, g5, b5 = d5[i*3], d5[i*3+1], d5[i*3+2]
    if r0 != r5 or g0 != g5 or b0 != b5:
        x, y = i % w0, i // w0
        print(f'  px({x},{y}): ref=({r0},{g0},{b0}) test=({r5},{g5},{b5})')
        count += 1
        if count >= 30:
            break
