#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper qw(Dumper);

my @input = read_file('test.txt');
#my @input = read_file('input.txt');

{
    my $all_number_count = 0;
    foreach(@input) {
        my @curr_iteration_numbers;
        my $line = $_;
        my $end = 0;
        chomp $line;
        my @segments = split(" ", $line);
        foreach(@segments) {
            if($_ eq "|") {
                $end = 1;
                next;
            }
            if((length($_) == 2) || (length($_) == 3) || (length($_) == 4) || (length($_) == 7)) {
                push(@curr_iteration_numbers, $_) if ($end);
            }
        }

        my $numbers = @curr_iteration_numbers;
        $all_number_count += $numbers;
    }
    print "P1 Answer: $all_number_count\n";
}
{
    foreach(@input) {
        my $end = 0;
        my @encoded_numbers;
        my $line = $_;
        chomp $line;
        my @segments = split(" ", $line);
        foreach(@segments) {
            if($_ eq "|") {
                $end = 1;
                next;
            }
            if($end) {
                push(@encoded_numbers, $_);
            }
        }
        foreach(@encoded_numbers) {
            print "$_ ";
        }
        print "\n\n";
    }
}