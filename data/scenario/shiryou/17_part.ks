
; == 17_part.ks ============================================

; 立ち絵のパーツ分けの解説を行います。

; ==========================================================






; == キャラクター定義 ==================================

; パーツごとにわけてキャラクターを定義していきます。
; (1) akane_part_base
; (2) akane_part_mayu
; (3) akane_part_me
; (4) akane_part_kuchi
; (5) akane_option_ase
; (6) akane_option_tere
; (7) akane_option_namida

; ベースとなる全身絵の定義。
[chara_new  name="akane_part_base" storage="chara/akane_parts/base.png"]

; 眉。
[chara_new  name="akane_part_mayu"              storage="chara/akane_parts/mayu_usual.png"]
[chara_face name="akane_part_mayu" face="happy" storage="chara/akane_parts/mayu_happy.png"]
[chara_face name="akane_part_mayu" face="angry" storage="chara/akane_parts/mayu_angry.png"]
[chara_face name="akane_part_mayu" face="sad"   storage="chara/akane_parts/mayu_sad.png"  ]

; 目。
[chara_new  name="akane_part_me"               storage="chara/akane_parts/me_usual.png"]
[chara_face name="akane_part_me" face="warai"  storage="chara/akane_parts/me_warai.png"]
[chara_face name="akane_part_me" face="fuse"   storage="chara/akane_parts/me_fuse.png" ]
[chara_face name="akane_part_me" face="toji"   storage="chara/akane_parts/me_toji.png" ]
[chara_face name="akane_part_me" face="wink"   storage="chara/akane_parts/me_wink.png" ]

; 口。
[chara_new  name="akane_part_kuchi"          storage="chara/akane_parts/kuchi_usual.png"]
[chara_face name="akane_part_kuchi" face="a" storage="chara/akane_parts/kuchi_a.png"    ]
[chara_face name="akane_part_kuchi" face="o" storage="chara/akane_parts/kuchi_o.png"    ]
[chara_face name="akane_part_kuchi" face="u" storage="chara/akane_parts/kuchi_u.png"    ]

; ON/OFFできるオプション。汗と照れと涙。
; デフォルトはoffにしたいので、何も色がない透明の画像 empty.png を指定します。
[chara_new  name="akane_option_ase"           storage="chara/akane_parts/empty.png"     ]
[chara_face name="akane_option_ase" face="on" storage="chara/akane_parts/option_ase.png"]
[chara_new  name="akane_option_tere"           storage="chara/akane_parts/empty.png"      ]
[chara_face name="akane_option_tere" face="on" storage="chara/akane_parts/option_tere.png"]
[chara_new  name="akane_option_namida"           storage="chara/akane_parts/empty.png"        ]
[chara_face name="akane_option_namida" face="on" storage="chara/akane_parts/option_namida.png"]






; == キャラクター表示用マクロ定義 ======================

