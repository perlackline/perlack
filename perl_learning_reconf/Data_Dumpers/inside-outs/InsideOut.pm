
# http://blog.livedoor.jp/dankogai/archives/50783623.html
# perl - Inside-out Object

# InsideOut オブジェクトは隠蔽化を強制するしくみ
# insideout.pl から呼び出す

# 例: name, uri の 2 つのインスタンス変数を持つオブジェクトの実装
#{
  package InsideOut;
  use strict;
  use warnings;
  my %objects;
  sub new {
    my $class = shift;
    bless \eval{ my $scalar }, $class;
  }
  sub DESTROY {
    my $self = shift;
    delete $objects{$self+0};
  }

  # accessor (set/get ter)
  sub name {
    my $self = shift;
    # 引数があれば set
    $objects{$self+0}{name} = shift if @_;
    # 値を返す get
    $objects{$self+0}{name};
  }
  sub uri {
    my $self = shift;
    # 引数があれば set
    $objects{$self+0}{uri} = shift if @_;
    # 値を返す get
    $objects{$self+0}{uri};
  }
  1;
#} 
