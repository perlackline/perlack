#!/usr/bin/perl

use strict;
use warnings;

# http://stackoverflow.com/questions/6082219/perl-regex-e-eval-modifier-with-s

use v5.10;

our $str = q(In this string we are $var the "e" modifier.);
our $var = q(testing);

V1: {
  local $_ = $str;
  s/(\$\w+)/$1/e;
  say "version 1: ", $_;
}

V2: {
  local $_ = $str;
  s/(\$\w+)/$1/ee;
  say "version 2: ", $_;
}

V3: {
  no strict "refs";
  local $_ = $str;
  s/\$(\w+)/$$1/e;
  say "version 3: ", $_;
}

