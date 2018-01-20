
; == 16_message.ks =========================================

; メッセージウィンドウ周りのテクニックの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
メッセージレイヤーをフェードアウト。[l]

; [anim]
; layer="message0"を指定することで、
; メッセージレイヤー０にあるすべての要素にアニメーションを実行することができます。
[anim layer="message0" time="700" opacity="  0"]
[wait time="1000"]
[anim layer="message0" time="700" opacity="255"]
[wait time="1000"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
[cm]メッセージレイヤーの背景をフェードアウト。[l]

; [anim]
; name="message_outer"を指定することで、
; メッセージの背景だけにアニメーションを適用することができます。
[anim name="message_outer" time="700" opacity="  0"]
[wait time="1000"]
[anim name="message_outer" time="700" opacity="255"]
[wait time="1000"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

;-------------------------------------------------------
*Part3.1
;-------------------------------------------------------

[cm]
#akane
名前欄を出し入れする手法①[p]
［position］タグで２個のメッセージウィンドウ素材を切り替える。[p]

; [position]
; フレームに用いる画像を変えます。
; message_window.pngと違って、名前欄の部分がありません。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]
[chara_ptext name=""]消す、[wait time="500"]

; 名前欄のある画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window.png"]
[chara_ptext name="akane"]出す、[wait time="500"]

; 名前欄のない画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]
[chara_ptext name=""]消す、[wait time="500"]

; 名前欄のある画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window.png"]
[chara_ptext name="akane"]出す。[p]

;-------------------------------------------------------
*Part3.2
;-------------------------------------------------------

#akane
名前欄を出し入れする手法②[p]
名前欄のないウィンドウ素材を基本とする。[p]

[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]

そこに［image］タグで名前欄画像を出す。[p]

[image name="chara_name_image" layer="message0" zindex="100" storage="name_area.png" left="24" top="442" width="121"]

キャラクターの名前を操作する際に一緒に名前欄画像も操作する（マクロ化すると便利。）[p]

; [::]
; これは独自マクロです(→macro.ks)。
; 名前欄を空白にするついでに、画像も非表示にします。
[::]
消す、[wait time="500"]

; [:yamato:]
; これは独自マクロです(→macro.ks)。
; 名前欄に「やまと」を入れるついでに、名前欄の画像も表示します。
[:yamato:]
出す、[wait time="500"]

[::]
消す、[wait time="500"]

[:akane:]
出す。[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

; [position][anim][layopt]
; ２個目のメッセージウィンドウを定義・フェードインします。
; いったん不透明度をゼロ→レイヤー設定自体は表示→透明度を255までアニメーション、
; としているところがポイントです。
[position layer="message1" page="fore" left="0" top="170" width="960" height="260" visible="true" frame="message_window_3.png"]
[position layer="message1" page="fore" margint="85" marginl="25" marginr="25"]
[anim     layer="message1" time="  0" opacity="  0"]
[layopt   layer="message1" visible="true"]
[anim     layer="message1" time="400" opacity="255"]
[wait time="400"]

; [current]
; 現在操作すべきメッセージレイヤが何かをエンジンに教えてあげるタグです。
; [er]
; 現在操作すべきメッセージレイヤに入っているテキストを消去するタグです。
; ([cm]とは明確に働きが異なります。[cm]はすべてのメッセージレイヤを対象とする他、
; フリーレイヤーの解放なども同時に行うなどの働きがあります。)
[current layer="message1"][er]
メッセージレイヤーを複数出す。[l]

[current layer="message0"][er]
下を操作。[l]

[current layer="message1"][er]
上を操作。[l]

[current layer="message0"][er]
下を操作。[l]

[current layer="message1"][er]
上を操作。[l][cm]

; [anim][layopt]
; ２個目のメッセージウィンドウをフェードアウト→レイヤー設定自体も非表示。
[anim   layer="message1" time="700" opacity="0"]
[wait time="700"]
[layopt layer="message1" visible="false"]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

; [chara_move][chara_show]
; やまとの登場とそれに伴うあかねの移動です。
[chara_move name="akane" left="70" anim="true" time="700"]
[chara_show name="yamato" left="470" top="10"]

; [anim][position][deffont][resetfont]
; このあたりはメっセージウィンドウの余白の変更、
; それに伴うフォント設定の位置調整など。
[anim name="chara_name_area"  left="+=200" time="0"]
[anim name="chara_name_image" left="+=200" time="0"]
[position layer="message0" marginl="220" marginr="30"]
[deffont size="32"][resetfont]

; [chara_show]
; ピックアップ用のキャラクターを出す。
; キャラクターの定義→first.ks。
; すべてのキャラクターの立ち絵をこのname="pickup"の定義に突っ込んでいます。
; width="450"として、実際の立ち絵よりはやや縮小されて表示されるようにしています。
; ※ 注意
; 素材側での工夫も必要です。
; ◎すべての立ち絵の「横幅」を統一する。
; ◎すべての立ち絵の「顔の位置」を統一する。
; この２点が成立していない場合、この手法だとうまくいきません。
[chara_show name="pickup" time="0" left="-80" top="380" layer="message0" zindex="1000" width="450"]

; [macro]～[endmacro]
; キャラクターの表情変更用のマクロ[mod]を定義します。
; これは、通常の立ち絵の表情を変えるついでに、
; ピックアップ用の立ち絵の表情も変えるというものです。
[macro name="mod"]
  [chara_mod wait="false"  cross="%cross" name="%name" face="%face"]
  ; [chara_mod]
  ; face属性にJavaScript式を用いることで、ちょっとした工夫をしています。
  [chara_mod name="pickup" cross="%cross" face="& mp.name + '/' + mp.face" wait="%wait"]
[endmacro]

[current layer="message0"]
#akane
顔付近の画像をメッセージウィンドウに出して立ち絵と連動させて変更する。[l]

; [mod]×10
; 上で定義したマクロを早速使っていきます。
[mod name="akane"  face="happy"  ]
[mod name="akane"  face="angry"  ]
[mod name="akane"  face="sad"    ]
[mod name="akane"  face="doki"   ]
[mod name="akane"  face="default"]
[mod name="yamato" face="happy"  ]
[mod name="yamato" face="default"]
[mod name="yamato" face="sad"    ]
[mod name="yamato" face="tohoho" ]
[mod name="yamato" face="default"]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

[cm]
#yamato
以上です[p]

[chara_hide layer="message0" name="pickup" time="0"]
[free layer="message0" name="chara_name_image"]
[set_message_window]
[jump storage="select.ks"]