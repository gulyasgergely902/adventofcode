#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper qw(Dumper);

#my @input = read_file('test.txt');
my @input = read_file('input.txt');

my @positions = split(",", $input[0]);

#Part 1
{
    my $curr_pos = 0;

    my $min_fuel_need = 999999999999;
    my $min_fuel_pos = 0;

    foreach(@positions) {
        $curr_pos = $_;
        #print "Checking $curr_pos\n";
        my $curr_fuel_need = 0;
        foreach(@positions) {
            if($_ > $curr_pos) { 
                $curr_fuel_need += ($_ - $curr_pos);
            } elsif($_ < $curr_pos) {
                $curr_fuel_need += ($curr_pos - $_);
            }
        }
        #print "Fuel need for $curr_pos: $curr_fuel_need\n";
        if($curr_fuel_need < $min_fuel_need) {
            $min_fuel_need = $curr_fuel_need;
            $min_fuel_pos = $curr_pos;
        }
    }

    print "P1 Answer: pos: $min_fuel_pos, need: $min_fuel_need\n";
}

#Part 2
{
    my $curr_pos = 0;

    my $min_fuel_need = 999999999999;
    my $min_fuel_pos = 0;

    my $positions_length = @positions;
    my $curr_counter = 0;

    foreach(@positions) {
        $curr_pos = $_;
        #print "$curr_counter/$positions_length\n";
        my $curr_fuel_need = 0;
        foreach(@positions) {
            my $distance = 0;
            if($_ > $curr_pos) { 
                $distance = $_ - $curr_pos;
            } elsif($_ < $curr_pos) {
                $distance = $curr_pos - $_;
            }
            print "$curr_pos -> $_: $distance\n";
            my $tmp = 0;
            for(my $i = 0; $i <= $distance; $i++) {
                $tmp += $i;
            }
            print "Fuel need: $tmp\n";
            $curr_fuel_need += $tmp;
            print "Added fuel need: $curr_fuel_need\n";
        }
        print "\nFuel need for $curr_pos: $curr_fuel_need\n";
        if($curr_fuel_need < $min_fuel_need) {
            $min_fuel_need = $curr_fuel_need;
            $min_fuel_pos = $curr_pos;
        }
        $curr_counter++;
        print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- --\n";
    }

    print "P2 Answer: pos: $min_fuel_pos, need: $min_fuel_need\n";
}