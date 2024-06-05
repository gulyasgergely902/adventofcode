#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    sum = 0
    for line in input_data:
        numbers = []
        for char in line:
            if char.isdigit():
                numbers.append(char)
        number = int(f"{numbers[0]}{numbers[-1]}")
        print(number)
        sum += number
    print(sum)

if __name__ == "__main__":
    main()