#!/usr/bin/env python3

from math import isnan
import re

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    sum = 0
    for line in input_data:
        if len(line) < 3:
            if line[0].isnumeric != line[1].isnumeric:
                if line[0].isnumeric:
                    print(int(line[0]))
                    sum += int(line[0])
                    continue
                else:
                    print(int(line[1]))
                    sum += int(line[1])
                    continue

        numbers = []
        results = re.findall("one|two|three|four|five|six|seven|eight|nine|ten|1|2|3|4|5|6|7|8|9", line)
        for res in results:
            numbers.append(res)
        for i, num in enumerate(numbers):
            if num == "one":
                numbers[i] = "1"
            if num == "two":
                numbers[i] = "2"
            if num == "three":
                numbers[i] = "3"
            if num == "four":
                numbers[i] = "4"
            if num == "five":
                numbers[i] = "5"
            if num == "six":
                numbers[i] = "6"
            if num == "seven":
                numbers[i] = "7"
            if num == "eight":
                numbers[i] = "8"
            if num == "nine":
                numbers[i] = "9"
        number = int(f"{numbers[0]}{numbers[-1]}")
        print(number)
        sum += number
        print("------------------------------")
    print(sum)

if __name__ == "__main__":
    main()