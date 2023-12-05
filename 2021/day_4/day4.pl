#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;
use Data::Dumper qw(Dumper);

sub findEntryOnBoard {
    my($value, @board_in) = @_;
    for(my $col = 0; $col < 5; $col++) {
        for(my $row = 0; $row < 5; $row++) {
            if($board_in[$col]->[$row] eq $value){
                print "Found $value at: ($col:$row)!\n";
            }
        }
    }
}

sub modifyBoardEntry {
    my($row, $col, $bid, @bds) = @_;
    $bds[$bid]->[$row]->[$col] = $bds[$bid]->[$row]->[$col] . "X";
}

my @input = read_file('test.txt');

my $first_line = $input[0];
my @drawn_numbers = split(",", $first_line);

my @boards;

my $input_length = @input;
my @input_lines;
for(my $i = 0; $i < $input_length; $i++){
    my $line = $input[$i];
    chomp $line;
    if($i == 0 || $line eq "") {
        next;
    }
    push(@input_lines, $line);
}

my $input_lines_length = @input_lines;
my $board_offset = 0;
for(my $board_idx = $board_offset; $board_idx < $input_lines_length; $board_idx+=5) {
    my @tmp_board = ();
    for(my $i = $board_offset; $i < $board_offset + 5; $i++){
        my @items = split(" ", $input_lines[$i]);
        push(@tmp_board, \@items);
    }
    push(@boards, \@tmp_board);
    $board_offset += 5;
}

for my $board (@boards){
    for(my $row_idx = 0; $row_idx < 5; $row_idx++) {
        for(my $col_idx = 0; $col_idx < 5; $col_idx++) {
            print "$board->[$row_idx]->[$col_idx] ";
        }
        print "\n";
    }
    print "\n\n";
}

findEntryOnBoard(23, $boards[0]);

modifyBoardEntry(0, 0, 0, @boards);

for my $board (@boards){
    for(my $row_idx = 0; $row_idx < 5; $row_idx++) {
        for(my $col_idx = 0; $col_idx < 5; $col_idx++) {
            print "$board->[$row_idx]->[$col_idx] ";
        }
        print "\n";
    }
    print "\n\n";
}
