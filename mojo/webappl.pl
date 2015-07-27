#!/usr/bin/perl

# ref
# http://d.hatena.ne.jp/perlcodesample/20140325/1395723602

# Mojolicious::Lite $B$NFI$_9~$_(B
# $B$3$l$G(B use strict $B$H(B use wartnings $B$,(B
# $B<+F0$GM-8z$K$J$k(B
use Mojolicious::Lite;

# get $B4X?t$G%k!<%F%#%s%0$N@_Dj!#(B
# $BBh0l0z?t$O(B URL $B%Q%?!<%s!#(B
# $B:G8e$N0z?t$O<B9T$9$k=hM}!#(B
# $B<B9T$9$k=hM}$OL5L>%5%V%k!<%A%s$N(B
# $B%j%U%!%l%s%9$H$7$F5-=R$9$k!#(B
# $B0J2<$O(B get ( '/', sub{ ... } ) $B$HF1$8!#(B
get '/' => sub {

  # $B%3%s%H%m!<%i!<%*%V%8%'%/%H$N<hF@!#(B
  # (Mojplicious::Controller $B%*%V%8%'%/%H(B)
  # HTTP $B%j%/%(%9%H$4$H$K@8@.$5$l$k!#(B
  my $self = shift;

  # $B%3%s%F%s%D$NIA2h(B
  $self->render(text => 'Hello World');

# $B$3$N%5%V%k!<%A%s$r%3%s%H%m!<%i!<$H8F$V!#(B
# $B%3%s%H%m!<%i!<$O(B $c $B$HI=8=$9$k>l9g$,$"$k!#(B
};

# Mojolicious $B%"%W%j%1!<%7%g%s$N3+;O(B
app->start;

#use Mojolicious::Lite;
#
#get '/' => sub {
#  my $self = shift;
#
#  $self->render(text => 'Hello World');
#};
#
#app->start;
