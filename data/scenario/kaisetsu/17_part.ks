
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
  mp.x     = Number(mp.x)
  mp.y     = Number(mp.y)
  ; 初期値を指定します
  mp.layer = mp.layer || '0'
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

[layopt layer="message0" visible="true"]

#akane
キャラクターに豊かな表情をつけたり、着せ替えさせられるようにしたりするには――[p]
立ち絵を[<y]パーツごとに分割して[>]表示する仕組みを作るのがおススメだよ。[p]
立ち絵１枚に絵１枚だと、絵の数もゲーム容量も膨大になっちゃう……。[p]
その点、パーツごとに分割しておけばゲーム容量がかなり節約できるし、[p]
使える立ち絵パターンが倍々に増えていくから、表情に細かい変化をつけやすいね。[p]
その分、仕組みを作るのはちょっと面倒だけど。[p]
実はいま！　私も分割表示されてるから、表情を個別に変えてみよっか？[p]
目伏せ。[akane/me/fuse][l]
目笑い。[akane/me/warai][l]
目閉じ。[akane/me/toji][p]
眉笑い。[akane/mayu/happy][l]
眉怒り。[akane/mayu/angry][l]
眉悲しみ。[akane/mayu/sad][p]
口あ。[akane/kuchi/a][l]
口う。[akane/kuchi/u][l]
口お。[akane/kuchi/o][p]
汗。[akane/option/ase][l]
照れ。[akane/option/tere][l]
涙。[akane/option/namida][p]
[akane/option/ase/off]
[akane/option/tere/off]
[akane/option/namida/off]
[akane/usual]

[akane/mayu/happy]
ふだんはパーツの組み合わせを[<y]ひとつの表情変更マクロ[>]として登録して使うようにして……。[p]
[akane/me/warai]
必要に応じて個別にパーツを変えるといいかな。[p]
[akane/usual]
さて。[p]
[akane/kuchi/a]
このように、パーツを分割することで細かい表情を作りやすくなるけれど、[p]
[akane/angry]
[<y]アニメーション[>]の際に不都合が起こりやすい……ということがあるわ。[p]
[akane/kuchi/u]
たとえば、パーツを個別にフェードアウトさせてみると……。[p]

; [anim]×４
; パーツそれぞれにアニメーションを適用します。
[anim time="1000" name="akane_part_mayu"  opacity="0"]
[anim time="1000" name="akane_part_me"    opacity="0"]
[anim time="1000" name="akane_part_kuchi" opacity="0"]
[anim time="1000" name="akane_part_base"  opacity="0"]
[wait time="1000"]

; [anim]×４
; 同上。
[anim time="1000" name="akane_part_mayu"  opacity="255"]
[anim time="1000" name="akane_part_me"    opacity="255"]
[anim time="1000" name="akane_part_kuchi" opacity="255"]
[anim time="1000" name="akane_part_base"  opacity="255"]
[wait time="1000"]

わかってもらえるかな。[p]
[akane/sad]
個別にフェードアウトさせると、重なってる部分だけ不透明度が高くなっちゃうんだよね。[p]
[akane/me/fuse]
上下左右に移動させるときも、移動がずれるかもしれないし。[p]
…………。[p]
[akane/happy]
……そこで！[p]
[<y]ラッピング[>]というテクニックが使えるわ。[p]
[akane/usual]
これはプログラミングの領域に足を突っ込んでるから、詳しいことは説明しないけれど。[p]
１０個のボールを別々に動かすのは大変だけど、袋に入れてまとめて動かすのは簡単……。[p]
みたいな感じかな。[p]
[akane/kuchi/a]
そうすると、[p]

; [wrap]
; これは独自マクロです(→macro.ks)。
; あかねのパーツ群をひとつのラップでくるみます。
; 以降はこのラップに対してアニメーション処理を行います。
[wrap layer="0" page="fore" x="280" y="40" width="400" height="600" wrap_name="akane_all" name="akane_part_base, akane_part_mayu, akane_part_me, akane_part_kuchi"]

; [anim]
; 上のwrapで新たに指定できるようになったakane_allに対してアニメーションを適用してみます。
[anim time="1000" name="akane_all"  opacity="0"]
[wait time="1000"]
[anim time="1000" name="akane_all"  opacity="255"]
[wait time="1000"]

[akane/usual]
どうかな。[p]
これなら、特定の場所の不透明度が高くなるってことはきっとないと思うわ。[p]
[akane/happy]
使いやすいマクロにまとめておいたから、興味のある人はチェックしてね。[p]

; [chara_delete]
; キャラクター情報をせっかく細かく定義しましたが、
; この章でしか使わないので削除しておきます。
; そんなに削除する必要性もない気はしますが。
[chara_delete name="akane_part_base" ]
[chara_delete name="akane_part_me"   ]
[chara_delete name="akane_part_mayu" ]
[chara_delete name="akane_part_kuchi"]

[jump storage="select.ks"]