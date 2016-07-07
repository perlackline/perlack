#!/usr/bin/perl

use strict;
use warnings;

# from C


sub PrintTwoNumbers {
  my $sub = shift;
  printf "%d and %d\n", $sub->(),$sub->();
}

my $overNineThousand = sub {
  return (int(rand(100_000_000)) % 1000) + 9001;
};
my $meaningOfLife = sub {
  return 42;
};


PrintTwoNumbers(sub{rand(100_000_000)});
PrintTwoNumbers($overNineThousand);
PrintTwoNumbers($meaningOfLife);


