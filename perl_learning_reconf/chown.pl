#!/usr/bin/perl

use strict;
use warnings;

# user ID $B$r<hF@!V(B getpwnam $B!W(B
#defined( my $user_id  = getpwnam 'ohira' ) or die 'bad user';
#defined( my $group_id = getgrnam 'ohira' ) or die 'bad user';
defined( my $user_id  = getpwnam  ) or die 'bad user';
defined( my $group_id = getgrnam  ) or die 'bad user';

print "uid: $user_id\ngid: $group_id\n";

