#!/usr/bin/perl

use strict;
#use warnings;

require "req_1.pm";
require "req_2.pm";

Req_1::print();
Req_2::print();

print "$Req_1::req1";

