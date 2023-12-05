#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

my @passwords = read_file('input.txt');
my $num_of_valid = 0;

#first phase

foreach(@passwords) {
    chomp $_;
    my @values = split /:/, $_;
    my @rules = split / /, $values[0];
    my @thresholds = split /-/, $rules[0];
    my $letter = $rules[1];
    my $password = $values[1];
    $password=~ s/^\s+//;

    my $num_of_char = 0;
    for(my $i = 0; $i < length $password; $i++) {
        if (substr($password, $i, 1) eq $letter) {
            $num_of_char++;
        }
    }
    if(($thresholds[0] <= $num_of_char) && ($num_of_char <= $thresholds[1])) {
        $num_of_valid++;
    }
}

print "Valid passwords: $num_of_valid\n";

# second phase

$num_of_valid = 0;

foreach(@passwords) {
    chomp $_;
    my @values = split /:/, $_;
    my @rules = split / /, $values[0];
    my @thresholds = split /-/, $rules[0];
    my $letter = $rules[1];
    my $password = $values[1];
    $password=~ s/^\s+//;

    my $magic_number = 0; # if this number is 1 it means one of the char at the position is good -> valid PW, if 2 means 2 char is good -> not valid, if 0 then none are valid
    my $letter_first = substr($password, $thresholds[0]-1, 1);
    my $letter_second = substr($password, $thresholds[1]-1, 1);
    if ($letter_first eq $letter) {
            $magic_number++;
    }
    if ($letter_second eq $letter) {
        $magic_number++;
    }
    if($magic_number == 1) {
        $num_of_valid++;
    }
}

print "Valid passwords: $num_of_valid\n";

