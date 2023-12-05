#!/usr/bin/env python3

import re

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    id_sum = 0
    for line in input_data:
        pattern = re.compile(r"Game (\d+): (.+?)(?=(?:Game \d+|$))")
        games = pattern.findall(line)
        for game in games:
            possible_game = True
            game_no, raw_game_data = game
            matches = raw_game_data.split(";")
            for match in matches:
                red = 0
                green = 0
                blue = 0
                match = match.lstrip()
                cubesets = match.split(",")
                for cubeset in cubesets:
                    cubeset = cubeset.lstrip()
                    cubeset_data = cubeset.split(" ")
                    if cubeset_data[1] == "red":
                        red = cubeset_data[0]
                    if cubeset_data[1] == "green":
                        green = cubeset_data[0]
                    if cubeset_data[1] == "blue":
                        blue = cubeset_data[0]
                if int(red) > 12 or int(green) > 13 or int(blue) > 14:
                    possible_game = False
            if possible_game:
                print(f"Game {game_no} is possible")
                id_sum += int(game_no)
    print(f"Game ID sum: {id_sum}")
if __name__ == "__main__":
    main()