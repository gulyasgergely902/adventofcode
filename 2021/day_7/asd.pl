#!/usr/bin/perl

use strict;
use warnings;


my $distance = 10;
my $fuel_need = 0;
for(my $i = 0; $i < $distance + 1; $i++) {
    print "$i\n";
    $fuel_need += $i;
}

print $fuel_need;