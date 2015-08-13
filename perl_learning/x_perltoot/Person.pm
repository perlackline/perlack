#!/usr/bin/perl

# perltoot - $B%H%`$K$h$k(B Perl $B%*%V%8%'%/%H;X8~%A%e!<%H%j%"%k(B
# http://perldoc.jp/docs/perl/5.14.1/perltoot.pod

package Person;
use strict;
use warnings;

#// --------------------------------------------------------
#// $B%*%V%8%'%/%H$N%3%s%9%H%i%/%?(B
#// --------------------------------------------------------

#sub new {
#  # $BL5L>%O%C%7%e$N%j%U%!%l%s%9(B $self
#  my $self = {};
#  #$self $B$r=i4|2=(B
#  $self->{NAME}  = undef;
#  $self->{AGE}   = undef;
#  $self->{PEERS} = [];
#  # $BL5L>%O%C%7%e$N%j%U%!%l%s%9$r%V%l%9(B
#  bless{$self);
#  return $self;
#}

# "$B7Q>5(B" $B$r%9%`!<%:$K$9$k$?$a$K(B bless() $B$K(B 2 $B$D$N0z?t$r(B
# $BEO$9!#(B
sub new {
  # $B%/%i%9L>(B
  my $class = shift;
  my $self  = {};
  $self->{NAME}  = undef;
  $self->{AGE}   = undef;
  $self->{PEERS} = [];
  bless ($self, $class);
  return $self;
}

#// --------------------------------------------------------
#// $B%*%V%8%'%/%H$4$H$N%G!<%?$K%"%/%;%9$9$k%a%=%C%I(B
#// --------------------------------------------------------

# $B0z?t$,$"$l$PCM$r%;%C%H$9$k(B ($B%;%C%?!<(B ?)
# $B0z?t$,$J$1$l$PCM$rJV$9(B ($B%2%C%?!<(B ?)

sub name {
  my $self = shift;
  if (@_) { $self->{NAME} = shift }
  return $self->{NAME};
}

sub age {
  my $self = shift;
  if (@_) { $self->{AGE} = shift }
  return $self->{AGE};
}

sub peers {
  my $self = shift;
  # $BL5L>G[Ns%j%U%!%l%s%9$KBeF~(B
  if (@_) { @{ $self->{PEERS} } = @_ }
  return @{ $self->{PEERS} };
}

#// --------------------------------------------------------
#// $B%G%9%H%i%/%?(B
#// --------------------------------------------------------

  # $B%*%V%8%'%/%H$N;O$^$j$O(B "$B%3%s%9%H%i%/%?(B"$B!#(B
  # $B%*%V%8%'%/%H$N=*$o$j$O(B "$B%G%9%H%i%/%?(B"$B!#(B

  # $B%3%s%9%H%i%/%?$OL@<(E*$K8F$P$l$k!#(B
  # $B%G%9%H%i%/%?$O0EL[E*$K8F$P$l$k!#(B

  # $B%G%9%H%i%/%?$NL>A0$O(B DESTROY $B$H7h$^$C$F$$$k!#(B
  # $B$J$<$J$i%G%9%H%i%/%?$O(B Perl $B$N%,%Y!<%8%3%l%/%7%g%s7PM3$G(B
  # $B<+F0E*$K8F$S=P$5$l$k$?$aL>A0$,7h$^$C$F$$$J$1$l$P$J$i$J$$!#(B

  # $B%G%9%H%i%/%?$O%*%V%8%'%/%H$N8eJRIU$1$N$?$a$N%3!<%I$r(B
  # $B;}$C$F$$$k!#(B

  # $B$7$+$7(B, C++ $B$H$O0c$$(B Perl $B$G$ODL>o%a%b%j$N3+J|$J$I$N(B
  # $B=hM}$O(B Perl $B$,LLE]$r$_$k$N$G(B $B%G%9%H%i%/%?$O$[$H$s$I(B
  # $BI,MW$H$5$l$F$$$J$$!#(B

  # $B$3$N(B Perlson $B%/%i%9$G$b%G%9%H%i%/%?$OITMW!#(B

# require $B$+(B use $B$r@.8y$5$;$k$?$a$N5-=R(B
1;

# Next: $BB>$N%*%V%8%'%/%H%a%=%C%I(B
#http://perldoc.jp/docs/perl/5.14.1/perltoot.pod#Other32Object32Methods
