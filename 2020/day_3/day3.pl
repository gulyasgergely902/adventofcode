#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

my @terrain = read_file('input.txt');

my @slopes = ("1,1", "3,1", "5,1", "7,1", "1,2");

my $posX = 0;
my $posY = 0;
my $trees_found = 0;

my $number = 1;

foreach(@slopes) {
    $posX = 0;
    $posY = 0;
    $trees_found = 0;

    my @slope = split /,/, $_;
    my $slopeX = $slope[0];
    my $slopeY = $slope[1];
    for(my $i = 0; $i < @terrain; $i+=$slopeY) {
        chomp $_;
        if (substr($terrain[$i], $posX, 1) eq "#") {
            $trees_found++;
        }
        $posX += $slopeX;
    }
    print "Trees found for slope($slopeX, $slopeY): $trees_found\n";
    $number = $number * $trees_found;
}

print "Multiplicated tree magic number: $number\n";
