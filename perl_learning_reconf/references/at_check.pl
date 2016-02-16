#!/usr/bin/perl

use strict;
use warnings;

sub upcase_in {
  print "-- subroutine --\n";
  my $last_indx = $#_;
  print "index: $last_indx\n";
  #for (@_) { tr/a-z/A-Z/ }
  ($_[0], $_[1], $_[3])  = qw (good beter best);
  #my @ary_sub = qw (good beter best);
  #@_ = qw (good beter);
  #@_ = @ary_sub;
}

#my $v1 = 'hello';
#my $v2 = 'bye';
#
print "-- before --\n";
#print "\$v1: $v1\n";
#print "\$v2: $v2\n";

my @ary = qw(Hello bye);
print "$_\n" for @ary;

#upcase_in($v1, $v2);
upcase_in(@ary);

print "-- after --\n";
print "$_\n" for @ary;
#print "\$v1: $v1\n";
#print "\$v2: $v2\n";

