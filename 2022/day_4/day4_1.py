#!/usr/bin/env python3

input_file = "testinput.txt"

def create_set(pair, sep_a, sep_b):
    a, b = pair.split(sep_a)[0], pair.split(sep_a)[1]
    a_start, a_end = a.split(sep_b)[0], a.split(sep_b)[1]
    b_start, b_end = b.split(sep_b)[0], b.split(sep_b)[1]
    return set(range(int(a_start), int(a_end)+1)), set(range(int(b_start), int(b_end)+1))

def main():
    with open('input.txt') as f:
        assignment_pairs = list(filter(None, f.read().split('\n')))

    subsumed_total, overlapping_pairs = 0, 0

    for pair in assignment_pairs:
        set_a, set_b = create_set(pair, ",", "-")
        subsumed_total += 1 if set_a.issubset(set_b) or set_b.issubset(set_a) else 0
        overlapping_pairs += 1 if len(set_a.intersection(set_b)) > 0 else  0

    print("Pairs contained: " + str(subsumed_total) + ", pairs overlapping: " + str(overlapping_pairs))
if __name__ == "__main__":
    main()