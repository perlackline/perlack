#!/usr/bin/env perl
use strict;
use warnings;

my $my_speed;
tie $my_speed, 'Nice', $$;

print "$my_speed\n";

