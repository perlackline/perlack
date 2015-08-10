#!/usr/bin/perl

use strict;
use warnings;

my $mode = '777';

chmod oct($mode) , glob 'mod*' or warn "Cannot change perm for mod0: $!";
