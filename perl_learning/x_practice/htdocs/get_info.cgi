#!/usr/bin/perl

use strict;
use warnings;

#use CGI::Pretty;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

my $q = CGI->new();

#// --------------------------------------------------------------
#// get value
#// --------------------------------------------------------------

#--- HTML header ---
my $style_form = 'style.css'; 
# 沖縄の楽しい夜を地魚・地料理でどうぞ。座敷とカウンターが広がる店内は海のような空間です。
my $meta_description = $q->param('meta_description');
# 国際通り,居酒屋,沖縄料理
my $meta_keywords = $q->param('meta_keywords');
# 地魚・地料理　南来実　なんくるみ?
my $page_title = $q->param('page_title');
my $save_filename = $q->param('save_filename');
# add 20150818
my $station_url_top = $q->param('station_url_top');
my $station_name = $q->param('station_name');
my $station_description = $q->param('station_description');
my $shop_list = $q->param('shop_list');
# /add 20150818
my $shop_name = $q->param('shop_name');
my $description_h = $q->param('description_h');
my $description = $q->param('description');
my $filename_1 = $q->param('filename_1');
my $filename_2 = $q->param('filename_2');
my $filename_3 = $q->param('filename_3');
my $filename_4 = $q->param('filename_4');
my $coupon_1 = $q->param('coupon_1');
my $coupon_2 = $q->param('coupon_2');
my $info_name = $q->param('info_name');
my $info_zip = $q->param('info_zip');
my $info_addr = $q->param('info_addr');
my $info_phone = $q->param('info_phone');
my $info_time = $q->param('info_time');
my $info_dow = $q->param('info_dow');
my @info_cards = $q->param('info_cards');
my $info_price_1 = $q->param('info_price_1');
my $info_price_2 = $q->param('info_price_2');
  my $info_price = $info_price_1 . " - " . $info_price_2;
my $info_map = $q->param('info_map');
# add 20150818
my $dl_map1_jpg = $q->param('dl_map1_jpg');
my $dl_map1_pdf = $q->param('dl_map1_pdf');
my $dl_map2_jpg = $q->param('dl_map2_jpg');
my $dl_map2_pdf = $q->param('dl_map2_pdf');
# /add 20150818


#// -- main start ---

#// --------------------------------------------------------------
#// HTTP header
#// --------------------------------------------------------------

print $q->header( -charset => 'utf-8' );

#// --------------------------------------------------------------
#// HTML header
#// --------------------------------------------------------------

# add 20150818
#   meta name => 'viewport'
print $q->start_html( 
        -lang => 'ja-JP',
        -title => $page_title,
        -style => { 'src' => $style_form },
        -head => [ $q->meta(
                     { -http_equiv => 'Content-Style-Type',
                       -content    => 'text/css' }),
                   $q->meta(
                     { -http_equiv => 'Content-Script-Type',
                       -content    => 'text/javascript' }),
                   $q->meta(
                     { -name       => 'Keywords',
                       -content    => $meta_keywords }),
                   $q->meta(
                     { -name       => 'Description',
                       -content    => $meta_description }),
                   $q->meta(
                     { -name       => 'viewport',
                       -content    => 'width=device-width,user-scalable=yes,maximum-scale=1' }),
                 ]
);

#// --------------------------------------------------------------
#// contents
#// --------------------------------------------------------------

print $q->start_div( { -id => 'wrapper' } );

print $q->start_div( { -id => 'header' } );

#// -------------------------------
#// station url_top, station name, station description
#// -------------------------------
# add 20150818
print $q->h1( $q->a( { -href => $station_url_top }, $station_name ) );
#print $q->h9($station_description);
print "<h9>$station_description</h9>\n";
# /add 20150818

print $q->end_div(); # id header end

print $q->start_div( { -id => 'container; _display: inline;' } );
print $q->start_div( { -id => 'contents; _display: inline;' } );

print "<!-- コンテンツ ここから -->";

#// -------------------------------
#// (breadcrumbs navi) station_list, shop_list
#// -------------------------------
# add 20150818
# 駅一覧 URL (リテラル)
#my $station_list = 'http://www.teteru-okinawa.net/yuirail-map/index.html';
my $station_list = 'http://localhost/yuirail/index.html';
print $q->p( { -class => 'navi' },
             $q->a({ -href => $station_list }, '駅一覧'),
             '>',
             $q->a({ -href => $shop_list }, '店舗一覧'),
             '>',
);

#// -------------------------------
#// shop name
#// -------------------------------

# shop name
print $q->p( { -class => 'title' },
              $shop_name );

#// -------------------------------
#// descriotion
#// -------------------------------
## description
print $q->h2( $description_h );

print $q->p( { -class => 'comment' }, $description);
print $q->br;

#// -------------------------------
#// Photo
#// -------------------------------
## Photo
print $q->h2( '店舗写真' );
prompt_upload($filename_1) if $filename_1;
prompt_upload($filename_2) if $filename_2;
prompt_upload($filename_3) if $filename_3;
prompt_upload($filename_4) if $filename_4;

