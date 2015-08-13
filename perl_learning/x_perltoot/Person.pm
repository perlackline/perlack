#!/usr/bin/perl

# perltoot - トムによる Perl オブジェクト指向チュートリアル
# http://perldoc.jp/docs/perl/5.14.1/perltoot.pod

package Person;
use strict;
use warnings;

#// --------------------------------------------------------
#// オブジェクトのコンストラクタ
#// --------------------------------------------------------

#sub new {
#  # 無名ハッシュのリファレンス $self
#  my $self = {};
#  #$self を初期化
#  $self->{NAME}  = undef;
#  $self->{AGE}   = undef;
#  $self->{PEERS} = [];
#  # 無名ハッシュのリファレンスをブレス
#  bless{$self);
#  return $self;
#}

# "継承" をスムーズにするために bless() に 2 つの引数を
# 渡す。
sub new {
  # クラス名
  my $class = shift;
  my $self  = {};
  $self->{NAME}  = undef;
  $self->{AGE}   = undef;
  $self->{PEERS} = [];
  bless ($self, $class);
  return $self;
}

#// --------------------------------------------------------
#// オブジェクトごとのデータにアクセスするメソッド
#// --------------------------------------------------------

# 引数があれば値をセットする (セッター ?)
# 引数がなければ値を返す (ゲッター ?)

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
  # 無名配列リファレンスに代入
  if (@_) { @{ $self->{PEERS} } = @_ }
  return @{ $self->{PEERS} };
}

#// --------------------------------------------------------
#// デストラクタ
#// --------------------------------------------------------

  # オブジェクトの始まりは "コンストラクタ"。
  # オブジェクトの終わりは "デストラクタ"。

  # コンストラクタは明示的に呼ばれる。
  # デストラクタは暗黙的に呼ばれる。

  # デストラクタの名前は DESTROY と決まっている。
  # なぜならデストラクタは Perl のガベージコレクション経由で
  # 自動的に呼び出されるため名前が決まっていなければならない。

  # デストラクタはオブジェクトの後片付けのためのコードを
  # 持っている。

  # しかし, C++ とは違い Perl では通常メモリの開放などの
  # 処理は Perl が面倒をみるので デストラクタはほとんど
  # 必要とされていない。

  # この Perlson クラスでもデストラクタは不要。

# require か use を成功させるための記述
1;

# Next: 他のオブジェクトメソッド
#http://perldoc.jp/docs/perl/5.14.1/perltoot.pod#Other32Object32Methods
