#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use List::Util qw(max);
use Data::Dumper qw(Dumper);

my @input = read_file('input.txt');
#my @input = read_file('test.txt');

my %points;

foreach(@input) {
    my $line = $_;
    chomp $line;
    $line =~ /(\d+),(\d+)\s->\s(\d+),(\d+)/;
    my $from_x = $1;
    my $from_y = $2;
    my $to_x = $3;
    my $to_y = $4;
    my @coords = ($from_x, $to_x);
    
    if($from_x == $to_x) {
        if($from_y < $to_y){
            for(my $i = $from_y; $i <= $to_y; $i++) {
                #print "Point $from_x:$i\n";
                $points{"$from_x:$i"} += 1;
            }
        } else {
            for(my $i = $from_y; $i >= $to_y; $i--) {
                #print "Point $from_x:$i\n";
                $points{"$from_x:$i"} += 1;
            }
        }
    } elsif($from_y == $to_y) {
        if($from_x < $to_x) {
            for(my $i = $from_x; $i <= $to_x; $i++) {
                #print "Point $i:$from_y\n";
                $points{"$i:$from_y"} += 1;
            }
        } else {
            for(my $i = $from_x; $i >= $to_x; $i--) {
                #print "Point $i:$from_y\n";
                $points{"$i:$from_y"} += 1;
            }
        }
    } else {
        if($from_x < $to_x) {
            if($from_y < $to_y) {
                for(my $x = $from_x, my $y = $from_y; $x <= $to_x, $y <= $to_y; $x++, $y++) {
                    $points{"$x:$y"} += 1;
                }
            } elsif($from_y > $to_y) {
                for(my $x = $from_x, my $y = $from_y; $x <= $to_x, $y >= $to_y; $x++, $y--) {
                    $points{"$x:$y"} += 1;
                }
            }
        } elsif($from_x > $to_x) {
            if($from_y < $to_y) {
                for(my $x = $from_x, my $y = $from_y; $x >= $to_x, $y <= $to_y; $x--, $y++) {
                    $points{"$x:$y"} += 1;
                }
            } elsif($from_y > $to_y) {
                for(my $x = $from_x, my $y = $from_y; $x >= $to_x, $y >= $to_y; $x--, $y--) {
                    $points{"$x:$y"} += 1;
                }
            }
        }
    }
}

my $count;
foreach(keys %points) {
    if($points{$_} > 1) {
        $count++;
    }
}

print "P1 Answer: $count\n";
