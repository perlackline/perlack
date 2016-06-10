#!/usr/bin/perl

use strict;
use warnings;

use Storable;
my $result = retrieve 'hash_file';

use Data::Dumper;
#$Data::Dumper::Purity = 1;
print Dumper(\%$result);

