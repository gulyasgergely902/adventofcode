#!/usr/bin/perl

use strict;
use warnings;

use Switch;

use File::Slurp;

my @numbers = read_file('input.txt');

#Part 1
{
    my $forward_pos = 0;
    my $depth = 0;

    foreach(@numbers) {
        my $line = $_;
        chomp $line;
        my @cmds = split(' ', $line);
        switch($cmds[0]) {
            case 'forward' {
                $forward_pos += $cmds[1];
            }
            case 'down' {
                $depth += $cmds[1];
            }
            case 'up' {
                $depth -= $cmds[1];
            }
            else {
                print "$cmds[0] is not a valid command!\n";
            }
        }
    }

    my $coord = $forward_pos * $depth;
    print "P1 Coord: $coord\n";
}

#Part 2
{
    my $forward_pos = 0;
    my $depth = 0;
    my $aim = 0;

    foreach(@numbers) {
        my $line = $_;
        chomp $line;
        my @cmds = split(' ', $line);
        switch($cmds[0]) {
            case 'forward' {
                $forward_pos += $cmds[1];
                $depth += $aim * $cmds[1];
            }
            case 'down' {
                $aim += $cmds[1];
            }
            case 'up' {
                $aim -= $cmds[1];
            }
            else {
                print "$cmds[0] is not a valid command!\n";
            }
        }
    }

    my $coord = $forward_pos * $depth;
    print "P2 Coord: $coord\n";
}