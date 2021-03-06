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

#// --------------------------------------------------------
#// 他のオブジェクトメソッド
#// --------------------------------------------------------

  # 今までのメソッドはコンストラクタかまたは単純
  # なデータメソッドでオブジェクトのデータへのイ
  # ンターフェイス。

  # これらのデータは C++ のオブジェクトのデータメ
  # ンバに似ている。

  # オブジェクトのデータには直接アクセスせずにメ
  # ソッド経由でアクセスされるべき。

  # メソッドはデータにアクセスするだけでなくなん
  # でもできる。
 
  # メソッドはオブジェクトかメソッドを背景に呼び
  # 出される。

  # 例えば 1 つのフィールドから値を持ってきたりセッ
  # トしたりする以上のことをするオブジェクトメソッ
  # ド。

---
sub exclaim {
    my $self = shift;
    return sprintf "Hi, I'm %s, age %d, working with %s",
      $self->{NAME}, $self->{AGE},
      join(", ", @{$self->{PEERS}});
}
---

  # または次のようなもの

---
sub happy_birthday {
    my $self = shift;
    return ++$self->{AGE};
}
---

  # 次のような方法も

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

  # これらメソッドはクラス自身ですべて実行できる。

  # 直接ハッシュへアクセスすると間接的なアクセス
  # よりも桁違いに速く文字列の変更にも便利。

#// --------------------------------------------------------
#// クラスデータ
#// --------------------------------------------------------

  # クラスデータ とは
  # クラスの各オブジェクトに共通のデータアイテム。

  # 例えば $Person::Census というグローバル変数を用意
  # すればユーザが直接クラスデータを得て, 変更するこ
  # とも可能。

  # (オブジェクト指向ではない) 伝統的なモジュールでは
  # クラス変数をグローバル変数にすることが期待されて
  # いるが,

  # オブジェクト指向モジュールではデータを保護する
  # ベール設けて実装とインターフェースを分離する。
 
  # オブジェクトのデータにアクセスするオブジェク
  # トインターフェースと同じようにクラスデータに
  # アクセスするクラスメソッドを提供する。

  # たいていは, クラスデータをファイルスコープの
  # レキシカル変数にしたいならファイル上で単純に
  # 次のものを置く。

---
my $Census = 0;
---

  # my() のスコープは宣言されたブロックが終わった
  # ときが期限でスコープ内で宣言された関数にアク
  # セスできる間は変数が割り当て解除されないことを
  # 保証する。

  # local() で一時的な値を与えられたグローバル変数
  # では働かない。

  # $Census をパッケージのグローバル変数のままにす
  # るか代わりにファイルスコープのレキシカル変数に
  # するかどうかに関わりなく Person::new() コンス
  # トラクタに次のような変更をする。

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

  # こうすると, Person が壊れたときのために $Census
  # を減らす次のようなデストラクタが必要になる。

---
sub DESTROY { --$Census }
---

  # デストラクタ内で割り当て解除するためのメモリ
  # がない場合は Perl がうまいこと対応する。

  # 代わりに CPAN から Class::Data::Inheritable モジュー
  # ルを使うことも可能。

#// --------------------------------------------------------
#// クラスデータにアクセスする
#// --------------------------------------------------------

  # クラスデータを絶えず取り扱うやり方はよろしくない。

  # 十分に拡張的なルールはオブジェクトメソッドか
  # ら直接クラスデータを参照しないこと。

  # 直接クラスデータを参照するなら拡張的で継承可能な
  # クラスは作らないこと。
   
  # オブジェクトはすべてのオペレーション (特にオ
  # ブジェクトメソッド) のためにランデブーポイン
  # トにいなければならない。
   
  # グローバル変数 (クラスデータ) はある意味で派
  # 生クラスの中で "間違った" パッケージにある。
   
  # Perl では
  # メソッドはメソッドが定義されたクラス内のコンテキスト
  # で実行するもので
  # メソッドが動かされたオブジェクトのコンテキストではない。

  # そのため 名前空間 - メソッド内で目に見えるパッケージ
  # のグローバル変数の名前空間 - は継承と無関係。

  # 例えば他のクラスが上で定義した Person クラスの
  # DESTROY メソッドを継承して借りたとして
  # この他のクラスのオブジェクトが破壊されたら
  # オリジナルの $Census 変数は変更されるが, それは
  # 新しいクラスパッケージの名前空間にある $Census ではない。
   
  # これを修正するにはハッシュキー "_CENSUS" でアクセスされる
  # 値のデータにリファレンスを格納する。
  # アンダースコアで始まるこのフィールドは他の NAME や AGE など
  # のパブリックなデータメンバではない特殊なデータ。

