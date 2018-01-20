
; == 18_gif.ks =============================================

; gif画像のすすめ。

; ==========================================================



; [chara_new][chara_face]
; キャラクターをパーツごとに定義していきます。
; 一部にgif画像を指定しているだけで、基本的には18_part.ksの内容と同一です。
; 解説はそちらを参照してください。
; ※ face属性について補足 ※
; _animと後ろについているものがアニメーション画像、
; ついていないものが静止画像です。
[chara_new  name="akane_anim_base"  jname="あかね"    storage="chara/akane_anim/base.png"            ]
[chara_new  name="akane_anim_me"                      storage="chara/akane_anim/me_usual.gif"        ]
[chara_face name="akane_anim_me"    face="usual"      storage="chara/akane_anim/me_usual.gif"        ]
[chara_face name="akane_anim_me"    face="usual_anim" storage="chara/akane_anim/me_usual_anim.gif"   ]
[chara_face name="akane_anim_me"    face="angry"      storage="chara/akane_anim/me_angry.gif"        ]
[chara_face name="akane_anim_me"    face="angry_anim" storage="chara/akane_anim/me_angry_anim.gif"   ]
[chara_face name="akane_anim_me"    face="happy"      storage="chara/akane_anim/me_happy.gif"        ]
[chara_new  name="akane_anim_kuchi"                   storage="chara/akane_anim/kuchi_usual.gif"     ]
[chara_face name="akane_anim_kuchi" face="usual"      storage="chara/akane_anim/kuchi_usual.gif"     ]
[chara_face name="akane_anim_kuchi" face="usual_anim" storage="chara/akane_anim/kuchi_usual_anim.gif"]
[chara_face name="akane_anim_kuchi" face="angry"      storage="chara/akane_anim/kuchi_angry.gif"     ]
[chara_face name="akane_anim_kuchi" face="angry_anim" storage="chara/akane_anim/kuchi_angry_anim.gif"]

