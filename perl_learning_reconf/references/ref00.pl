#!/usr/bin/perl

use strict;
use warnings;

# chack items

#my $hold = shift or help();
#my @hold = split //, $hold;

my @hold = qw(5 6 0);

print "main: $_\n" for @hold;

print "\n";
check_require(@hold);
print "\n";

print "main: $_\n" for @hold;

# ---
sub check_require {
  my @requires = qw(1 2 3);
  my @hold_sub = @_;
  foreach my $item (@requires) {
    #unless (grep $item eq $_, @hold_sub) {
    unless (grep $item eq $_, @_) {
      print "missinng $item\n";
      shift @_;
      unshift @_, $item;
      #$hold_sub[$#hold_sub] = $item;
      #push @_, $item;
    }
  }
  print "sub: $_\n" for @_;
  #@_ = qw();
}
  
#sub help {
#  print "Please set any args\n";
#  die "\n";
#}