#// -------------------------------
#// coupon
#// -------------------------------
## coupoin
my $cap_03 = 'クーポン';
my $cap_04 = '※ご利用の際にマップまたは、このページをご提示ください';
print $q->h2( $cap_03 );

print $q->p( { -class => 'coupon' }, "1. ", $coupon_1);
print $q->p( { -class => 'coupon' }, "2. ", $coupon_2) if $coupon_2;
print $q->p( { -class => 'coupon2' }, $cap_04 );

#// -------------------------------
#// shop information
#// -------------------------------

my $cap_07 = '店舗概要';
print $q->h2( $cap_07 );

## information
# shop name
# zip code
# address
# phone
# time
# day of week
# credit card
# unit price
# map

print $q->ul(
          $q->li( '店舗名' ), $info_name,
          $q->li( '住所' ), '〒', $info_zip, ' ', $info_addr,
          $q->li( '電話番号' ), $info_phone, $q->a( { -href => 'tel:'. $info_phone}, '電話する' ),
          $q->li( '営業時間' ), $info_time,
          $q->li( '定休日' ), $info_dow,
          $q->li( 'クレジットカード' ), @info_cards,
          $q->li( '平均予算' ), $info_price,
          $q->li( $q->a( { -name => 'map' }, '地図' )),
          $info_map);
          #$q->iframe( { -src => $map, -width => '600', -height => '450', -frameborder => '0', -style => 'border:0' } , ''

#// -------------------------------
#// ダウンロード
#// -------------------------------
# add 20150818
print $q->h2('ダウンロード');
print $q->p( { -class => 'pdf'},
               $q->img( { -src => $dl_map1_jpg, -align => 'center', -width => '700' }),
               $q->br,
               $q->a( { -href => $dl_map1_pdf }, 'こちらからダウンロードできます'),
);
print $q->br, $q->br;
print $q->p( { -class => 'pdf' },
               $q->img( { -src => $dl_map2_jpg, -align => 'center', -width => '700' }),
               $q->br,
               $q->a( { -href => $dl_map2_pdf }, 'こちらからダウンロードできます'),
);
               



#================================================================

print "<!-- コンテンツ ここまで -->";

print $q->end_div(), "<!-- / contents end -->";
print $q->end_div(), "<!-- / container  end -->";

print $q->start_div( { -id => 'footer' } );
print $q->p( 'Copyright  &copy; てぃーだスクエア. All Rights Reserved.' );
print $q->end_div();

print $q->end_div(), "<!-- / wrapper end -->";

#// --------------------------------------------------------------
#// (テスト) 外部ファイル出力用
#// --------------------------------------------------------------
 
print $q->hr();
print $q->hr();

#// -------------------------------
#// save filename
#// -------------------------------

set_hidden();

# html end
print $q->end_html();

#// -- main end ---

