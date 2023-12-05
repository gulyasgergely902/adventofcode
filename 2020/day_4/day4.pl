#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Switch;
use List::Util qw(first);

my @data = read_file('input.txt');

my @passports;
my $n = 0;

my @passport_fields;

my $valids = 0;

foreach(@data) {
    if($_ ne "\n" ) {
        chomp $_;
        if(defined $passports[$n]) {
            $passports[$n] = $passports[$n] . " " . $_;
        } else {
            $passports[$n] = $_;
        }
    } else {
        $n++;
    }
}

foreach(@passports) {
    @passport_fields = split / /, $_;
    my $passport_fields_count = @passport_fields;
    my $cid_index = index($_, "cid");
    my $invalid = 0;
    if (($passport_fields_count == 7 && $cid_index == -1) || ($passport_fields_count == 8)) {
        foreach(@passport_fields) {
            my @pair = split /:/, $_;
            switch($pair[0]) {
                case "byr"
                {
                    if(($pair[1] < 1920) || ($pair[1] > 2002)) {
                        print "invalid byr: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    }
                }
                case "iyr"
                {
                    if(($pair[1] < 2010) || ($pair[1] > 2020)) {
                        print "invalid iyr: $pair[0] -> $pair[1]\n";;
                        $invalid = 1;
                    }
                }
                case "eyr"
                {
                    if(($pair[1] < 2020) || ($pair[1] > 2030)) {
                        print "invalid eyr: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    }
                }
                case "hgt"
                {
                    if(!((length $pair[1] == 5) || (length $pair[1] == 4))){
                        print "invalid hgt length of input: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    } else {
                        my $unit = substr $pair[1], -2;
                        my $value = substr $pair[1], 0, -2;
                        if($unit eq "cm") {
                            if(($value < 150) || ($value > 193)) {
                                print "invalid: $pair[0] -> $pair[1]\n";
                                $invalid = 1;
                            }
                        } else {
                            if(($value < 59) || ($value > 76)) {
                                print "invalid: $pair[0] -> $pair[1]\n";
                                $invalid = 1;
                            }
                        }
                    }
                }
                case "hcl"
                {
                    my $leading = substr $pair[1], 0, 1;
                    my $value = substr $pair[1], 1;
                    if(($leading ne "#") || (length $value != 6)){
                        print "invalid hcl leading or value length: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    } else {
                        if(!($value =~ /\A[0123456789abcdef]+\z/i)) {
                            print "invalid hcl hex: $pair[0] -> $pair[1]\n";
                            $invalid = 1;
                        }
                    }
                }
                case "ecl"
                {
                    my @valid_ecls = qw(amb blu brn gry grn hzl oth);
                    if(!(first {$_ eq "$pair[1]"} @valid_ecls)) {
                        print "invalid ecl: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    }
                }
                case "pid"
                {
                    if(length $pair[1] != 9) {
                        print "invalid pid: $pair[0] -> $pair[1]\n";
                        $invalid = 1;
                    }
                }
            }
        }
    }
    print "----------\n";
    if($invalid == 0) {
        $valids++;
    }
}

print "Valids: $valids\n";