[macro name="akane/show"]
  [iscript]
  mp.x = Number(mp.x);
  mp.y = Number(mp.y);
  [endscript]
  [chara_show name="akane_anim_base"  left="& mp.x +   0" top="& mp.y +   0" time="0"]
  [chara_show name="akane_anim_me"    left="& mp.x + 144" top="& mp.y + 151" time="0"]
  [chara_show name="akane_anim_kuchi" left="& mp.x + 192" top="& mp.y + 209" time="0"]

  ; [eval]
  ;【！】ここに着目してください。
  ; ゲーム変数 f.akane_kuchi に 'usual' という文字列データを格納しています。
  ; これは現在のあかねの口の形がなにか？です。（具体的には[chara_face]で指定したface属性の値）
  [eval exp="f.akane_kuchi = 'usual']

[endmacro]

; [macro]～[endmacro]
; あかねの目変更用マクロを定義します。
[macro name="akane/me/usual"][chara_mod name="akane_anim_me" face="usual_anim" time="0"][endmacro]
[macro name="akane/me/happy"][chara_mod name="akane_anim_me" face="happy"      time="0"][endmacro]
[macro name="akane/me/angry"][chara_mod name="akane_anim_me" face="angry_anim" time="0"][endmacro]

; [macro]～[endmacro]
; あかねの口変更用マクロを定義します。
; f.akane_kuchi の更新を忘れないようにします。
[macro name="akane/kuchi/usual"]
  [chara_mod name="akane_anim_kuchi" face="usual" time="0"]
  [eval exp="f.akane_kuchi = 'usual']
[endmacro]
[macro name="akane/kuchi/angry"]
  [chara_mod name="akane_anim_kuchi" face="angry" time="0"]
  [eval exp="f.akane_kuchi = 'angry']
[endmacro]

; [macro]～[endmacro]
; 表情一括変更用マクロ定義。
[macro name="akane/usual"]
  [akane/me/usual]
  [akane/kuchi/usual]
[endmacro]
[macro name="akane/happy"]
  [akane/me/happy]
  [akane/kuchi/usual]
[endmacro]
[macro name="akane/angry"]
  [akane/me/angry]
  [akane/kuchi/angry]
[endmacro]

; [macro]～[endmacro]
; 独自マクロ[akane/say]を定義します。
; あかねがしゃべるときに口パクをつけさせるために、特殊な処理を入れています。
[macro name="akane/say"]
#akane
; [chara_mod]
; face属性に着目してください。
; f.akane_kuchi に入っている文字列に '_anim' を加えたものを
; face属性に指定することで、アニメーションを開始しているのです。
[chara_mod name="akane_anim_kuchi" time="0" face="& f.akane_kuchi + '_anim'"]
[endmacro]

; [macro]～[endmacro]
; 独自マクロ[_p]を定義します。これは[p]の代わりに使います。
; 上の[akane/say]であかねが口パクを開始するのですが、
; いつまでのパクパクしたままではまずいので、
; テキストを表示し終わった際に口パクを止めさせたいわけです。
[macro name="_p"]
; [chara_mod]
; f.akane_kuchi をface属性に指定することで、'_anim'が外れますので、
; アニメーションが停止することになります。
[chara_mod name="akane_anim_kuchi" time="0" face="& f.akane_kuchi"]
[p]
[endmacro]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view chara="no"]

; [akane/show]
; これは独自マクロです。あかねを表示します。
[akane/show x="280" y="40"]

#
キャラクターを表示[p]

; [akane/usual]
; マクロ。あかねを標準の顔にします。
[akane/usual]
目パチ開始[p]


; [akane/say]
; マクロ。発言者欄に「あかね」と入れる＋口パクの開始。
[akane/say]
口パク開始－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－!!![_p]

; [akane/angry]
; マクロ。あかねを怒り顔に。
[akane/angry]
[akane/say]

表情を変更したうえで口パク開始－－－－－－－－－－－－－－－－－－－－－－－－－－－－!!![_p]

; [akane/me/usual]
; マクロ。あかねの眼だけ通常に。
[akane/me/usual]
[akane/say]

目だけパーツ変更したうえで口パク開始－－－－－－－－－－－－－－－－－－－－－－－－－!!![_p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[akane/usual]
[akane/say]

GIF画像でマスク[_p]

; [mask]～[mask_off]
; graphic属性にノイズ画像を指定してみる。
; このノイズ画像の大きさは240x640で、対する画面サイズは960×640。
; 画面サイズが異なる場合、マスク画像は画面サイズにフィットするようにリサイズされます。
; ノイズ画像が鮮明に映ってもしょうがないですし、使用時に引き伸ばされることを想定して
; わざと最初から狭い横幅でGIF画像を作っておくことで
; ファイルサイズを節約している意図があります。
[mask     time=" 500" graphic="mask_noise.gif"]
[bg   time="   0" storage="umi.jpg"]
[wait time=" 800"]
[mask_off time="1000" wait="true"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

[akane/say]
通常、gifは複数回出すと再生時間が同期する[_p]

; [image]
; ５秒カウントダウンするだけのgif画像を、
; [image]タグでふつうに出します。
; すると、すべての画像で再生時間が一致します。
; また、このカウントダウンgifはループ再生をしないように設定しているのですが、この場合、
; １度この画像を出してから５秒経ったあとに同じ画像を出すと、
; 最後のコマ（真っ黒のコマ）が現れるだけになってしまいます。
[image layer="0" storage="count_down.gif" left="100" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="200" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="300" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="400" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="500" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="600" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="700" top="100"]

[wait time="500"]
[image layer="0" storage="count_down.gif" left="800" top="100"]


[akane/say]
同期を回避するマクロの使用例[_p]

; [macro]～[endmacro]
; gif画像を毎回新たに読み込んで使用するマクロ、[image_gif]を定義します。
; すべての属性値をそのまま[image]に渡して、storageだけ上書きする仕様ですので、
; [image]タグとまったく同じ使い方ができます。
[macro name="image_gif"]
; リクエストするURLに、唯一無二のクエリをつけます。
; これによって、キャッシュの利用を防ぎます（毎回新規に読み込む）。
[iscript]
tf.storage = mp.storage + '?' + new Date().getTime();
[endscript]
[image * storage="&tf.storage"]
[endmacro]

; [image_gif]
; 定義したマクロを早速使っていきます。
[image_gif layer="0" storage="count_down.gif" left="100" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="200" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="300" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="400" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="500" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="600" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="700" top="300"]

[wait time="500"]
[image_gif layer="0" storage="count_down.gif" left="800" top="300"]

[freeimage layer="1"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

[akane/say]
以上です[_p]

; [chara_delete]
; あかねのキャラ定義を削除します。
[chara_delete name="akane_anim_base "]
[chara_delete name="akane_anim_me   "]
[chara_delete name="akane_anim_kuchi"]

[jump storage="select.ks"]