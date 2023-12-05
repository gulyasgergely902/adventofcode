#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def checkIfWin(opponent, me) -> int:
    """Decide if win, draw or lose."""
    if opponent == "A" and me == "X": return 0
    if opponent == "A" and me == "Y": return 1
    if opponent == "A" and me == "Z": return -1

    if opponent == "B" and me == "X": return -1
    if opponent == "B" and me == "Y": return 0
    if opponent == "B" and me == "Z": return 1

    if opponent == "C" and me == "X": return 1
    if opponent == "C" and me == "Y": return -1
    if opponent == "C" and me == "Z": return 0

def calcScore(selected_shape, outcome) -> int:
    """Calculate round score"""
    shape_score = 0
    if selected_shape == "X":
        shape_score = 1
    elif selected_shape == "Y":
        shape_score = 2
    elif selected_shape == "Z":
        shape_score = 3
    else:
        shape_score = 0
    
    outcome_score = 0
    if outcome == -1:
        outcome_score = 0
    elif outcome == 0:
        outcome_score = 3
    elif outcome == 1:
        outcome_score = 6
    else:
        outcome_score = 0

    return shape_score + outcome_score

def main():
    input_data = read_input(input_file)
    #print(input_data)
    total_score = 0;
    for round in input_data:
        round = round.rstrip()
        round_responses = round.split(" ")
        opponent = round_responses[0]
        me = round_responses[1]
        total_score += calcScore(me, checkIfWin(opponent=opponent, me=me))
    print(f"1. part: Total score: {total_score}")

if __name__ == "__main__":
    main()