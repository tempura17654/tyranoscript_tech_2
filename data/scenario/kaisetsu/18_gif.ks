
; == 18_gif.ks =============================================

; gif画像のすすめ。

; ==========================================================



; [chara_new][chara_face]
; キャラクターをパーツごとに定義していきます。
; 一部にgif画像を指定しているだけで、基本的には18_part.ksの内容と同一です。
; 解説はそちらを参照してください。
; ※face属性について補足します。
; 　_animと後ろについているものがアニメーション画像、
;   ついていないものが静止画像です。
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
  [chara_show name="akane_anim_base"  left="&mp.x +   0" top="&mp.y +   0" time="0"]
  [chara_show name="akane_anim_me"    left="&mp.x + 144" top="&mp.y + 151" time="0"]
  [chara_show name="akane_anim_kuchi" left="&mp.x + 192" top="&mp.y + 209" time="0"]

  ; [eval]
  ;【！】ここに着目してください。
  ; ゲーム変数 f.akane_kuchi に 'usual' という文字列データを格納しています。
  ; これは現在のあかねの口の形（具体的には[chara_face]で指定したface属性の値）です。
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
  [chara_mod name="akane_anim_kuchi" time="0" face="&f.akane_kuchi + '_anim'"]
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
  [chara_mod name="akane_anim_kuchi" time="0" face="&f.akane_kuchi"]
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

#akane

みんなは[<y]GIF[>]画像って知ってる？[p]
読み方は……開発者の人は[<y]ジフ[>]って表明してるんだけど、私は[<y]ギフ[>]派かな～。[p]
GIF画像の特徴はなんといっても、画像の形式でありながら[<y]アニメーション[>]もさせられること！[p]
パラパラ漫画と同じで、複数のコマを用意して、それぞれを指定時間で切り替える方式ね。[p]
これを使えば……。[p]

; [akane/usual]
; マクロ。あかねを標準の顔にします。
[akane/usual]

; [akane/say]
; マクロ。発言者欄に「あかね」と入れる＋口パクの開始。
[akane/say]

このとおり、[<y]目パチ[>]や[<y]口パク[>]のアニメーションが比較的気軽につけられるよ。[_p]

[akane/say]

比較的というのは――たとえばLive2Dだったり、CSSアニメーションだったり――[_p]

[akane/say]

そういうものと比較して気軽ってこと。[_p]

[akane/say]

GIF画像を用意して、いままでふつうの画像……たとえばPNG画像を指定していたところを、[_p]

[akane/say]

GIF画像に差し替えるだけで済むからね。[_p]

[akane/say]

この場合なら……。[_p]

; [image]
; gifを別に出してやる。
[image layer="1" storage="chara/akane_anim/me_usual_anim.gif"    x="&20+144" y="&40+151" time="500" wait="false"]
[image layer="1" storage="chara/akane_anim/kuchi_usual_anim.gif" x="&20+192" y="&40+209" time="500" wait="false"]
[image layer="1" storage="chara/akane_anim/kuchi_usual.gif"      x="&20+192" y="&90+209" time="500" wait="false"]

[akane/say]

定期的に[ruby text="まばた"]瞬きする目、動く口、静止した口……。[_p]

[akane/say]

こういうのを使ってるの。[_p]

[freeimage layer="1"]
; [akane/happy]
; マクロ。あかねをハッピーに。
[akane/happy]
[akane/say]

GIF画像ってすごいね!![_p]

; [akane/angry]
; マクロ。あかねを怒り顔に。
[akane/angry]
[akane/say]

でも、いくつか注意しなきゃいけないこともあるわ。[_p]

[akane/say]

「あれっ」と思った人もいると思うけど、GIFを画面上に[<y]複数個[>]、あるいは[<y]複数回[>]出した場合、[_p]
[akane/say]

[<y]再生時間が全部統一[>]されてしまうの。[_p]

[akane/say]

一応、回避する手段もあるんだけど、複雑だから資料編にだけ載せておくね。[_p]

; [akane/kuchi/usual]
; マクロ。あかねの口だけ標準に。
[akane/kuchi/usual]
[akane/say]

あと、色が[<y]256色[>]までしか扱えないのは、かなり痛いわね。[_p]

[akane/usual]
[akane/say]

まあ、そのへんはうまくやるしかないかな。[_p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[akane/say]

基本的に画像を指定する部分には全部使えるからノイズのGIFでマスク、なんてこともできるわ。[_p]

; [mask]～[mask_off]
; graphic属性にノイズ画像を指定してみる。
; このノイズ画像の大きさは240x640で、対する画面サイズは960×640。
; 画面サイズが異なる場合、マスク画像は画面サイズにフィットするようにリサイズされます。
; ノイズ画像が鮮明に映ってもしょうがないですし、使用時に引き伸ばされることを想定して
; わざと横幅を小さくしてファイルサイズを節約している意図があります。
[mask     time=" 500" graphic="mask_noise.gif"]
[bg   time="   0" storage="umi.jpg"]
[wait time=" 800"]
[mask_off time="1000" wait="true"]

[akane/say]

こんな感じでね。[_p]

[akane/say]

GIFが作れるソフトは無料のものがあるし、ブラウザ上でGIFを生成できるサイトもあるから、[_p]

[akane/happy]
[akane/say]

気になった人はチェックしてみようー!![_p]

; [chara_delete]
; あかねのキャラ定義を削除します。
[chara_delete name="akane_anim_base"]
[chara_delete name="akane_anim_me"]
[chara_delete name="akane_anim_kuchi"]

[jump storage="select.ks"]