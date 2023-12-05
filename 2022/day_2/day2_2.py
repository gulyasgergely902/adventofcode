#!/usr/bin/env python3

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def whatToChose(opponent, outcome_needed) -> str:
    """Decide what to choose for de desired outcome"""
    if opponent == 'A' and outcome_needed == 'X': return 'Z'
    if opponent == 'A' and outcome_needed == 'Y': return 'X'
    if opponent == 'A' and outcome_needed == 'Z': return 'Y'

    if opponent == 'B' and outcome_needed == 'X': return 'X'
    if opponent == 'B' and outcome_needed == 'Y': return 'Y'
    if opponent == 'B' and outcome_needed == 'Z': return 'Z'

    if opponent == 'C' and outcome_needed == 'X': return 'Y'
    if opponent == 'C' and outcome_needed == 'Y': return 'Z'
    if opponent == 'C' and outcome_needed == 'Z': return 'X'

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
    if outcome == 'X':
        outcome_score = 0
    elif outcome == 'Y':
        outcome_score = 3
    elif outcome == 'Z':
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
        outcome_needed = round_responses[1]
        response = whatToChose(opponent=opponent, outcome_needed=outcome_needed)
        total_score += calcScore(selected_shape=response, outcome=outcome_needed)
    print(f"2. part: Total score: {total_score}")

if __name__ == "__main__":
    main()