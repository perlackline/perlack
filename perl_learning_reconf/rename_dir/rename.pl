#!/usr/bin/perl

use strict;
use warnings;

## $B%U%!%$%kL>0l3gJQ49(B ($BB8:_%A%'%C%/$J$7(B)
#foreach my $file ( glob "*.old" ) {
#  # $BHsGK2uCV49(B
#  (my $newfile = $file) =~ s/\.old$/.new/;
#  rename $file, $newfile;
#}

# $B%U%!%$%kL>0l3gJQ49(B ($BB8:_%A%'%C%/$"$j(B)
foreach my $file ( glob "*.old" ) {

  (my $newfile = $file) =~ s/\.old$/.new/;
  # $B%U%!%$%k%F%9%H(B
  if ( -e $newfile ) {
    warn "$newfile already exists.\n";
  } elsif ( rename $file, $newfile ) {
    # $B2?$b$7$J$$(B
  } else {
    warn "rename $file to $newfile faild: $!\n";
  }
}

