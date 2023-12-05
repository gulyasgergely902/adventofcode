#!/usr/bin/env python3

import re

input_file = "input.txt"

stack1 = ['V','C', 'D', 'R', 'Z', 'G', 'B', 'W']
stack2 = ['G','W', 'F', 'C', 'B', 'S', 'T', 'V']
stack3 = ['C','B', 'S', 'N', 'W', ]
stack4 = ['Q','G', 'M', 'N', 'J', 'V', 'C', 'P']
stack5 = ['T','S', 'L', 'F', 'D', 'H', 'B']
stack6 = ['J','V', 'T', 'W', 'M', 'N']
stack7 = ['P','F', 'L', 'C', 'S', 'T', 'G']
stack8 = ['B','D', 'Z']
stack9 = ['M','N', 'Z', 'W']
stacklist = [stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9]

def read_input(file):
    f = open(file, "r")
    return f.readlines()

def read_instructions(input_data):
    instructions = []
    for line in input_data:
        instruction = []
        search_expression = r'move (\d+) from (\d+) to (\d+)'
        finder = re.compile(search_expression)
        match = finder.match(line)
        instruction.append(match.group(1))
        instruction.append(match.group(2))
        instruction.append(match.group(3))
        instructions.append(instruction)

    return instructions

def main():
    input_data = read_input(input_file)
    instructions = read_instructions(input_data=input_data)
    for instruction in instructions:
        how_many = int(instruction[0])
        from_struct = int(instruction[1]) - 1
        to_struct = int(instruction[2]) - 1
        #print(f"Moving {how_many} items from {from_struct} to {to_struct}")
        for i in range(how_many):
            char_to_move = stacklist[from_struct]
            char_to_move = char_to_move[len(char_to_move) - 1]
            stacklist[to_struct].append(char_to_move)
            stacklist[from_struct].pop()
    for stack in stacklist:
        print(stack[len(stack) - 1], end='')
    
    print("|", end='')

if __name__ == "__main__":
    main()
