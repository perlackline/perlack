#!/usr/bin/perl

use strict;
use warnings;

use Tie::Hash::TwoWay;
tie my %hash, 'Tie::Hash::TwoWay';
my %list = (
  Asimov => ['novelist', 'scientist'],
  King => ['novelist', 'horror'],
  );
# these are the primary keys of the hash
foreach (keys %list){
  $hash{$_} = $list{$_};
}


# these will all print 'yes'
print $hash{scientist}, "\n";
print $hash{novelist}->{Asimov}, "\n";
print $hash{novelist}->{King}, "\n";
print $hash{King}->{novelist}, "\n";

## these will all print 'yes'
#print 'yes' if exists $hash{scientist};
#print 'yes' if exists $hash{novelist}->{Asimov};
#print 'yes' if exists $hash{novelist}->{King};
#print 'yes' if exists $hash{King}->{novelist};
