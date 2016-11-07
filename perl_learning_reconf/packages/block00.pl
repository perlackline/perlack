#!/usr/bin/perl

use strict;
use warnings;

# begincheck

print        "10. Ordinary code runs at runtime.\n (普通のコードは runtime で実行)\n\n";

END  { print "16. So this is the end of the tale.\n (そういうわけでこれがお話しの終わり) \n\n" }

INIT { print " 7. INIT blocks run FIFO just before runtime.\n (INIT ブロックは runtime の直前に実行)\n\n" }

UNITCHECK {
       print " 4. And therefore before any CHECK blocks.\n (したがって すべての CHECK ブロックより前) \n\n"
}

CHECK{ print " 6. So this is the sixth line.\n (だからこれは 6 行目)\n\n" }

print        "11. It runs in order, of course.\n (順序よく実行, もちろん)\n\n";

BEGIN{ print " 1. BEGIN blocks run FIFO during compilation.\n (BEGIN ブロックはコンパイルの間に FIFO で実行)\n\n" }

END  { print "15. Read perlmod for the rest of the story.\n (物語の残りのために perlmod を読む)\n\n" }

CHECK{ print " 5. CHECK blocks run LIFO after all compilation.\n (CHECK ブロックはコンパイルの後に LIFO で実行)\n\n" }

INIT { print " 8. Run this again, using Perl's -c switch.\n (Perl のスイッチ -c を利用してもう一度実行)\n\n" }

print        "12. This is anti-obfuscated code.\n (これはアンチ難読化コード)\n\n";

END  { print "14. END blocks run LIFO at quitting time.\n (END ブックは退出時間に LIFO で実行)\n\n" }

BEGIN{ print " 2. So this line comes out second.\n (なのでこの行は 2 番目に出てくる)\n\n" }

UNITCHECK {
       print " 3. UNITCHECK blocks run LIFO after each file is compiled.\n (UNITCHECK ブロックは各ファイルがコンパイル後に LIFO で実行)\n\n"
}

INIT { print " 9. You'll see the difference right away.\n (あなたはすぐに違いを見る)\n\n" }

print        "13. It only _looks_ like it should be confusing.\n (それは混乱させるようにしか見えない)\n\n";

__END__

