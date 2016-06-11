#!/usr/bin/perl

use strict;
use warnings;

use Storable;
# [\@data1 \@data2] を復元
# ストレート
my $result = retrieve 'same_file';
# トリッキー
#my ($data1,$data2) = @{retrieve 'some_file'};

#my @data1 = $$result->[0];
#my $data1 = $result->[0];
#my $data2 = $result->[1];

#print "$data1\n";
#print "---\n";
#print map{ "$_\n" } @{$data1};
#print "---\n";
#print "---\n";
#print "$data2\n";
#print "---\n";
#print map{ "$_\n" } @{$data2};

use Data::Dumper;
$Data::Dumper::Purity = 1;
print Dumper($result);

