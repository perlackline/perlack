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

#// --------------------------------------------------------
#// $BB>$N%*%V%8%'%/%H%a%=%C%I(B
#// --------------------------------------------------------

  # $B:#$^$G$N%a%=%C%I$O%3%s%9%H%i%/%?$+$^$?$OC1=c(B
  # $B$J%G!<%?%a%=%C%I$G%*%V%8%'%/%H$N%G!<%?$X$N%$(B
  # $B%s%?!<%U%'%$%9!#(B

  # $B$3$l$i$N%G!<%?$O(B C++ $B$N%*%V%8%'%/%H$N%G!<%?%a(B
  # $B%s%P$K;w$F$$$k!#(B

  # $B%*%V%8%'%/%H$N%G!<%?$K$OD>@\%"%/%;%9$;$:$K%a(B
  # $B%=%C%I7PM3$G%"%/%;%9$5$l$k$Y$-!#(B

  # $B%a%=%C%I$O%G!<%?$K%"%/%;%9$9$k$@$1$G$J$/$J$s(B
  # $B$G$b$G$-$k!#(B
 
  # $B%a%=%C%I$O%*%V%8%'%/%H$+%a%=%C%I$rGX7J$K8F$S(B
  # $B=P$5$l$k!#(B

  # $BNc$($P(B 1 $B$D$N%U%#!<%k%I$+$iCM$r;}$C$F$-$?$j%;%C(B
  # $B%H$7$?$j$9$k0J>e$N$3$H$r$9$k%*%V%8%'%/%H%a%=%C(B
  # $B%I!#(B

---
sub exclaim {
    my $self = shift;
    return sprintf "Hi, I'm %s, age %d, working with %s",
      $self->{NAME}, $self->{AGE},
      join(", ", @{$self->{PEERS}});
}
---

  # $B$^$?$O<!$N$h$&$J$b$N(B

---
sub happy_birthday {
    my $self = shift;
    return ++$self->{AGE};
}
---

  # $B<!$N$h$&$JJ}K!$b(B

---
sub exclaim {
    my $self = shift;
    return sprintf "Hi, I'm %s, age %d, working with %s",
      $self->name, $self->age, join(", ", $self->peers);
}

sub happy_birthday {
    my $self = shift;
    return $self->age( $self->age() + 1 );
}
---

  # $B$3$l$i%a%=%C%I$O%/%i%9<+?H$G$9$Y$F<B9T$G$-$k!#(B

  # $BD>@\%O%C%7%e$X%"%/%;%9$9$k$H4V@\E*$J%"%/%;%9(B
  # $B$h$j$b7e0c$$$KB.$/J8;zNs$NJQ99$K$bJXMx!#(B

#// --------------------------------------------------------
#// $B%/%i%9%G!<%?(B
#// --------------------------------------------------------

  # $B%/%i%9%G!<%?(B $B$H$O(B
  # $B%/%i%9$N3F%*%V%8%'%/%H$K6&DL$N%G!<%?%"%$%F%`!#(B

  # $BNc$($P(B $Person::Census $B$H$$$&%0%m!<%P%kJQ?t$rMQ0U(B
  # $B$9$l$P%f!<%6$,D>@\%/%i%9%G!<%?$rF@$F(B, $BJQ99$9$k$3(B
  # $B$H$b2DG=!#(B

  # ($B%*%V%8%'%/%H;X8~$G$O$J$$(B) $BEAE}E*$J%b%8%e!<%k$G$O(B
  # $B%/%i%9JQ?t$r%0%m!<%P%kJQ?t$K$9$k$3$H$,4|BT$5$l$F(B
  # $B$$$k$,(B,

  # $B%*%V%8%'%/%H;X8~%b%8%e!<%k$G$O%G!<%?$rJ]8n$9$k(B
  # $B%Y!<%k@_$1$F<BAu$H%$%s%?!<%U%'!<%9$rJ,N%$9$k!#(B
 
  # $B%*%V%8%'%/%H$N%G!<%?$K%"%/%;%9$9$k%*%V%8%'%/(B
  # $B%H%$%s%?!<%U%'!<%9$HF1$8$h$&$K%/%i%9%G!<%?$K(B
  # $B%"%/%;%9$9$k%/%i%9%a%=%C%I$rDs6!$9$k!#(B

  # $B$?$$$F$$$O(B, $B%/%i%9%G!<%?$r%U%!%$%k%9%3!<%W$N(B
  # $B%l%-%7%+%kJQ?t$K$7$?$$$J$i%U%!%$%k>e$GC1=c$K(B
  # $B<!$N$b$N$rCV$/!#(B

---
my $Census = 0;
---

  # my() $B$N%9%3!<%W$O@k8@$5$l$?%V%m%C%/$,=*$o$C$?(B
  # $B$H$-$,4|8B$G%9%3!<%WFb$G@k8@$5$l$?4X?t$K%"%/(B
  # $B%;%9$G$-$k4V$OJQ?t$,3d$jEv$F2r=|$5$l$J$$$3$H$r(B
  # $BJ]>Z$9$k!#(B

  # local() $B$G0l;~E*$JCM$rM?$($i$l$?%0%m!<%P%kJQ?t(B
  # $B$G$OF/$+$J$$!#(B

  # $Census $B$r%Q%C%1!<%8$N%0%m!<%P%kJQ?t$N$^$^$K$9(B
  # $B$k$+Be$o$j$K%U%!%$%k%9%3!<%W$N%l%-%7%+%kJQ?t$K(B
  # $B$9$k$+$I$&$+$K4X$o$j$J$/(B Person::new() $B%3%s%9(B
  # $B%H%i%/%?$K<!$N$h$&$JJQ99$r$9$k!#(B

---
sub new {
    my $class = shift;
    my $self  = {};
    $Census++;
    $self->{NAME}  = undef;
    $self->{AGE}   = undef;
    $self->{PEERS} = [];
    bless ($self, $class);
    return $self;
}

sub population {
    retunr $Census;
}
---

  # $B$3$&$9$k$H(B, Person $B$,2u$l$?$H$-$N$?$a$K(B $Census
  # $B$r8:$i$9<!$N$h$&$J%G%9%H%i%/%?$,I,MW$K$J$k!#(B

---
sub DESTROY { --$Census }
---

  # $B%G%9%H%i%/%?Fb$G3d$jEv$F2r=|$9$k$?$a$N%a%b%j(B
  # $B$,$J$$>l9g$O(B Perl $B$,$&$^$$$3$HBP1~$9$k!#(B

  # $BBe$o$j$K(B CPAN $B$+$i(B Class::Data::Inheritable $B%b%8%e!<(B
  # $B%k$r;H$&$3$H$b2DG=!#(B

#// --------------------------------------------------------
#// $B%/%i%9%G!<%?$K%"%/%;%9$9$k(B
#// --------------------------------------------------------
http://perldoc.jp/docs/perl/5.14.1/perltoot.pod#Accessing32Class32Data

...
