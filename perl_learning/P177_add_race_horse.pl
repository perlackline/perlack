#!/usr/bin/perl

# + Animal クラスに名前と色の取得/設定昨日を追加。
# + use strict でも動作するようにする = our を利用。
# + ゲッターには
#   - 動物全般のインスタンスを渡しても
#   - 特定の動物のインスタンスを渡しても動作する。

# Animal パッケージから始める
use strict;
{ package Animal;
  use Carp qw(croak);
  # P172 adding
  use File::Temp qw(tempfile);

  # コンストラクタ
  sub named {
    ref (my $class = shift) and croak "class name needed";
    my $name = shift;
    my $self = { Name => $name, Color => $class->default_color };
    # P172 adding start
    my ($fh, $filename) = tempfile( );
    $self->{temp_fh} = $fh;
    $self->{temp_filename} = $filename;
    # end 
    bless $self, $class;
  }

  # 仮想メソッド (サブクラスでオーバーライドすべきメソッド)。
  # Perl は基底クラスで仮想メソッドの宣言は不要だがドキュメント
  # 用として役立つ。

  # デフォルト (必ずオーバーライドすること) 
  sub default_color { "brown" }
  sub sound { croak "subclass must define a sound" }

  # クラスからでもインスタンスからでも呼び出せるメソッド。
  
  # クラス / インスタンスメソッド
  sub speak {
    my $either = shift;
    print $either->name, " goes ", $either->sound, "\n";
  }
  sub name {
    my $either = shift;
    ref $either
      ? $either->{Name}
      : "an unnamed $either";
  }
  sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food.\n";
  }
  sub color {
    my $either = shift;
    ref $either
      ? $either->{Color}
      : $either->default_color;
  }

  # インスタンス専用メソッド
  sub set_name {
    ref (my $self = shift) or croak "instance variable needed";
    $self->{Name} = shift;
  }
  sub set_color {
    ref (my $self = shift) or croak "instance variable needed";
    $self->{Color} = shift;
  }

#  # P168 adding
#  sub DESTROY {
#    my $self = shift;
#    print '[', $self->name, " has died.]\n";
#  }

  # P172 modify
  sub DESTROY {
    my $self = shift;
    my $fh = $self->{temp_fh};
    close $fh;
    unlink $self->{temp_filename};
    print '[', $self->name, " has died.]\n";
  }

}

  # 以上が抽象基底クラスの定義。
  # 以下がインスタンスを持てる具象クラスの定義。

{ package Horse;
  our @ISA = qw(Animal);
  sub sound { "neigh" }
  # P173
  sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY;
    print "[", $self->name, " has gone off to the glue factory.]\n";
  }
}

# P178
{ package RaceHorse;
  our @ISA = qw(Horse);
  ## 親コンストラクタの拡張
  sub named {
    my $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    $self;
  }
  sub won { shift->{wins}++; }
  sub placed { shift->{places}++; }
  sub showed { shift->{shows}++; }
  sub lost { shift->{losses}++; }
  sub standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
  }
}

{ package Sheep;
  our @ISA = qw(Animal);
  sub color { "white" }  # デフォルトの色をオーバーライド
  sub sound { "baaaah" }
}
{ package Cow;
  our @ISA = qw(Animal);
  sub sound { "moooo" }
}

# P170 adding
#{ package Barn;
#  sub new { bless [ ], shift }
#  sub add { push @{+shift}, shift }
#  sub contents { @{+shift} }
#  sub DESTROY {
#    my $self = shift;
#    print "$self is being destroyed...\n";
#    for ($self->contents) {
#      print ' ', $_->name, " goes homeless.\n";
#    }
#  }
#}

# P171 adding
{ package Barn2;
  sub new { bless [ ], shift }
  sub add { push @{+shift}, shift }
  sub contents { @{+shift} }
  sub DESTROY {
    my $self = shift;
    print "$self is being destroyed...\n";
    while (@$self) {
      my $homeless = shift @$self;
      print ' ', $homeless->name, " goes homeless.\n";
    }
  }
}

# ---

# P178
my $racer = RaceHorse->named('Billy Boy');
# 記録: 優勝 1, 3 着 2, 着外 1.
$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, ".\n";

#my @tv_horses = map Horse->named($_), ('Trigger', 'Mr. Ed');
#$_->eat('an apple') for @tv_horses;  # 最後の晩餐
#print "End of program.\n";

# P170 adding
#my $barn = Barn->new;
#my @cows = (Cow->named('Bessie'), Cow->named('Gwen'));
#$barn->add($_) for @cows;
#print "Burn the barn:\n";
#$barn = undef;
#print "Lose the cows:\n";
#@cows = ( );
#print "End of program.\n";
#
#my $barn = Barn2->new;
#$barn->add(Cow->named('Bessie'));
#$barn->add(Cow->named('Gwen'));
#print "Brun the barn:\n";
#$barn = undef;
#print "End of program.\n";

# P170 adding
#my $barn = Barn->new;
#$barn->add(Cow->named('Bessie'));
#$barn->add(Cow->named('Gwen'));
#print "Burn the barn:\n";
#$barn = undef;
#print "End of program.\n";

# P168 adding
#sub feed_a_cow_named {
#  my $name = shift;
#  my $cow = Cow->named($name);
#  $cow->eat('grass');
#  print "Returning from the subroutine.\n"; # $cow はここで破棄される
#}
#print "Start of program.\n";
#my $outer_cow = Cow->named('Bessie');
#print "Now have a cow named ", $outer_cow->name, ".\n";
#feed_a_cow_named('Gwen');
#print "Returnd from subroutine.\n";



