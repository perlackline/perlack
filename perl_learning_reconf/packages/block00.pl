#!/usr/bin/perl

use strict;
use warnings;

# begincheck

print        "10. Ordinary code runs at runtime. (普通のコードは runtime で実行)\n";

END  { print "16. So this is the end of the tale. (そういうわけでこれがお話しの終わり) \n" }
INIT { print " 7. INIT blocks run FIFO just before runtime. (INIT ブロックは runtime の直前に実行)\n" }
UNITCHECK {
       print " 4. And therefore before any CHECK blocks. (したがって すべての CHECK ブロックより前) \n"
}
CHECK{ print " 6. So this is the sixth line. (だからこれは 6 行目)\n" }

print        "11. It runs in order, of course. (順序よく実行, もちろん)\n";

BEGIN{ print " 1. BEGIN blocks run FIFO during compilation. (BEGIN ブロックはコンパイルの間に FIFO で実行)\n" }
END  { print "15. Read perlmod for the rest of the story. (物語の残りのために perlmod を読む)\n" }
CHECK{ print " 5. CHECK blocks run LIFO after all compilation. (CHECK ブロックはコンパイルの後に LIFO で実行)\n" }
INIT { print " 8. Run this again, using Perl's -c switch. (Perl のスイッチ -c を利用してもう一度実行)\n" }

print        "12. This is anti-obfuscated code. (これはアンチ難読化コード)\n";

END  { print "14. END blocks run LIFO at quitting time. (END ブックは退出時間に LIFO で実行)\n" }
BEGIN{ print " 2. So this line comes out second. (なのでこの行は 2 番目に出てくる)\n" }
UNITCHECK {
       print " 3. UNITCHECK blocks run LIFO after each file is compiled. (UNITCHECK ブロックは各ファイルがコンパイル後に LIFO で実行)\n"
}
INIT { print " 9. You'll see the difference right away. (あなたはすぐに違いを見る)\n" }

print        "13. It only _looks_ like it should be confusing. (それは混乱させるようにしか見えない)\n";

__END__

