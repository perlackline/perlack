#!/usr/bin/perl
use strict;
use warnings;
#{
#  # backward compatible
#  my $text = '漢字、カタカナ、ひらがなの混じったtext';
#	print substr($text,9,12);
#}	
#{
#  use utf8;
#  my $text = '漢字、カタカナ、ひらがなの混じったtext';
#	binmode STDOUT, ':utf8';
#	print substr($text,3,4);
#}	
use utf8;
{
  # enfoce backward compatible using 'bytes' pragma
	use bytes;
  my $text = '漢字、カタカナ、ひらがなの混じったtext';
	# カタカナ
	print substr($text,9,12);
}

