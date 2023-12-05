#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    #print(input_data)
    max_cal = 0
    tmp_max_cal = 0
    for data in input_data:
        data = data.rstrip()
        if data != "":
            tmp_max_cal += int(data)
        if data == "":
            if tmp_max_cal > max_cal:
                max_cal = tmp_max_cal
            tmp_max_cal = 0
    print(f"1.part: Max: {max_cal}")

if __name__ == "__main__":
    main()