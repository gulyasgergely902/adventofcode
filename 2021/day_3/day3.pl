#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper;

my @input = read_file('input.txt');
#my @input = read_file('test.txt');

sub getMostCommonValue{
    my($row, @binaryArray) = @_;
    my $length = @binaryArray;
    my $one_count = 0;
    foreach(@binaryArray) {
        if(!defined($_)) {
            $length--;
            next;
        }
        if(substr($_, $row, 1) == 1){
            $one_count++;
        }
    }
    if($one_count >= ($length / 2)) {
        return 1;
    } else {
        return 0;
    }
}

sub getBinaryLength{
    my(@arr) = @_;
    my $str = $arr[0];
    chomp $str;

    return length($str);
}

sub invertBinary{
    my($binary) = @_;
    my $inv_bin = "";
    for(my $i = 0; $i < length($binary); $i++){
        if(substr($binary, $i, 1) == 1) {
            $inv_bin = $inv_bin . "0";
        } else {
            $inv_bin = $inv_bin . "1";
        }
    }

    return $inv_bin;
}

sub countUndef{
    my(@array) = @_;
    my $undefCount = 0;
    foreach(@array){
        if(!defined($_)){
            $undefCount++;
        }
    }
    return $undefCount;
}

{
    my $gamma_rate = 0;
    my $epsilon_rate = 0;

    my %hash;

    my $length = @input;
    foreach(@input) {
        my $curr = $_;
        chomp $curr;
        my @splitted = split(//, $curr);
        for(my $i = 0; $i < @splitted; $i++) {
            $hash{$i} += $splitted[$i];
        }
    }

    foreach(keys %hash) {
        if($hash{$_} > ($length / 2)) {
            $hash{$_} = 1;
        } else {
            $hash{$_} = 0;
        }
    }

    my $most_common_bit = "";
    my $least_common_bit = "";
    my $binary_length = getBinaryLength(@input);
    for(my $i = 0; $i < $binary_length; $i++) {
        $most_common_bit = $most_common_bit . getMostCommonValue($i, @input);
    }
    $least_common_bit = invertBinary($most_common_bit);

    $gamma_rate = oct("0b".$most_common_bit);
    print "Gamma rate: $gamma_rate\n";

    $epsilon_rate = oct("0b".$least_common_bit);
    print "Epsilon rate: $epsilon_rate\n";

    my $p1_answer = $gamma_rate * $epsilon_rate;
    print "P1 Answer: $p1_answer\n";
}
{
    my @possibles;
    my $common = getMostCommonValue(0, @input);
    foreach(@input) {
        if(substr($_, 0, 1) == $common){
            push(@possibles, $_);
        }
    }

    my $binLength = getBinaryLength(@possibles);

    for(my $i = 1; $i < $binLength; $i++) {
        $common = getMostCommonValue($i, @possibles);
        my $sizeOfPossibles = @possibles;
        for(my $posIdx = 0; $posIdx < $sizeOfPossibles; $posIdx++) {
            if(!defined($possibles[$posIdx])) {
                next;
            }
            if(substr($possibles[$posIdx], $i, 1) != $common){
                $possibles[$posIdx] = undef;
            }
        }
    }

    my $o2rating;
    foreach(@possibles){
        if(defined($_)){
            $o2rating = $_;
            chomp $o2rating;
            $o2rating = oct("0b".$o2rating);
        }
    }
    #print "O2 Rating: $o2rating\n";

    #Co2 rating
    @possibles = ();
    my $least_common = invertBinary(getMostCommonValue(0, @input));
    foreach(@input) {
        if(substr($_, 0, 1) == $least_common){
            push(@possibles, $_);
        }
    }

    $binLength = getBinaryLength(@possibles);

    for(my $i = 1; $i < $binLength; $i++) {
        my $sizeOfPossibles = @possibles;
        my $undefCount = countUndef(@possibles);
        if($sizeOfPossibles == $undefCount + 1) {
            last;
        }
        $least_common = invertBinary(getMostCommonValue($i, @possibles));
        #print "Part $i least common: $least_common\n";
        for(my $posIdx = 0; $posIdx < $sizeOfPossibles; $posIdx++) {
            if(!defined($possibles[$posIdx])) {
                next;
            }

            #print "Checking: $possibles[$posIdx]\n";
            if(substr($possibles[$posIdx], $i, 1) != $least_common){
                #print "removing $possibles[$posIdx]\n";
                $possibles[$posIdx] = undef;
            }
        }
    }

    my $co2rating;
    foreach(@possibles){
        if(defined($_)){
            $co2rating = $_;
            chomp $co2rating;
            $co2rating = oct("0b".$co2rating);
        }
    }
    #print "Co2 Rating: $co2rating\n";

    my $p2_answer = $o2rating*$co2rating;
    print "P2 Answer: $p2_answer\n";
}