; [macro]～[endmacro]
; 独自マクロ[akane/show x="XXX" y="XXX"]を定義します。
; x, y にあかねのパーツを全表示するマクロです。
[macro name="akane/show"]

  ; [iscript]～[endscript]
  [iscript]
  ; マクロに渡された属性値は、属性名の頭に mp. をつけることで扱うことができます。
  ; ここで注意が必要で、マクロに渡された属性値はすべて文字列データになっています。
  ;
  ;(文字列データとは別に数値データというものもあり、両者は明確に扱いが異なります！
  ; 文字列の足し算は '1' + '1' = '11' であり、数値の足し算は 1 + 1 = 2 となります。)
  ;
  ; ここでは、文字列データを数値データに変換する処理を行っています。
  ; 何やってんだかわからん、わかりたくもないという場合何も考えずコピペしてください。
  mp.x     = Number(mp.x)
  mp.y     = Number(mp.y)
  ; 初期値を指定します
  mp.layer = mp.layer || '0'
  mp.time  = mp.time  || '1000'
  [endscript]

  ; [chara_show]
  ; 上で定義したパーツを表示していきます。
  ;
  ; left属性とtop属性の値の頭についている&に着目してください。
  ; これは、そのあとに続く文字をJS式として評価せよという記号です。
  ; つまり、たとえば「&mp.x + 142」は「mp.x の数値に 142 を足した値」を指定しています。
  ;
  ; また、layer="%layer"で、マクロに渡されたlayer属性の値をそのまま渡しています。
  ; これはlayer="&mp.layer"と書いても同じです。
  [chara_show name="akane_part_base"     left="&mp.x +   0" top="&mp.y +   0" time="0" face="default" layer="%layer"]
  [chara_show name="akane_part_me"       left="&mp.x + 142" top="&mp.y + 147" time="0" face="default" layer="%layer"]
  [chara_show name="akane_part_kuchi"    left="&mp.x + 142" top="&mp.y + 206" time="0" face="default" layer="%layer"]
  [chara_show name="akane_part_mayu"     left="&mp.x + 142" top="&mp.y + 129" time="0" face="default" layer="%layer"]
  [chara_show name="akane_option_ase"    left="&mp.x + 142" top="&mp.y +  96" time="0" face="default" layer="%layer"]
  [chara_show name="akane_option_tere"   left="&mp.x + 142" top="&mp.y +  96" time="0" face="default" layer="%layer"]
  [chara_show name="akane_option_namida" left="&mp.x + 142" top="&mp.y +  96" time="0" face="default" layer="%layer"]

  ; [wrap]
  ; これは独自マクロです(→macro.ks)。
  ; あかねのパーツ群をひとつのラップでくるみます。
  ; 以降はこのラップに対してアニメーション処理を行います。
  [wrap layer="%layer" page="fore" x="280" y="40" width="400" height="600" wrap_name="akane_all" name="akane_part_base, akane_part_mayu, akane_part_me, akane_part_kuchi, akane_option_ase, akane_option_tere, akane_option_namida"]

[endmacro]



; == キャラクターの各パーツ変更用マクロ定義 ============

; [macro]～[endmacro]
; キャラクターの表情を変えたり、オプションをON/OFFしたり、
; といったことを属性なしの単純なマクロで操作できるよう、
; 全部逐一マクロに登録していきます。
; たとえば[akane/mayu/happy]であかねの眉をハッピーにします。
[macro name="akane/mayu/usual"][chara_mod * name="akane_part_mayu" face="default"][endmacro]
[macro name="akane/mayu/happy"][chara_mod * name="akane_part_mayu" face="happy"  ][endmacro]
[macro name="akane/mayu/angry"][chara_mod * name="akane_part_mayu" face="angry"  ][endmacro]
[macro name="akane/mayu/sad"  ][chara_mod * name="akane_part_mayu" face="sad"    ][endmacro]
[macro name="akane/me/usual"][chara_mod * name="akane_part_me" face="default"][endmacro]
[macro name="akane/me/warai"][chara_mod * name="akane_part_me" face="warai"  ][endmacro]
[macro name="akane/me/fuse" ][chara_mod * name="akane_part_me" face="fuse"   ][endmacro]
[macro name="akane/me/toji" ][chara_mod * name="akane_part_me" face="toji"   ][endmacro]
[macro name="akane/me/wink" ][chara_mod * name="akane_part_me" face="wink"   ][endmacro]
[macro name="akane/kuchi/usual"][chara_mod * name="akane_part_kuchi" face="default"][endmacro]
[macro name="akane/kuchi/a"    ][chara_mod * name="akane_part_kuchi" face="a"      ][endmacro]
[macro name="akane/kuchi/o"    ][chara_mod * name="akane_part_kuchi" face="o"      ][endmacro]
[macro name="akane/kuchi/u"    ][chara_mod * name="akane_part_kuchi" face="u"      ][endmacro]
[macro name="akane/option/ase"       ][chara_mod * name="akane_option_ase" face="on"        ][endmacro]
[macro name="akane/option/ase/off"   ][chara_mod * name="akane_option_ase" face="default"   ][endmacro]
[macro name="akane/option/tere"      ][chara_mod * name="akane_option_tere" face="on"       ][endmacro]
[macro name="akane/option/tere/off"  ][chara_mod * name="akane_option_tere" face="default"  ][endmacro]
[macro name="akane/option/namida"    ][chara_mod * name="akane_option_namida" face="on"     ][endmacro]
[macro name="akane/option/namida/off"][chara_mod * name="akane_option_namida" face="default"][endmacro]





