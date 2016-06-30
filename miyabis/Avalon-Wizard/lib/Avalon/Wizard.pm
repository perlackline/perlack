package Avalon::Wizard;
use 5.010;
use strict;
use warnings;

# Avalon::Emperor を親としてメソッドを継承する
# パッケージ名をリストとして複数記述すれば多重継承も可能
use parent 'Avalon::Emperor';

our $VERSION = "0.01";

sub new {
  my $class = shift;     # パッケージ名を取得
  my %attrs = @_;        # オブジェクトの属性を受け取る
  $attrs{hp} //= 100;    # 引数が設定されなければデフォルト値を指定
  $attrs{mp} //= 500;    # 引数が設定されなければデフォルト値を指定
  $attrs{attack} //= 50; # 引数が設定されなければデフォルト値を指定
  my $self = \%attrs;    # 空のハッシュリファレンスを用意
  bless $self, $class;   # bless リファレンス, パッケージ名
}

# 魔法使いの必殺技
sub fire     { say "fire";     }
sub blizzard { say "blizzard"; }
sub thunder  { say "thunder";  }
sub cure     { say "cure";     }

1;
__END__

=encoding utf-8

=head1 NAME

Avalon::Wizard - It's new $module

=head1 SYNOPSIS

    use Avalon::Wizard;

=head1 DESCRIPTION

Avalon::Wizard is ...

=head1 LICENSE

Copyright (C) perlackline.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

perlackline E<lt>ohr131216@gmail.comE<gt>

=cut

