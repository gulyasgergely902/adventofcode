#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    elf_calories = []
    current_sum = 0
    for data in input_data:
        data = data.rstrip()
        if data != "":
            current_sum += int(data)
        if data == "":
            elf_calories.append(current_sum)
            current_sum = 0
    elf_calories.sort(reverse=True)
    total_of_first_three = elf_calories[0] + elf_calories[1] + elf_calories[2]
    print(f"2. part: Total calories of first three elf: {total_of_first_three}")

if __name__ == "__main__":
    main()