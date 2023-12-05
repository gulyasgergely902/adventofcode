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

def compare_strings(a, b, c) -> str:
    common_char = ''
    a = a.rstrip()
    b = b.rstrip()
    c = c.rstrip()
    common = list(set(a)&set(b)&set(c))
    for c in common:
        common_char = c

    return c

def calc_asii(ch) -> int:
    ascii_code = ord(ch) - 96
    if ascii_code < 0:
        ascii_code = ord(ch) - 64 + 26

    return ascii_code

def main():
    input_data = read_input(input_file)
    sum_of_ascii = 0
    line_nr = 0
    while(line_nr < len(input_data)):
        common_char = compare_strings(input_data[line_nr], input_data[line_nr + 1], input_data[line_nr + 2])
        sum_of_ascii += calc_asii(common_char)
        line_nr += 3
    print(f"Sum of ascii of groups: {sum_of_ascii}")

if __name__ == "__main__":
    main()