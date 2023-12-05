#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

my @numbers = read_file('input.txt');

#Part 1
{
    my $increments = 0;
    my $last = 0;

    foreach(@numbers){
        my $curr = $_;
        chomp $curr;
        if($curr > $last && $last != 0) {
            $increments++;
        }
        $last = $curr;
    }

    print "P1 Increments: $increments\n";
}

#Part 2
{
    my $increments = 0;
    my $last = 0;

    my $window_start = 0;
    foreach(@numbers){
        my $curr_window_sum = 0;
        my $curr = 0;
        for(my $i = $window_start; $i < $window_start + 3; $i++) {
            $curr = $numbers[$i];
            chomp $curr;
            $curr_window_sum += $curr;
        }
        if($curr_window_sum > $last && $last != 0) {
            $increments++;
        }
        $last = $curr_window_sum;
        $window_start++;
    }

    print "P2 Increments: $increments\n";
}
