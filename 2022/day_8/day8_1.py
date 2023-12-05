#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def build_matrix(data):
    row_array = []
    for row in data:
        col_array = []
        for char in row:
            col_array.append(char)
        row_array.append(col_array)
    return row_array

def countDataEntries(data):
    count = 0
    for row in data:
        count += len(row)
    return count

def isOnlyLower(num: int, compare_to: int):
    return num < compare_to

def checkTreeVisibility(data, x: int, y: int):
    top = True
    bottom = True
    left = True
    right = True
    curr_tree_height = data[y][x]
    for i in range(0, y):
        if not isOnlyLower(num=data[i][x], compare_to=curr_tree_height):
            top = False

    for i in range(y + 1, len(data)):
        if not isOnlyLower(num=data[i][x], compare_to=curr_tree_height):
            bottom = False

    for i in range(0, x):
        if not isOnlyLower(num=data[y][i], compare_to=curr_tree_height):
            left = False

    for i in range(x + 1, len(data[y])):
        if not isOnlyLower(num=data[y][i], compare_to=curr_tree_height):
            right = False

    if top or bottom or left or right:
        return True

def countTreesVisible(data) -> bool:
    tree_count = countDataEntries(data)
    visible_count = 0
    for y, arr in enumerate(data):
        for x, item in enumerate(arr):
            if checkTreeVisibility(data, x, y):
                visible_count += 1

    return visible_count

def main():
    input_data = []
    for line in read_input(input_file):
        input_data.append(line.rstrip())
    tree_matrix = build_matrix(input_data)
    print(countTreesVisible(tree_matrix))

if __name__ == "__main__":
    main()