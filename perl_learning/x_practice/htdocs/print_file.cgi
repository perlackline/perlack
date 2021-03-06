#!/usr/bin/perl

use strict;
use warnings;

#use CGI::Pretty;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

my $q = CGI->new();

#// -- set value ---

my $style_form = 'style.css'; 

my $save_filename = $q->param('save_filename');

my $meta_description = $q->param('meta_description');
my $meta_keywords = $q->param('meta_keywords');
my $page_title = $q->param('page title');

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
 my @photo_files = $q->param('filename_1');
 push @photo_files, $filename_2 if $filename_2;
 push @photo_files, $filename_3 if $filename_3;
 push @photo_files, $filename_4 if $filename_4;

my $coupon_1 = $q->param('coupon_1');
my $coupon_2 = $q->param('coupon_2');
my $info_name = $q->param('info_name');
my $info_zip = $q->param('info_zip');
my $info_addr = $q->param('info_addr');
my $info_phone = $q->param('info_phone');
my $info_time = $q->param('info_time');
my $info_dow = $q->param('info_dow');
my @info_cards = $q->param('info_cards');
my $info_price = $q->param('info_price');
my $info_map = $q->param('info_map');

# add 20150818
my $dl_map1_jpg = $q->param('dl_map1_jpg');
my $dl_map1_pdf = $q->param('dl_map1_pdf');
my $dl_map2_jpg = $q->param('dl_map2_jpg');
my $dl_map2_pdf = $q->param('dl_map2_pdf');
# /add 20150818

my $style = '';

#// --------------------------------------------------------------
#// main
#// --------------------------------------------------------------
print $q->header( -charset => 'utf-8' );
print $q->start_html( 
        -lang => 'ja-JP',
        -title => 'save file',
        -style => { 'src' => $style },
);

print $q->h1('Has been completed. ');

saved_to_file();

chmod 0666, $save_filename;
print $q->p($q->a({-href => "$save_filename", -target => "_blank" }, "This link is the $save_filename") ), "\n";
print $q->p($q->a({-href => "./input_info.cgi" }, "Go back Input Form.") ), "\n";

print $q->end_html();

#// --------------------------------------------------------------
#// sub routine
#// --------------------------------------------------------------

sub saved_to_file {

  # set STDOUT -> $save_filename
  open my $fh, '>', $save_filename or die "cant open $save_filename: $!";
  select $fh;
  
  #// HTTP header
  
  # print $q->header( -charset => 'utf-8' );
  
  #// HTML header
  
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
                     # add 20150818
                     $q->meta(
                       { -name       => 'viewport',
                         -content    => 'width=device-width,user-scalable=yes,maximum-scale=1' }),
                   ]), "\n";
  
  #// contents
  
  print $q->start_div( { -id => 'wrapper' } ), "\n";
  
  print $q->start_div( { -id => 'header' } ), "\n";

  # add 20150818 station url_top, station name, station description
  print $q->h1( $q->a( { -href => $station_url_top }, $station_name ) ),"\n";
  # CGI.pm not has method 'h9'
  print "<h9>$station_description</h9>\n";
  # /add 20150818

  print $q->end_div(), "\n"; # id header end
  
  print $q->start_div( { -id => 'container; _display: inline;' } ), "\n";
  print $q->start_div( { -id => 'contents; _display: inline;' } ), "\n";
  
  print "<!-- コンテンツ ここから -->\n";
  
  # ---

  # add 20150818(breadcrumbs navi) station_list, shop_list
  # 駅一覧 URL (リテラル)
  #my $station_list = 'http://www.teteru-okinawa.net/yuirail-map/index.html';
  my $station_list = 'http://localhost/yuirail/index.html';
  print $q->p( { -class => 'navi' },
               $q->a({ -href => $station_list }, '駅一覧'),
               '>',
               $q->a({ -href => $shop_list }, '店舗一覧'),
               '>',
  );

  # shop name
  
  print $q->p( { -class => 'title' },
                $shop_name ), "\n";
  
  # description
  
  print $q->h2( $description_h ), "\n";
  print $q->p( { -class => 'comment' }, $description), "\n";
  print $q->br(), "\n";
  
  # Photo
  
  print $q->h2( '店舗写真' ), "\n";
  for my $photo (@photo_files){
    print $q->p({ -class => 'photo' },
              $q->img ( { -src => "./image/$photo",})), "\n";
  }
  
  # coupon
  
  print $q->h2('クーポン'), "\n";
  print $q->p( { -class => 'coupon' }, "1. ", $coupon_1), "\n";
  print $q->p( { -class => 'coupon' }, "2. ", $coupon_2), "\n"  if $coupon_2;
  print $q->p( { -class => 'coupon2' }, "※ ご利用の際にマップまたは, このページをご提示ください\n" );
  
  # shop information
  
  print $q->h2( '店舗概要' ), "\n";
  
  print $q->ul(
            $q->li( '店舗名' ), $info_name, "\n",
            $q->li( '住所' ), '〒', $info_zip, ' ', $info_addr, "\n",
            $q->li( '電話番号' ), $info_phone, $q->a( { -href => 'tel:'. $info_phone}, '電話する' ), "\n",
            $q->li( '営業時間' ), $info_time, "\n",
            $q->li( '定休日' ), $info_dow, "\n",
            $q->li( 'クレジットカード' ), @info_cards, "\n",
            $q->li( '平均予算' ), $info_price, "\n",
            $q->li( $q->a( { -name => 'map' }, '地図' )),
            $info_map, "\n"), "\n";
  
  # add 20150818 ダウンロード
  print $q->br, $q->br;
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

  print "<!-- コンテンツ ここまで -->";
  
  print $q->end_div(), "<!-- / contents end -->";
  print $q->end_div(), "<!-- / container  end -->";
  
  print $q->start_div( { -id => 'footer' } );
  print $q->p( 'Copyright  &copy; てぃーだスクエア. All Rights Reserved.' );
  print $q->end_div();
  
  print $q->end_div(), "<!-- / wrapper end -->";
  
  # html end
  print $q->end_html();

  #// reset STDOUT  
  select STDOUT;
  close $fh;

}







