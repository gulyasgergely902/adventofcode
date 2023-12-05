#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def split_line(line):
    half_point = int(len(line) / 2)
    data = []
    data.append(line[0 : half_point])
    data.append(line[-half_point:])

    return data
    

def main():
    input_data = read_input(input_file)
    sum_of_ascii = 0
    for line in input_data:
        ascii_code = 0
        line = line.rstrip()
        halves = split_line(line)
        for lc in halves[0]:
            for rc in halves[1]:
                if lc == rc:
                    ascii_code = ord(lc) - 96
                    if ascii_code < 0:
                        ascii_code = ord(lc) - 64 + 26
        sum_of_ascii += ascii_code
    print(f"Sum of ascii: {sum_of_ascii}")

if __name__ == "__main__":
    main()