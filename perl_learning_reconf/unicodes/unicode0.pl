#!/usr/bin/perl

use strict;
use warnings;

use utf8;
use Unicode::Normalize;

# U+FB01        - 合字 fi 
# U+0065 U+0301 - 分解形の e (e の上にダッシュ) 
# U+00E9        - 合成形の e (e の上にダッシュ) 

binmode STDOUT, ':utf8';

my $string =
    "Can you ¥x{FB01}nd my r¥x{E9}sum¥x{E9}?";

if( $string =~ /¥x{65}¥x{301}/ ){
    print "Oops! Matched a decomposed e(')¥n";
}
if( $string =~ /¥x{E9}/ ){
    print "Yay! Matched a composed e(')¥n";
}

my $nfd = NFD( $string );
if ( $nfd =~ /¥x{E9}/ ) { 
    print "Oops! Matched a comosed e(')¥n";
}
if ( $nfd =~ /fi/ ) {
    print "Oops! Matched a decomposed fi¥n";
}

my $nfkd = NFKD ( $string );
if ( $string =~ /fi/ ) {
    print "Oops! Matched a decomposed fi¥n";
}
if ( $nfkd =~ /fi/ ) {
    print "Yay! Matched a decomposed fi¥n";
}
if ( $nfkd =~ /¥x{65}¥x{301}/ ) {
    print "Yay! Matched a decomposed e(')¥n";
}

print "\n", NFKD($string), "\n";
