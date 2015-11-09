#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Encode;

my $str = "<blockquote>こんにちは/:+*]今日は良い天気です!</blockquote>";

my $result = encode('utf-8', quotemeta ($str));

print "$result\n";

