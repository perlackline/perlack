#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dumper;

our $jojo = 'stone free';

our @jojo = qw/ jonathan joseph jotaro /;

our %jojo = (
    name => 'jotaro',
    height => '195cm',
    blood_type => 'B',
    stand => 'star platinum',
);

sub jojo{ }

print Dumper *jojo{SCALAR};
print Dumper *jojo{ARRAY};
print Dumper *jojo{HASH};
print Dumper *jojo{CODE};