#// --------------------------------------------------------------
#// set hidden
#// --------------------------------------------------------------
sub set_hidden {

  print $q->start_form( -action => 'print_file.cgi' );  

  print $q->start_div( {-class => 'check_value' });

  print $q->p( { -class => 'button' }, 'ファイル名: ', $save_filename );

  #// --- set value ---

  ## save filename
  my $save_filename = $q->param('save_filename');
  ## meta description
  my $meta_description = $q->param('meta_description');
  ## meta keyword
  my $meta_keywords = $q->param('meta_keywords');
  ## page title
  my $page_title = $q->param('page_title');

  # add 20150818
  my $station_url_top = $q->param('station_url_top');
  my $station_name = $q->param('station_name');
  my $station_description = $q->param('station_description');
  my $shop_list = $q->param('shop_list');
  # /add 20150818

  ## shop name
  my $shop_name = $q->param('shop_name');
  ## description
  my $description_h = $q->param('description_h');
  my $description = $q->param('description');
  ## uofile 
  my $filename_1 = $q->param('filename_1');
  my $filename_2 = $q->param('filename_2');
  my $filename_3 = $q->param('filename_3');
  my $filename_4 = $q->param('filename_4');
  ## coupoin
  my $coupon_1 = $q->param('coupon_1');
  my $coupon_2 = $q->param('coupon_2');
  ## information
  # shop name
  my $info_name = $q->param('info_name');
  # zip code
  my $info_zip_1 = $q->param('info_zip_1');
  my $info_zip_2 = $q->param('info_zip_2');
  my $info_zip = $info_zip_1 . "-" . $info_zip_2;
  # address
  my $info_addr = $q->param('info_addr');
  # phone
  my $info_phone_1 = $q->param('info_phone_1');
  my $info_phone_2 = $q->param('info_phone_2');
  my $info_phone_3 = $q->param('info_phone_3');
  my $info_phone = $info_phone_1 . "-" . $info_phone_2 . "-" . $info_phone_3;
  # time
  my $info_time = $q->param('info_time');
  # day of week
  my $info_dow = $q->param('info_dow');
  # credit card
  my @info_cards = $q->param('info_cards');
  # unit price
  my $info_price_1 = $q->param('info_price_1');
  my $info_price_2 = $q->param('info_price_2');
  my $info_price = $info_price_1 . " - " . $info_price_2;
  # map
  my $info_map = $q->param('info_map');

  # add 20150818
  my $dl_map1_jpg = $q->param('dl_map1_jpg');
  my $dl_map1_pdf = $q->param('dl_map1_pdf');
  my $dl_map2_jpg = $q->param('dl_map2_jpg');
  my $dl_map2_pdf = $q->param('dl_map2_pdf');
  # /add 20150818

  #// --- set hidden ---

  #// save filename
  print $q->hidden( 'save_filename', $save_filename);
  #// meta description
  print $q->hidden( 'meta description', $meta_description);
  #// meta keyword
  print $q->hidden( 'meta keywords', $meta_keywords);
  #// page title
  print $q->hidden( 'page title', $page_title);

  # add 20150818
  print $q->hidden( 'station_url_top', $station_url_top);
  print $q->hidden( 'station_name', $station_name);
  print $q->hidden( 'station_description', $station_description);
  print $q->hidden( 'shop_list', $shop_list);
  # /add 20150818

  #// information
  print $q->hidden( 'shop_name', $shop_name);
  print $q->hidden( 'description_h', $description_h);
  print $q->hidden( 'description', $description);
  if ($filename_1) {
    print $q->hidden( 'filename_1', $filename_1);
  }
  if ($filename_2) {
    print $q->hidden( 'filename_2', $filename_2);
  }
  if ($filename_3) {
    print $q->hidden( 'filename_3', $filename_3);
  }
  if ($filename_4) {
    print $q->hidden( 'filename_4', $filename_4);
  }
  if ($coupon_1) {
    print $q->hidden( 'coupon_1', $coupon_1);
  }
  if ($coupon_2) {
    print $q->hidden( 'coupon_2', $coupon_2);
  }
  print $q->hidden( 'info_name', $info_name);
  print $q->hidden( 'info_zip', $info_zip);
  print $q->hidden( 'info_addr', $info_addr);
  print $q->hidden( 'info_phone', $info_phone);
  print $q->hidden( 'info_time', $info_time);
  print $q->hidden( 'info_dow', $info_dow);
  print $q->hidden( -name => 'info_cards',
                    -value =>  \@info_cards);
  print $q->hidden( 'info_price', $info_price);
  print $q->hidden( 'info_map', $info_map);

  # add 20150818
  print $q->hidden( 'dl_map1_jpg', $dl_map1_jpg );
  print $q->hidden( 'dl_map1_pdf', $dl_map1_pdf);
  print $q->hidden( 'dl_map2_jpg', $dl_map2_jpg);
  print $q->hidden( 'dl_map2_pdf', $dl_map2_pdf);
  # /add 20150818


print $q->p( { -class => 'button' }, 'Are you ok?' );
print $q->p( { -class => 'button' },
             $q->submit(  -name => 'button',
                          -value => 'submit',
                          ));

print $q->end_div;

  print $q->end_form();
}  

#// -------------------------------
#// upload routine
#// -------------------------------

sub prompt_upload {

  my $q2 = CGI->new();

  # CGI object を取得
  my $filename = shift;
  # 関数 read() のための変数
  my ($bytesread, $buffer);
  # read() で 1 度に読み込むデータサイズ
  my $num_bytes = 1024;
  # ファイルのサイズを格納
  my $totalbytes;
  # ファイル名と同名のファイルハンドル
  # my $filename = $q->upload('filename_1');
  # 除染済みのファイル名を格納
  my $untainted_filename;
  # ファイル名の汚染チェック
  if ($filename =~ /^([-_\@:\/\\\w.]+)$/) {
    # 除染したファイル名を取得
     $untainted_filename = $1;
  } else {
    # 汚染されたら die
    print $q2->p("ファイルは: ", $filename); 
    die <<"EOT";
ファイル名にサポートしていない文字が含まれていま。サポートするのはアルファベットと数字および「 _ 」「 \@ 」「 / 」「 \\ 」「 . 」です。
EOT
  }

  # ファイルの書き込み先を設定
  my $file = "./image/$untainted_filename";
  # print $q2->p("$filename を $file にアップロード");

  # 書き込みモードでファイルハンドルを Open
  open (OUTFILE, '>', "$file" ) or die "Couldn't  open $file for writing: $!";

  # ループ: データの read と write
  while ($bytesread = read($filename, $buffer, $num_bytes)) {
    # ファイルサイズの累算
    $totalbytes += $bytesread;
    # 指定領域に書き込み
    print OUTFILE $buffer;
  }
  # エラーチェック
  die "データの読み込みに失敗" unless defined($bytesread);
  # 続エラーチェック
  unless (defined($totalbytes) ) {
    print $q2->p("エラー: ファイル読み込み失敗 ${untainted_filename}, ");
    print $q2->p("またはファイルの長さがゼロ");
  } else {
    # print image tag
    print $q2->p({ -class => 'photo' },
              $q2->img({ -src => $file, }));
 
    # 完了メッセージ
    print $q2->p("完了, $filename を $file にアップロード($totalbytes)");
  }
  # ファイルハンドルクローズ
  close OUTFILE or die "$file をクローズできませんでした: $!";

}



