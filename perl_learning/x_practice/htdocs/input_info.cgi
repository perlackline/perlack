#!/usr/bin/perl

use strict;
use warnings;

use CGI::Pretty;
use CGI::Carp qw(fatalsToBrowser);

my $q = CGI->new();

# add 2015-07-01
# Here's the javascript code that we include in the document.
my $JSCRIPT = <<EOF;
  // validate input the file name.
  function validateFileName() {
    var x = document.forms["input_form"]["save_filename"].value;
    if ( x == null || x == "") {
      alert("ファイル名を入力してください");
      return false;
    }
  }
EOF
  ;

#// --------------------------------------------------------------
#// HTTP header
#// --------------------------------------------------------------

print $q->header( -charset => 'utf-8' );

#// --------------------------------------------------------------
#// HTML header
#// --------------------------------------------------------------

my $style_form = '';

print $q->start_html(
        -title => 'map information',
        -script => $JSCRIPT,
        -lang  => 'ja-JP',
        -style => { 'src' => $style_form },
);

#// --------------------------------------------------------------
#// contents
#// --------------------------------------------------------------

print $q->h1('Map Information'), $q->hr;

# HTML フォームの出力
print_form();

print $q->hr;

# HTML end
print $q->end_html();

#// ==============================================================
#// sub routine
#// ==============================================================

#// --------------------------------
#// print HTML form
#// --------------------------------

sub print_form {

  # add 2015-07-01 -onSubmit
  print $q->start_form(
            -name   => 'input_form',
            -onSubmit => "return validateFileName()",
            -method => 'post',
            -action => 'get_info.cgi',
  );

  # file name for save
  print $q->p('ファイル名');
  print $q->textfield(
            -name => 'save_filename',
            -size => 60,
            -maxlength => 100);

  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # meta description
  print $q->p('meta: desctiption');
  print $q->textarea(
            -name => 'meta_description',
            -row => 15,
            -columns => 50);
  # meta kyewords
  print $q->p('meta: keyword * カンマ区切り');
  print $q->textfield(
            -name => 'meta_keywords',
            -size => 60,
            -maxlength => 100);
  # pege title
  print $q->p('ページ タイトル');
  print $q->textfield(
            -name => 'page_title',
            -size => 60,
            -maxlength => 100);
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # add 201508, station url top, name, desc, shop_list
  print $q->p('駅 TOP URL');
  print $q->textfield(
            -name => 'station_url_top',
            -size => 70,
            -maxlength => 300);
  print $q->p('駅名');
  print $q->textfield(
            -name => 'station_name',
            -size => 60,
            -maxlength => 100);
  print $q->p('駅の紹介文');
  print $q->textarea(
            -name => 'station_description',
            -row => 15,
            -columns => 50);
  print $q->p('店舗一覧 URL');
  print $q->textfield(
            -name => 'shop_list',
            -size => 70,
            -maxlength => 300);
  # /add 201508

  # shop name
  print $q->p('店名');
  print $q->textfield(
            -name => 'shop_name',
            -size => 60,
            -maxlength => 100);
  # description_h
  print $q->p('紹介文 見出し');
  print $q->textfield(
            -name => 'description_h',
            -size => 60,
            -maxlength => 100);
  # description
  print $q->p('紹介文');
  print $q->textarea(
            -name => 'description',
            -row => 15,
            -columns => 50);
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # photo upload 1, 2, 3, 4
  print $q->p('写真');
  print $q->p('ファイル 01 を選択'),
        $q->filefield( -name => 'filename_1',
                       -size => 40,
                       -maxlength => 80);
  print $q->p('ファイル 02 を選択'),
        $q->filefield( -name => 'filename_2',
                       -size => 40,
                       -maxlength => 80);
  print $q->p('ファイル 03 を選択'),
        $q->filefield( -name => 'filename_3',
                       -size => 40,
                       -maxlength => 80);
  print $q->p('ファイル 04 を選択'),
        $q->filefield( -name => 'filename_4',
                       -size => 40,
                       -maxlength => 80);
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # coupon
  print $q->p('クーポン 1');
  print $q->textfield(
            -name => 'coupon_1',
            -size => 60,
            -maxlength => 100);
  print $q->p('クーポン 2');
  print $q->textfield(
            -name => 'coupon_2',
            -size => 60,
            -maxlength => 100);
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # shop information
  print $q->h2('店舗情報');

  # name
  print $q->p('店名');
  print $q->textfield(
            -name => 'info_name',
            -size => 60,
            -maxlength => 100);

  # zip code
  print $q->p('郵便番号 * 半角数字で入力');
  print $q->textfield(
            -name => 'info_zip',
            -size => 13,
            -maxlength => 8);

  # address
  print $q->p('住所');
  print $q->textfield(
            -name => 'info_addr',
            -size => 60,
            -maxlength => 50);

  # phone number
  print $q->p('電話番号 * 半角数字で入力');
  print $q->textfield(
            -name => 'info_phone',
            -size => 15,
            -maxlength => 15);

  # time
  print $q->p('営業時間');
  print $q->textfield(
            -name => 'info_time',
            -size => 60,
            -maxlength => 100);

  # dow (day of week)
  print $q->p('定休日');
  print $q->textfield(
            -name => 'info_dow',
            -size => 60 
            -maxlength => 100);

  # card (add 20150818 'なし')
  my @credit_card = qw( JCB MastCard DC VISA AMEX 銀聯 なし);
  print $q->p('クレジットカード');
  print $q->checkbox_group (
            -name => 'info_cards',
            -values => \@credit_card);

  # average_unit_price
  print $q->p('平均単価');
  print $q->textfield(
            -name => 'info_price_1',
            -size => 5,
            -maxlength => 5),
        "円 - ",
        $q->textfield(
            -name => 'info_price_2',
            -size => 5,
            -maxlength => 5),
        "円";
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # map
  print $q->p('map url');
  print $q->textarea(
            -name => 'info_map',
            -row => 15,
            -columns => 50);
  print $q->hr( { -style => 'border:none;border-top: dashed 1px;'} );

  # add 20150818, DL map image
  print $q->p('DL map (表) jpg 相対パス');
  print $q->textfield(
            -name => 'dl_map1_jpg',
            -size => 70, 
            -maxlength => 300);
  print $q->p('DL map (表) pdf 相対パス');
  print $q->textfield(
            -name => 'dl_map1_pdf',
            -size => 70, 
            -maxlength => 300);
  print $q->p('DL map (裏) jpg 相対パス');
  print $q->textfield(
            -name => 'dl_map2_jpg',
            -size => 70, 
            -maxlength => 300);
  print $q->p('DL map (裏) pdf 相対パス');
  print $q->textfield(
            -name => 'dl_map2_pdf',
            -size => 70, 
            -maxlength => 300);
  # /add 20150818

  # submit button
  print $q->p(
            $q->submit(
                -name => 'submit',
                -values => 'check' ),
  );
  # reset button
  print $q->p(
            $q->reset(
                -name => 'reset',
                -values => 'reset'),
  );

}

