#!/usr/bin/perl

use strict;
use warnings;

my $str = 'I love ruby';

$str =~ s/ruby/perl/;

print "$str\n";

# デリミタの変更 

my $path =  '/etc/local/bin/perl';

# \ エスケープで | は正しく機能する
$path =~ s|(usr\|etc)|var|;

print "$path\n";