---
sub new {
    my $class = shift;
    my $self  = {};
    $self->{NAME}  = undef;
    $self->{AGE}   = undef;
    $self->{PEERS} = [];
    # "private" data
    $self->{"_CENSUS"} = \$Census;
    bless ($self, $class);
    ++ ${ $self->{"_CENSUS"} };
    return $self;
}

sub population {
    my $self = shift; 
    if (ref $self) {
        return ${ $self->{"_CENSUS"} };
    } else {
        return $Census;
    }
}

sub DESTROY {
    my $self = shift;
    -- ${ $self->{"_CENSUS"} };
}
---

#// --------------------------------------------------------
##// デバッグメソッド
#// --------------------------------------------------------

  # クラスにデバッグメソッドがあるのは一般的。
  #
  # 例えばオブジェクトが生成される時や破壊されるときに
  # デバッグの情報をみるためにはデバッグの値をファイルスコープ
  # のレキシカル変数に加える。

  # このためには Carp モジュールを使う。
  # Carp モジュールは警告と致命的なメッセージを発することが
  # できる。

---
use Carp;
my $Debugging = 0;

... .

sub debug {
    my $class = shift;
    if (ref $class) {
      confess "Class method called as object method"
    }
    unless (@_ == 1) {
      confess "usage: CLASSNAME->debug(level)"
    }
    $Debugging = shift;
}
---

  # DESTROY メソッドを修正してオブジェクトが失効する前に
  # 一言言うようにする。

---
sub DESTROY {
    my $self = shift;
    if ($Debugging) {
      carp "Destroying $self " . $self->name
    }
    -- ${ $self->{"_CENSUS"} };
}
---

  # オブジェクトごとにデバッグ状態を持ちたい場合。

---
Person->debug(1);  # entire class
$him->debug(1);    # just this object
---

  # こうするためには, "二項の" メソッドでなければならない。
  # "二項の" メソッドとはクラス及びオブジェクトの両方で動くメソッド。

  # "二項の" メソッドにするため debug() と DESTROY メソッドを
  # 次のように調整する。

---
sub debug {
    my $self = shift;
    confess "usage: thing->debug(level)" unless @_ == 1;
    my $level = shift;
    if (ref($self)) {
      $self->{"_DEBUG"} = $level; # just myself
    } else {
      $Debugging        = $level; # whole class
    }
}

sub DESTROY {
    my $self = shift;
    if ($Debugging || $self->{"_DEBUG"}) {
      carp "Destroying $self " . $self->name;
    }
    -- ${ $self->{"_CENSUS"} };
}
---

  # Employee (従業員) と呼ばれる 派生クラスが Person 基
  # 底クラスからメソッドを継承していると何がおきるか ?

  # Employee->debug() はクラスメソッドとして呼ばれた場合,
  # $Employee::Debugging ではなく
  # $Person::Debugging を操作する。

#// --------------------------------------------------------
##// クラスのデストラクタ
#// --------------------------------------------------------

  # オブジェクトのデストラクタはオブジェクトの死を個別に扱う。

  # しかしエントリークラスがシャットダウンしたときに少し掃除
  # したいときがある。通常はプログラムが終了する時に掃除され
  # る。

  # クラス毎の掃除を行うためのクラスのデストラクタを作るため
  # には, クラスパッケージの中に END という名前の関数を作る。

  # END は伝統的なモジュールの END 関数と似ている。
 
  # END はプログラムが実行されない, 捕らえられないシグナル
  # で死ぬなど, プログラムが終了したときに呼ばれる。

---
sub END {
    if ($Debugging) {
        print "All persons are going away now.\n";
    }
}
---

  # プログラムが終了したとき
  # 全てのクラスデストラクタ (END 関数) は,
  # クラスがロードされたのと反対の順番 (LIFO の順番)
  # で呼ばれる。

#// --------------------------------------------------------
##// インターフェースをドキュメントにする
#// --------------------------------------------------------

http://perldoc.jp/docs/perl/5.14.1/perltoot.pod#Documenting32the32Interface
