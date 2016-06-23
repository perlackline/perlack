#!/usr/bin/perl

use strict;
use warnings;

#my $bellri  = sub { print "Bellri: Hey there, I'm Bellri!\n" };
#my $aida    = sub { print "Aida: I'm from Ameria.\n" };
#my $raraiya = sub { print "Raraiya: Chuchumy!\n" };
#
#my %sub_ary = ( Bellri  => $bellri,
#                Aida    => $aida,
#                Raraiya => $raraiya,
#);
#
#foreach my $key ( keys %sub_ary ){
#  $sub_ary{$key}->();
#}

my $sub_hash = { bellri  => sub { print "Bellri: Hey there, I'm Bellri!\n" },
                 aida    => sub { print "Aida: I'm from Ameria.\n" },
                 raraiya => sub { print "Raraiya: Chuchumy!\n" },
};

foreach my $key ( keys %{ $sub_hash } ){
  $$sub_hash{$key}->();
}

