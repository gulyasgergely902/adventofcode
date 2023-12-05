#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def addToTotal(cycle_no: int, value: int):
    if cycle_no == 20 or \
        cycle_no == 60 or \
        cycle_no == 100 or \
        cycle_no == 140 or \
        cycle_no == 180 or \
        cycle_no == 220:
        return cycle_no * value
    return 0

def main():
    input_data = []
    for line in read_input(input_file):
        input_data.append(line.rstrip())

    curr_cycle_no = 1
    curr_value = 1
    total_value = 0
    run = True
    while run:
        cmd = input_data.pop(0)
        #print(f"CMD: {cmd}")
        if cmd.startswith("noop"):
            print(f"#Cycle: {curr_cycle_no} - Value: {curr_value} (noop)")
            total_value += addToTotal(curr_cycle_no, curr_value)
            curr_cycle_no += 1
            continue

        if cmd.startswith("addx"):
            # First cycle of adding
            print(f"#Cycle: {curr_cycle_no} - Value: {curr_value} (add first cycle)")
            total_value += addToTotal(curr_cycle_no, curr_value)
            curr_cycle_no += 1
            print(f"#Cycle: {curr_cycle_no} - Value: {curr_value} (add second cycle)")
            total_value += addToTotal(curr_cycle_no, curr_value)
            cmd_arr = cmd.split(" ")
            curr_value += int(cmd_arr[1])
            curr_cycle_no += 1

        if cmd == "-":
            print("No more CMD, stopping...")
            print(f"Total value: {total_value}")
            run = False
if __name__ == "__main__":
    main()