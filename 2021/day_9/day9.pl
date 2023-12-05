#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper qw(Dumper);
use Switch;

my @input = read_file('test.txt');

foreach(@input) {
    my $round_braces = 0;
    my $square_braces = 0;
    my $curly_braces = 0;
    my $line = $_;
    chomp $line;
    print "Line: $line\n";
    my @chars = split("", $line);
    foreach(@chars) {
        switch($_) {
            case '(' {
                $round_braces++;
            }
            case ')' {
                $round_braces--;
            }
            case '[' {
                $square_braces++;
            }
            case ']' {
                $square_braces--;
            }
            case '{' {
                $curly_braces++;
            }
            case '}' {
                $curly_braces--;
            }
        }
    }
    print "Round braces: $round_braces\n";
    print "Round braces: $square_braces\n";
    print "Round braces: $curly_braces\n";
    if($round_braces != 0 || $square_braces != 0 || $curly_braces != 0) {
        print "Not valid!\n";
    }

}