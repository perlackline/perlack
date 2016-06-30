package Avalon::Emperor;
use 5.010;
use strict;
use warnings;

# バージョン指定
our $VERSION = "0.01";

# Perl のオブジェクトはリファレンスにパッケージ名という名前を付けた
# ものと考えてもよい。
sub new {
  my $class = shift;   # パッケージ名を取得

  my %attrs = @_;        # オブジェクトの属性を受け取る
  $attrs{hp} //= 500;     # 引数が設定されなければデフォルト値を指定
  $attrs{mp} //= 100;     # 引数が設定されなければデフォルト値を指定
  $attrs{attack} //= 200; # 引数が設定されなければデフォルト値を指定

  my $self = \%attrs;  # 空のハッシュリファレンスを用意
  bless $self, $class; # bless リファレンス, パッケージ名
}

# 皇帝の必殺技
sub final_strike { "final strike"; }
sub bull_crash   { "bull crash";   }
sub tomahawk     { "tomahawk";     }
sub sky_drive    { "sky drive";    }

# 皇帝のパラメータ取得メソッド
# HP を取得する
sub get_hp {
  my $self = shift;

  return $self->{hp};
}
# MP を取得する
sub get_mp {
  my $self = shift;

  return $self->{mp};
}
# 攻撃力を取得する
sub get_attack {
  my $self = shift;

  return $self->{attack};
}
# 皇帝のパラメータ設定メソッド
# HP を設定する
sub set_hp {
  my $self = shift;
  my $hp   = shift;

  $self->{hp} = $hp;
}
# MP を設定する
sub set_mp {
  my $self = shift;
  my $mp   = shift;

  $self->{mp} = $mp;
}
# 攻撃力を設定する
sub set_attack {
  my $self = shift;
  my $attack = shift;

  $self->{attack} = $attack;
}

# パラメータ一覧を取得する
sub get_parameters {
  my $self = shift;

  my $params = {};
  while (my ($k, $v) = each %$self) {
    $params->{$k} = $v;
  }
  return $params;
}

1;
__END__

=encoding utf-8

=head1 NAME

Avalon::Emperor - It's new $module

=head1 SYNOPSIS

    use Avalon::Emperor;

=head1 DESCRIPTION

Avalon::Emperor is ...

=head1 LICENSE

Copyright (C) perlackline.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

perlackline E<lt>ohr131216@gmail.comE<gt>

=cut

