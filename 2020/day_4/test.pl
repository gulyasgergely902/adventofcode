#!/usr/bin/perl

use strict;
use warnings;

my $str = "#123456789";

my $leading = substr $str, 0, 1;
my $value = substr $str, 1;

chomp $leading;
chomp $value;

print "$leading - $value\n";