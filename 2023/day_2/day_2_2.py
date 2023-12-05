#!/usr/bin/env python3

import re

input_file = "input.txt"

def read_input(file):
    """Read input file line-by-line"""
    f = open(file, "r")

    return f.readlines()

def main():
    input_data = read_input(input_file)
    power_sum = 0
    for line in input_data:
        pattern = re.compile(r"Game (\d+): (.+?)(?=(?:Game \d+|$))")
        games = pattern.findall(line)
        for game in games:
            red = 0
            green = 0
            blue = 0
            game_no, raw_game_data = game
            print(f"GAME {game_no}: {raw_game_data}")
            matches = raw_game_data.split(";")
            for match in matches:
                match = match.lstrip()
                cubesets = match.split(",")
                for cubeset in cubesets:
                    cubeset = cubeset.lstrip()
                    cubeset_data = cubeset.split(" ")
                    color_amount = int(cubeset_data[0])
                    if cubeset_data[1] == "red":
                        red = max(red, color_amount)
                    if cubeset_data[1] == "green":
                        green = max(green, color_amount)
                    if cubeset_data[1] == "blue":
                        blue = max(blue, color_amount)
            set_power = red * green * blue
            power_sum += set_power
    print(f"{power_sum}")
if __name__ == "__main__":
    main()