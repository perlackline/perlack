#!/usr/bin/perl

use strict;
use warnings;

print &{ sub{ print "hello\n" } };
