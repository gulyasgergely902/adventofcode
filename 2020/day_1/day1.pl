#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

my @numbers = read_file('input.txt');

my $first_solution = 0;

foreach(@numbers){
    my $a = $_;
    chomp $a;
    foreach(@numbers){
        my $b = $_;
        if ($a != $b) {
            if ($a + $b == 2020) {
                $first_solution = $a * $b;
            }
        }
    }
}

print "First solution: $first_solution\n";

my $second_solution = 0;

foreach(@numbers){
    my $a = $_;
    chomp $a;
    foreach(@numbers){
        my $b = $_;
        chomp $b;
        foreach(@numbers){
            my $c = $_;
            chomp $c;
            if (($a != $b) && ($b != $c) && ($a != $c)){
                if ($a + $b + $c == 2020) {
                    $second_solution = $a * $b * $c;
                }
            }
        }
    }
}

print "Second solution: $second_solution\n";