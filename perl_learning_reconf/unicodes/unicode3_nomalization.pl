#!/usr/bin/perl

use strict;
use warnings;

use utf8;
use Unicode::Normalize;
#use charnames qw(:full);

# U+FB01        - 合字 fi 
# fi
# fi
# U+0065 U+0301 - 分解形の e (e の上にダッシュ) 
# é
# U+00E9        - 合成形の e (e の上にダッシュ) 
# é
# U+0061 U+0308
# ä
# U+00E4
# ä

binmode STDOUT, ':utf8';

sub output {
  my ($string, $format) = @_;
  print "$format:\t$string\t";
  my @codes = map { sprintf "%04x", unpack("U",$_) } split //,$string;
  print join(',', @codes), "\n";
}
my @str = qw(ä é ä ﬁ ä é);

my $composed   = "\x{00E9}"; 
my $decomposed = "\x{0065}\x{0301}";
my $ligature   = "ﬁ";
my $japanese   = "ぱ";
my $jp_dec  = "\x{306F}\x{309A}";
my $nfd = "\x{1FFD}";
print "composed   : $composed\n";
print "decomposed : $decomposed\n";
print "ligature   : $ligature\n";

my $str_NFD = NFD($composed);
my $str_NFC = NFC($composed);
my $str_NFKD = NFKD($composed);
my $str_NFKC = NFKC($composed);
print "---\n";
output($composed, 'RAW');
print "\n";
output($str_NFD, 'NFD');
output($str_NFC, 'NFC');
output($str_NFKD, 'NFKD');
output($str_NFKC, 'NFKC');
print "---\n";

print "---\n";
$str_NFD = NFD($decomposed);
$str_NFC = NFC($decomposed);
$str_NFKD = NFKD($decomposed);
$str_NFKC = NFKC($decomposed);
print "---\n";
output($decomposed, 'RAW');
print "\n";
output($str_NFD, 'NFD');
output($str_NFC, 'NFC');
output($str_NFKD, 'NFKD');
output($str_NFKC, 'NFKC');

