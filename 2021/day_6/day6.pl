#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

my $days = 150;

#my @input = read_file('input.txt');
my @input = read_file('test.txt');

my $line = $input[0];
chomp $line;

my @fish = split(",", $line);

#print "Initial state:\t";
#foreach(@fish) {
#    print "$_ ";
#}
#print "\n";

for(my $day = 0; $day < $days; $day++){
    print "After $day days:\t";
    foreach(@fish) {
        if($_ == 0) {
            $_ = 6;
            push(@fish, 9);
        } else {
            $_--;
        }
    }

    my $fish_count = @fish;
    print "$fish_count\n";

    #foreach(@fish) {
    #    print "$_ ";
    #}
    #print "\n";
}

my $fish_count = @fish;
print "P1 Answer: $fish_count\n";