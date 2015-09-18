#!/usr/bin/perl

use 5.010001;

use strict;
use warnings;

my $fred = 'Fred';

given ( $fred ) {
    # Match ! continue is run
    when ( /Fred/   )  { say 'Name is Fred'; continue }
    # Match ! continue is run
    when ( /ed\Z/ )  { say 'Name ends with ed'; continue }
    # Unmatch ! continue is no run
    when ( /zzz/i  )  { say 'Name has zzz in it' } 

    # This block is run, because break not worked.
    default            { say "I don't see a Fred" }
}


