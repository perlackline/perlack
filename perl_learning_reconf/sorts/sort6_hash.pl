#!/usr/bin/perl

use strict;
use warnings;
use utf8;

# set hash
my %in_the_pocket = (
        Al     => 148,
        Chris  => 168,
        Bernie => 181,
        Extra1 => 148,
        Extra2 => 148,
        Extra3 => 148,
);

# sort
my @a_order = 
  sort by_num_and_name keys %in_the_pocket;

# get format
my $format = high_water_mark(keys %in_the_pocket);

# print
foreach (@a_order) {

  # using printf
  printf $format, $_, $in_the_pocket{$_};
}

# --- subroutine ---
# sort
sub by_num_and_name {
	$in_the_pocket{$b} <=> $in_the_pocket{$a}
	or
	$a cmp $b
}

# format
sub high_water_mark {
    my $ref_length = shift;
    my $max_length = length $ref_length;

    foreach (@_) {
        my $next_length = length $_;

        if ($next_length > $max_length) {
            $max_length = $next_length;
        }
    }
    # return format
    "%-${max_length}s = %-${max_length}s\n";
}

