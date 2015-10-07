#!/usr/bin/perl

use strict;
use warnings;

# P191
# もっと簡単にゲッターとセッターを作る

package Animal;
use Class::MethodMaker
  new_with_init => 'new',
  get_set => [-eiffel => [qw(color height name age)]];
  abstract => [qw(sound)],
;
sub init {
  ...

# =====================================--
# named, name, color, eat, speak, age, weight, height

use Data::Dumper;

print "\n---\n";
my $color = Animal->set_color('blue');
print "$color\n";
print Animal->color, "\n";;
print "---\n\n";

print "End of program.\n";

