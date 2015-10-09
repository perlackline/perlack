#!/usr/bin/perl

# http://blog.fenrir-inc.com/jp/2011/06/post_51.html

use strict;
use warnings;

use HTML::Entities;
use Encode;
use Data::Dumper;

my $text = Encode::decode('utf8', '| |&$32;|&nbsp;|');
HTML::Entities::decode_entities($text);
my $encoded = Encode::encode('utf8', $text);
print $text, "\n";
print Dumper $text;
print $encoded, "\n";

