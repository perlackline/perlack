package People3;

use strict;
use warnings;

# Exporter を継承
use parent qw(Exporter);

# デフォルトのシンボルをセット
our @EXPORT_OK = qw(func1 func2 func_a func_b);
our %EXPORT_TAGS = ( num => [qw(func1 func2)], alp => [qw(func_a func_b)] );
{
  my %seen;
  push @{$EXPORT_TAGS{all}}, 
    grep {!$seen{$_}++} @{$EXPORT_TAGS{$_}} foreach keys %EXPORT_TAGS;
}


sub func1 {
  'func one';
}
sub func2 {
  'func two';
}

sub func_a {
  'func A';
}
sub func_b {
  'func B';
}

1;
