#!/usr/bin/perl

use strict;
use warnings;

# 2/3
print "---- 2/3\n";
while (chomp(my $input = <STDIN>)) {
  if ($input =~ 0) {
    last;
  }
  if ($input =~ /[pP]erl/){
    print "Find Perl!\n";
  }
  if ($input =~ /python/i){
    print "Find Python!\n";
  }
  if ($input =~ /(perl|ruby|python)/){
    print "Love Programming!\n";
  }
}

# 3/3
print "---- 3/3\n";
while (chomp(my $input = <STDIN>)) {
  if ($input =~ 0) {
    last;
  }
  if ($input =~ /^papix/){
    print "Find papix!\n";
  }
  if ($input =~ /Hello/){
    my %matches = reverse ($input =~ /(Hello) (\w+)/g);
    foreach my $key (keys %matches){
      print "$matches{$key}! $key!\n";
    }
  }
}

