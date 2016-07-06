#!/usr/bin/perl

use strict;
use warnings;

#use IO::Handle;
#use IO::File;
#use Scalar::Util qw( blessed );
#use Data::Dumper;

#sub say{ print join '', @_, "\n"}
#sub say{ print join q{}, @_, "\n"}

open my $fh, '>>', 'text' or die;

#print $fh "adding this line\n";

$fh->print("adding line\n");

print $fh, "\n";
#print *{$fh}{IO}, "\n";
#print ref *{$fh}{IO}, "\n";
#say *{$fh}{IO};
#say ref *{$fh}{IO};

#say Dumper (*{$fh}{IO});

#close $fh;
