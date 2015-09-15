#!/usr/bin/perl

use strict;
use warnings;
use utf8;

#// --- Table War in the Pocket ---
# --------------------------------------------
#         ID   fname     laname    fines items
# --------------------------------------------
#Al     : (00) Alfred    Izuruha   0     2
#Bernie : (01) Bernard   Wiseman   3     2
#Chris  : (02) Christina Mackenzie 0     3
#Extra1 : (03) Man       Extra1    0     1
#Extra1 : (04) Woman     Extra2    0     0
# --------------------------------------------

#// --- Item set ---

# set ID
my @patron_ids = 0 .. 4;

# set personal_name
my %personal_name = (
    0 => 'Alfred',
    1 => 'Bernard',
    2 => 'Christina',
    3 => 'Man-B',
    4 => 'Man-A',
);
# set family_name
my %family_name = (
    0 => 'Izuruha',
    1 => 'Wiseman',
    2 => 'Mackenzie',
    3 => 'Extra',
    4 => 'Extra',
);

# set fines
my %delay = (
    0 => 0,
    1 => 3,
    2 => 0,
    3 => 0,
    4 => 0,
);

# set items
my %items = (
    0 => 2,
    1 => 2,
    2 => 3,
    3 => 0,
    4 => 0,
);

#// --- subroutine ---

sub fines {
  my $id = shift;
  my $fines = 0;
  $fines = $items{$id} * $delay{$id} * 1.25;
}

#// --- processing ---

# sort !
my @sorted = sort {
        fines($b)  <=> fines($a) or
        $items{$b} <=> $items{$a} or
        $family_name{$a} cmp  $family_name{$b} or
        $personal_name{$a} cmp $personal_name{$b} or
        $a <=> $b
    } @patron_ids;

# print
foreach (@sorted) {
    print "---\n";
    print "ID: $_, $personal_name{$_} $family_name{$_}\n";
    print "Items: $items{$_}\nfines: ",fines($_), "\n";
}

