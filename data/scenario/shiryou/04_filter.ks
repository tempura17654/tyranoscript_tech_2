
; == 04_filter.ks ==========================================

; フィルター効果の解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]

; ※ 　　　　　注意　　　　　　 ※
; ※ あかねはレイヤー１に居ます ※

; [chara_move]
; キャラクターを動かすタグです。
; ここでは、あかねをleft="70"の位置に動かしています。
[chara_move time="800" wait="false" anim="true" left="70" name="akane" wait="false"]

; [chara_show][filter][anim][wa]
; やまとを画面外右端に表示し、真っ黒にするフィルターをかけ、
; animによって画面内に引っ張り出し、その完了をwaで待ちます。
[chara_show layer="1" name="yamato" left="280" top="10" time="700" face="default"]
[chara_move           name="yamato" left="470" time="800" anim="true"]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
あかねに効果を一通りかける[p]

; [filter]
; ひたすらあかねに対して効果をかけていきます。
[filter layer="1" name="akane" grayscale="100"]
;↑
グレースケール１００[p]

; [filter]
; これをかけた時点で上のグレースケール１００は外れます。
; フィルター効果をかけると、前にかかっていた効果は消えるわけですね。
[filter layer="1" name="akane" sepia="100"]
;↑
セピア１００[p]

[filter layer="1" name="akane" saturate="200"]
;↑
彩度２００[p]

[filter layer="1" name="akane" hue="120"]
;↑
色相１２０度回転[p]

[filter layer="1" name="akane" hue="240"]
;↑
色相２４０度回転[p]

[filter layer="1" name="akane" hue="360"]
;↑
色相３６０度回転[r]（もとに戻る）[p]

[filter layer="1" name="akane" invert="100"]
;↑
階調反転１００[p]

[filter layer="1" name="akane" brightness="0"]
;↑
明るさ０[r]（絵に透明な部分があると多少目立つ）[p]

[filter layer="1" name="akane" brightness="200"]
;↑
明るさ２００[p]

[filter layer="1" name="akane" brightness="5000 0000 0000 0000"]
;↑
明るさ５０００兆[p]

[filter layer="1" name="akane" contrast="50"]
;↑
コントラスト５０[p]

[filter layer="1" name="akane" contrast="200"]
;↑
コントラスト２００[p]

[filter layer="1" name="akane" blur="10"]
;↑
ぼかし１０[p]

[filter layer="1" name="akane" opacity="50"]
;↑
不透明度５０[r]（半透明）[p]

[filter layer="1" name="akane" opacity="100"]
;↑
不透明度１００[r]（完全不透明）[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
ひとつのオブジェクトに対して複数の効果をかけることが可能[p]

[filter layer="1" name="akane" blur="8" brightness="30"]
;↑
輝度３０＋ぼかし８[p]

[filter layer="1" name="akane" hue="120" saturate="200"]
;↑
色相１２０度回転＋彩度２００[p]

; 補足しておきますと、複数の効果をかけるとき、
; 属性を記述する順番は効果に影響を与えません。
; 
;     [filter layer="1" name="akane" invert="100" brightness="0"]
;     [filter layer="1" name="akane" brightness="0" invert="100"]
;
; 上のふたつのタグは、どちらも同じ挙動を示します。
; (どちらも真っ黒になる。)

; [free_filter]
; フィルター効果を解放します。
; layer属性もname属性も指定しなかった場合、
; いままでかけてきたすべてのフィルター効果が外れます。
[free_filter]


;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; ここの解説はテキストをもって代えさせていただきます。

[free_filter]
#akane
レイヤー[<y]そのもの[>]に効果をかけることができる[p]
いま、二人のキャラクターはともにレイヤー１にいるので、レイヤー１そのものに効果をかける[p]

[filter layer="1" blur="10"]
;↑
レイヤー１をぼかし１０[p]

[filter layer="1" invert="100"]
;↑
レイヤー１を階調反転１００[p]

ここで、さらにレイヤー１にいるオブジェクトに個別に効果を与えることができる[p]

[filter layer="1" name="akane" brightness="0"]
;↑
あかねを明るさ０[p]
この場合、まずあかねが〈明るさ０〉で真っ黒になったあと、レイヤー１の〈階調反転〉が効き、[p]
結果としてあかねが真っ白になる[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

; ここの解説はテキストをもって代えさせていただきます。

[free_filter]
#akane
使い勝手の良さそうな演出の例[p]

[filter layer="base" blur="4"]
;↑
背景だけぼかし４[p]
キャラクターが強調される[p]

[filter layer="base" brightness="15" blur="10"]
[filter layer="1"    brightness="15" blur="10"]
;↑
背景＆レイヤー１に明るさ１５＋ぼかし１０[p]
この状態でレイヤー２に演出文字

[mtext size="100" text="Tyrano Script!" x="0" y="220" color="0xffffff" layer="2" align="center" width="960" in_effect="bounceIn"]
[p]

[filter layer="base" sepia="100"]
[filter layer="1"    sepia="100"]
;↑
背景＆レイヤー１にセピア１００[p]

; [layermode]
; 画像/特定の色を画面上に合成するタグです。
; ここでは、画面のふちだけ白くなっている画像をスクリーン合成しています。
[layermode time="  0" graphic="layer_frame_white.png" mode="screen"]
;↑
さらに白モヤフレームを合成（IE、Edgeは未対応）[p][free_layermode time="0"]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

[free_filter]
#akane
backレイヤーとの連携も可能[p]

; [backlay]
; レイヤー１の情報をバックレイヤーにコピーします。
[backlay layer="1"]

; [filter]
; バックレイヤーのあかねにこっそりフィルター効果をかけておきます。
[filter  layer="1" page="back" name="akane" invert="100"]

backレイヤーにこっそりフィルターをかけておいてから、[p]

; [trans]
; レイヤー１をトランジションします。
[trans layer="1" time="700"]
[wt]

トランジションしてみる[p]

; [free_filter]
; バックレイヤーのあかねにかかっていたフィルター効果を取り除きます。
[free_filter layer="1" name="akane" page="back"]

; [trans]
; レイヤー１をトランジション。
[trans layer="1" time="700"]

逆も可能[p]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

#akane
以上です[p]

[jump storage="select.ks"]