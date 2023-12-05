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

def calculateScenicScore(data, x: int, y: int):
    top = 0
    bottom = 0
    left = 0
    right = 0
    curr_tree_height = data[y][x]
    #print(f"curr tree height: {curr_tree_height}")
    for i in range(y - 1, -1, -1):
        #print(f"{i}. height {data[i][x]}")
        if isOnlyLower(num=data[i][x], compare_to=curr_tree_height):
            top += 1
        else:
            top += 1
            break

    for i in range(y + 1, len(data)):
        if isOnlyLower(num=data[i][x], compare_to=curr_tree_height):
            bottom += 1
        else:
            bottom += 1
            break

    for i in range(x - 1, -1, -1):
        if isOnlyLower(num=data[y][i], compare_to=curr_tree_height):
            left += 1
        else:
            left += 1
            break

    for i in range(x + 1, len(data[y])):
        if isOnlyLower(num=data[y][i], compare_to=curr_tree_height):
            right += 1
        else:
            right += 1
            break

    #print(f"top: {top}, bottom: {bottom}, left: {left}, right: {right}")

    return top * bottom * left * right

def countTreesVisible(data) -> bool:
    tree_count = countDataEntries(data)
    max_scenic_score = 0
    for y, arr in enumerate(data):
        for x, item in enumerate(arr):
            max_scenic_score = max(calculateScenicScore(data, x, y), max_scenic_score)
    return max_scenic_score

def main():
    input_data = []
    for line in read_input(input_file):
        input_data.append(line.rstrip())
    tree_matrix = build_matrix(input_data)
    print(countTreesVisible(tree_matrix))

if __name__ == "__main__":
    main()