; == キャラクターの表情変更用マクロ定義 ================

; [macro]～[endmacro]
; さらに、各パーツの組み合わせを表情として登録します。
; これによって、[akane/happy]とすれば眉・目・口が全部その表情に変わります。
[macro name="akane/happy]
  [akane/mayu/happy wait="false"]
  [akane/me/warai   wait="false"]
  [akane/kuchi/a                ]
[endmacro]
[macro name="akane/usual"]
  [akane/mayu/usual wait="false"]
  [akane/me/usual   wait="false"]
  [akane/kuchi/usual            ]
[endmacro]
[macro name="akane/angry"]
  [akane/mayu/angry wait="false"]
  [akane/me/fuse    wait="false"]
  [akane/kuchi/o                ]
[endmacro]
[macro name="akane/sad"]
  [akane/mayu/sad   wait="false"]
  [akane/me/toji    wait="false"]
  [akane/kuchi/u                ]
[endmacro]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view chara="no"]

; [akane/show]
; これは独自マクロです。
; パーツ分けしたあかねの立ち絵を座標 (280, 40) の位置に表示します。
[akane/show x="280" y="40"]

#akane
パーツ分けしたキャラクターを表示[p]
ふだんは、登録しておいた一括表情変換マクロを用いる[l]

[akane/happy]
[akane/sad]
[akane/angry]
[akane/usual]


[cm]必要に応じて、個別に各パーツを切り替えるとよい[l]

[akane/me/toji]
[akane/kuchi/a]
[akane/mayu/angry]

[akane/usual]

[cm]オプションパーツのＯＮ・ＯＦＦなど[l]

[akane/option/ase]
[akane/option/ase/off]
[akane/option/tere]
[akane/option/tere/off]
[akane/option/namida]
[akane/option/namida/off]

[cm]ラッピングすれば、まとめてアニメーション可能[l]

; [keyframe]～[endkeyframe]
; いろいろ動かすキーフレームアニメーション。
[keyframe name="part_test"]
  [frame p="&  0 / 17 * 100 + '%' " scaleX="1" scaleY="1" scale="1" skewX="0deg" skewY="0deg" skew="0deg" opacity="1" rotate="0deg" rotateX="0deg" rotateY="0deg" rotateZ="0deg"]
  [frame p="&  1 / 17 * 100 + '%' " x="100"          ]
  [frame p="&  2 / 17 * 100 + '%' "         y="100"  ]
  [frame p="&  3 / 17 * 100 + '%' " x="  0"          ]
  [frame p="&  4 / 17 * 100 + '%' "         y="  0"  ]
  [frame p="&  5 / 17 * 100 + '%' " scaleX="2"           ]
  [frame p="&  6 / 17 * 100 + '%' "            scaleY="2"]
  [frame p="&  7 / 17 * 100 + '%' " scaleX="1"           ]
  [frame p="&  8 / 17 * 100 + '%' "            scaleY="1"]
  [frame p="&  9 / 17 * 100 + '%' " scale="2.0"]
  [frame p="& 10 / 17 * 100 + '%' " scale="0.5"]
  [frame p="& 11 / 17 * 100 + '%' " scale="1.0"]
  [frame p="& 13 / 17 * 100 + '%' " rotateX="360deg"]
  [frame p="& 14 / 17 * 100 + '%' " rotateY="360deg"]
  [frame p="& 15 / 17 * 100 + '%' " rotateZ="360deg" opacity="1"]
  [frame p="& 16 / 17 * 100 + '%' " opacity="0"]
  [frame p="& 17 / 17 * 100 + '%' " opacity="1"]
[endkeyframe]

; [kanim]
; 適用してみる。
[kanim name="akane_all" time="8500" keyframe="part_test"]
[wa]
[cm]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
以上です[p]

[jump storage="select.ks"]