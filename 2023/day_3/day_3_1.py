#!/usr/bin/env python3

import math as m
import re

input_file = "sample.txt"

WIDTH = 10
HEIGHT = 10

board = list(open(input_file))
print(board)
chars = {(row, col): [] for row in range(WIDTH) for col in range(HEIGHT)
                     if board[row][col] not in '01234566789.'}

print(chars)

for count, row in enumerate(board):
    for n in re.finditer(r'\d+', row):
        print(n)
        edge = {(count, c) for count in (count-1, count, count+1)
                       for c in range(n.start()-1, n.end()+1)}
        print(edge)

        for o in edge & chars.keys():
            chars[o].append(int(n.group()))

print(sum(sum(p)    for p in chars.values()),
      sum(m.prod(p) for p in chars.values() if len(p)==2))