#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper qw(Dumper);

my @input = read_file('test.txt');