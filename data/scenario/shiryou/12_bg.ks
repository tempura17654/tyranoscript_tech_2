
; == 12_bg.ks ==============================================

; V450から使えるようになった切り替え方法について学びます。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view chara="no"]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------


#
背景の切り替えを全部見ます

[glink color="black" text="見る"     x="310" y="200" target="*Part1.1" width="240"]
[glink color="black" text="スキップ" x="310" y="300" target="*Part2  " width="240"]
[s]



;-------------------------------------------------------
*Part1.1
;-------------------------------------------------------

; 全部見ていきます。

[cm]fadeIn[l]

; [bg][wait]
; 背景を切り替えてウェイトします。
[bg   time="700" storage="rouka.jpg" method="fadeIn"]
[wait time="300"]

[cm]fadeInDown[l]
[bg   time="700" storage="umi.jpg" method="fadeInDown"]
[wait time="300"]

[cm]fadeInLeft[l]
[bg   time="700" storage="eki.jpg" method="fadeInLeft"]
[wait time="300"]

[cm]fadeInRight[l]
[bg   time="700" storage="mori.jpg" method="fadeInRight"]
[wait time="300"]

[cm]fadeInUp[l]
[bg   time="700" storage="rouka.jpg" method="fadeInUp"]
[wait time="300"]

[cm]fadeInDownBig[l]
[bg   time="700" storage="umi.jpg" method="fadeInDownBig"]
[wait time="300"]

[cm]fadeInLeftBig[l]
[bg   time="700" storage="eki.jpg" method="fadeInLeftBig"]
[wait time="300"]

[cm]fadeInRightBig[l]
[bg   time="700" storage="mori.jpg" method="fadeInRightBig"]
[wait time="300"]

[cm]fadeInUpBig[l]
[bg   time="700" storage="rouka.jpg" method="fadeInUpBig"]
[wait time="300"]

[cm]lightSpeedIn[l]
[bg   time="700" storage="umi.jpg" method="lightSpeedIn"]
[wait time="300"]

[cm]rotateIn[l]
[bg   time="700" storage="eki.jpg" method="rotateIn"]
[wait time="300"]

[cm]rotateInDownLeft[l]
[bg   time="700" storage="mori.jpg" method="rotateInDownLeft"]
[wait time="300"]

[cm]rotateInDownRight[l]
[bg   time="700" storage="rouka.jpg" method="rotateInDownRight"]
[wait time="300"]

[cm]rotateInUpLeft[l]
[bg   time="700" storage="umi.jpg" method="rotateInUpLeft"]
[wait time="300"]

[cm]rotateInUpRight[l]
[bg   time="700" storage="eki.jpg" method="rotateInUpRight"]
[wait time="300"]

[cm]zoomIn[l]
[bg   time="700" storage="mori.jpg" method="zoomIn"]
[wait time="300"]

[cm]zoomInDown[l]
[bg   time="700" storage="rouka.jpg" method="zoomInDown"]
[wait time="300"]

[cm]zoomInLeft[l]
[bg   time="700" storage="umi.jpg" method="zoomInLeft"]
[wait time="300"]

[cm]zoomInRight[l]
[bg   time="700" storage="eki.jpg" method="zoomInRight"]
[wait time="300"]

[cm]zoomInUp[l]
[bg   time="700" storage="mori.jpg" method="zoomInUp"]
[wait time="300"]

[cm]slideInDown[l]
[bg   time="700" storage="rouka.jpg" method="slideInDown"]
[wait time="300"]

[cm]slideInLeft[l]
[bg   time="700" storage="umi.jpg" method="slideInLeft"]
[wait time="300"]

[cm]slideInRight[l]
[bg   time="700" storage="eki.jpg" method="slideInRight"]
[wait time="300"]

[cm]slideInUp[l]
[bg   time="700" storage="mori.jpg" method="slideInUp"]
[wait time="300"]

[cm]bounceIn [l]
[bg   time="700" storage="rouka.jpg" method="bounceIn "]
[wait time="300"]

[cm]bounceInDown[l]
[bg   time="700" storage="umi.jpg" method="bounceInDown"]
[wait time="300"]

[cm]bounceInLeft[l]
[bg   time="700" storage="eki.jpg" method="bounceInLeft"]
[wait time="300"]

[cm]bounceInRight[l]
[bg   time="700" storage="mori.jpg" method="bounceInRight"]
[wait time="300"]

[cm]bounceInUp[l]
[bg   time="700" storage="rouka.jpg" method="bounceInUp"]
[wait time="300"]

[cm]rollIn[l]
[bg   time="700" storage="umi.jpg" method="rollIn"]
[wait time="300"]

[cm]flipInX[l]
[bg   time="700" storage="eki.jpg" method="flipInX"]
[wait time="300"]

[cm]flipInY[l]
[bg   time="700" storage="room.jpg" method="flipInY"]
[wait time="300"]

[cm]vanishIn[l]
[bg   time="700" storage="mori.jpg" method="vanishIn"]
[wait time="300"]

[cm]puffIn[l]
[bg   time="700" storage="mori.jpg" method="puffIn"]
[wait time="300"]

[cm]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
/*
IE, Edgeで動作しないものを含むためコメントアウト。
#
独自に追加してみた切り替え方法を見てみます

[glink color="black" text="見る"     x="310" y="200" target="*Part2.1" width="240"]
[glink color="black" text="スキップ" x="310" y="300" target="*Part3  " width="240"]
[s]

;-------------------------------------------------------
*Part2.1
;-------------------------------------------------------

[cm]brightIn[l]
[bg   time="1000" storage="rouka.jpg" method="brightIn"]
[wait time=" 500"]

[cm]columnIn[l]
[bg   time="1000" storage="umi.jpg" method="columnIn"]
[wait time=" 500"]

[cm]sliceIn[l]
[bg   time="1000" storage="eki.jpg" method="sliceIn"]
[wait time=" 500"]

[cm]circleIn[l]
[bg   time="2000" storage="mori.jpg" method="circleIn"]
[wait time=" 500"]

[cm]clipIn[l]
[bg   time="2000" storage="rouka.jpg" method="clipIn"]
[wait time=" 500"]
*/



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#
[cm]トランジションを見てみます

[glink color="black" text="見る"     x="310" y="200" target="*Part3.1" width="240"]
[glink color="black" text="スキップ" x="310" y="300" target="*Part4  " width="240"]
[s]



;-------------------------------------------------------
*Part3.1
;-------------------------------------------------------

; [image]
; レイヤー2の裏面レイヤー(page="back")に一度描写します。
; 最初のトランジションに使用します。
[image layer="2" page="back" storage="nobekore_x2.jpg" width="600" left="180" top="40" name="nov"]



; [trans]タグは、指定レイヤーの〈裏面〉の画面を時間をかけて〈表面〉に出す機能です。
; こう言ってしまうと簡単ですが、実際の挙動はわりとややこしいです。
; はじめのうちは、意味がわからなくてもよいのでとりあえずコピペしてしまって、
; いろいろいじりながら挙動を眺めると理解が深まると思います。



[cm]fadeIn & fadeOut[l]

; [trans][wt][wait]
; フェードイン処理。
; レイヤー2の裏面レイヤーを表面レイヤーに向けてfadeInメソッドでトランジションさせ、
; そのアニメーションの終了を待ちます。
[trans     layer="2" time="700" method="fadeIn"]
[wt]
[wait time="300"]

; [backlay][trans][freeimage][wt][freeimage][wait]
; フェードアウト処理。
; こちらがややこしい。
; まず[backlay]で現在の表面レイヤーの情報を裏面にコピーする。
; 裏面をfadeOutメソッドで（重要！fadeInではない）トランジションさせ始めると同時に
; レイヤー2の表面レイヤーを解放し、
; トランジションが完了した瞬間に再び表面レイヤーを解放します。
; これで結局フェードアウトができるのですが、
; わかりにくいうちはコピペで動かしてよいと思います。
[backlay layer="2"]
[trans     layer="2" time="700"  method="fadeOut"]
[freeimage layer="2"]
[wt]
[freeimage layer="2"]
[wait time="300"]



; 以降、繰り返し。マクロ化してしまいます。


; [macro]～[endmacro]
; イン・トランジションのマクロ[trans_in]を定義します。
[macro name="trans_in"]
  ;「%」記号はマクロに渡された値をそのまま渡す記号です。
  ; さらに「|」を書くことで、マクロに値が渡されなかった場合の値（初期値）を指定できます。
  [trans layer="%layer|0" time="%time|700" method="%method|fadeIn"]
  [wt]
[endmacro]

; [macro]～[endmacro]
; アウト・トランジションのマクロ[trans_out]を定義します。
[macro name="trans_out"]
  [backlay   layer="%layer|0"]
  [trans     layer="%layer|0" time="%time|700" method="%method|fadeOut"]
  [freeimage layer="%layer|0"]
  [wt]
  [freeimage layer="%layer|0"]
[endmacro]

[cm]fadeInDown & fadeOutDown[l]
[trans_in  time="700" layer="2" method="fadeInDown"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutDown"]
[wait      time="300"]

[cm]fadeInLeft & fadeOutLeft[l]
[trans_in  time="700" layer="2" method="fadeInLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutLeft"]
[wait      time="300"]

[cm]fadeInRight & fadeOutRight[l]
[trans_in  time="700" layer="2" method="fadeInRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutRight"]
[wait      time="300"]

[cm]fadeInUp & fadeOutUp[l]
[trans_in  time="700" layer="2" method="fadeInUp"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutUp"]
[wait      time="300"]

[cm]fadeInDownBig & fadeOutDownBig[l]
[trans_in  time="700" layer="2" method="fadeInDownBig"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutDownBig"]
[wait      time="300"]

[cm]fadeInLeftBig & fadeOutLeftBig[l]
[trans_in  time="700" layer="2" method="fadeInLeftBig"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutLeftBig"]
[wait      time="300"]

[cm]fadeInRightBig & fadeOutRightBig[l]
[trans_in  time="700" layer="2" method="fadeInRightBig"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutRightBig"]
[wait      time="300"]

[cm]fadeInUpBig & fadeOutUpBig[l]
[trans_in  time="700" layer="2" method="fadeInUpBig"]
[wait      time="300"]
[trans_out time="700" layer="2" method="fadeOutUpBig"]
[wait      time="300"]

[cm]lightSpeedIn & lightSpeedOut[l]
[trans_in  time="700" layer="2" method="lightSpeedIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="lightSpeedOut"]
[wait      time="300"]

[cm]rotateIn & rotateOut[l]
[trans_in  time="700" layer="2" method="rotateIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rotateOut"]
[wait      time="300"]

[cm]rotateInDownLeft & rotateOutDownLeft[l]
[trans_in  time="700" layer="2" method="rotateInDownLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rotateOutDownLeft"]
[wait      time="300"]

[cm]rotateInDownRight & rotateOutDownRight[l]
[trans_in  time="700" layer="2" method="rotateInDownRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rotateOutDownRight"]
[wait      time="300"]

[cm]rotateInUpLeft & rotateOutUpLeft[l]
[trans_in  time="700" layer="2" method="rotateInUpLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rotateOutUpLeft"]
[wait      time="300"]

[cm]rotateInUpRight & rotateOutUpRight[l]
[trans_in  time="700" layer="2" method="rotateInUpRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rotateOutUpRight"]
[wait      time="300"]

[cm]zoomIn & zoomOut[l]
[trans_in  time="700" layer="2" method="zoomIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="zoomOut"]
[wait      time="300"]

[cm]zoomInDown & zoomOutDown[l]
[trans_in  time="700" layer="2" method="zoomInDown"]
[wait      time="300"]
[trans_out time="700" layer="2" method="zoomOutDown"]
[wait      time="300"]

[cm]zoomInLeft & zoomOutLeft[l]
[trans_in  time="700" layer="2" method="zoomInLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="zoomOutLeft"]
[wait      time="300"]

[cm]zoomInRight & zoomOutRight[l]
[trans_in  time="700" layer="2" method="zoomInRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="zoomOutRight"]
[wait      time="300"]

[cm]zoomInUp & zoomOutUp[l]
[trans_in  time="700" layer="2" method="zoomInUp"]
[wait      time="300"]
[trans_out time="700" layer="2" method="zoomOutUp"]
[wait      time="300"]

[cm]slideInDown & slideOutDown[l]
[trans_in  time="700" layer="2" method="slideInDown"]
[wait      time="300"]
[trans_out time="700" layer="2" method="slideOutDown"]
[wait      time="300"]

[cm]slideInLeft & slideOutLeft[l]
[trans_in  time="700" layer="2" method="slideInLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="slideOutLeft"]
[wait      time="300"]

[cm]slideInRight & slideOutRight[l]
[trans_in  time="700" layer="2" method="slideInRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="slideOutRight"]
[wait      time="300"]

[cm]slideInUp & slideOutUp[l]
[trans_in  time="700" layer="2" method="slideInUp"]
[wait      time="300"]
[trans_out time="700" layer="2" method="slideOutUp"]
[wait      time="300"]

[cm]bounceIn  & bounceOut[l]
[trans_in  time="700" layer="2" method="bounceIn "]
[wait      time="300"]
[trans_out time="700" layer="2" method="bounceOut"]
[wait      time="300"]

[cm]bounceInDown & bounceOutDown[l]
[trans_in  time="700" layer="2" method="bounceInDown"]
[wait      time="300"]
[trans_out time="700" layer="2" method="bounceOutDown"]
[wait      time="300"]

[cm]bounceInLeft & bounceOutLeft[l]
[trans_in  time="700" layer="2" method="bounceInLeft"]
[wait      time="300"]
[trans_out time="700" layer="2" method="bounceOutLeft"]
[wait      time="300"]

[cm]bounceInRight & bounceOutRight[l]
[trans_in  time="700" layer="2" method="bounceInRight"]
[wait      time="300"]
[trans_out time="700" layer="2" method="bounceOutRight"]
[wait      time="300"]

[cm]bounceInUp & bounceOutUp[l]
[trans_in  time="700" layer="2" method="bounceInUp"]
[wait      time="300"]
[trans_out time="700" layer="2" method="bounceOutUp"]
[wait      time="300"]

[cm]rollIn & rollOut[l]
[trans_in  time="700" layer="2" method="rollIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="rollOut"]
[wait      time="300"]

[cm]flipInX & flipOutX[l]
[trans_in  time="700" layer="2" method="flipInX"]
[wait      time="300"]
[trans_out time="700" layer="2" method="flipOutX"]
[wait      time="300"]

[cm]flipInY & flipOutY[l]
[trans_in  time="700" layer="2" method="flipInY"]
[wait      time="300"]
[trans_out time="700" layer="2" method="flipOutY"]
[wait      time="300"]

[cm]vanishIn & vanishOut[l]
[trans_in  time="700" layer="2" method="vanishIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="vanishOut"]
[wait      time="300"]

[cm]puffIn & puffOut[l]
[trans_in  time="700" layer="2" method="puffIn"]
[wait      time="300"]
[trans_out time="700" layer="2" method="puffOut"]
[wait      time="300"]

[freeimage layer="2" page="fore"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#
[cm]スクリーンマスクを見てみます

[glink color="black" text="見る"     x="310" y="200" target="*Part4.1" width="240"]
[glink color="black" text="スキップ" x="310" y="300" target="*Part5  " width="240"]
[s]



;-------------------------------------------------------
*Part4.1
;-------------------------------------------------------

[cm]fadeIn & fadeOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeIn"]
[wait     time="300"]
[mask_off time="700" effect="fadeOut"]
[wait     time="300"]

[cm]fadeInDown & fadeOutDown[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInDown"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutDown"]
[wait     time="300"]

[cm]fadeInLeft & fadeOutLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInLeft"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutLeft"]
[wait     time="300"]

[cm]fadeInRight & fadeOutRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInRight"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutRight"]
[wait     time="300"]

[cm]fadeInUp & fadeOutUp[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInUp"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutUp"]
[wait     time="300"]

[cm]fadeInDownBig & fadeOutDownBig[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInDownBig"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutDownBig"]
[wait     time="300"]

[cm]fadeInLeftBig & fadeOutLeftBig[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInLeftBig"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutLeftBig"]
[wait     time="300"]

[cm]fadeInRightBig & fadeOutRightBig[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInRightBig"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutRightBig"]
[wait     time="300"]

[cm]fadeInUpBig & fadeOutUpBig[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="fadeInUpBig"]
[wait     time="300"]
[mask_off time="700" effect="fadeOutUpBig"]
[wait     time="300"]

[cm]lightSpeedIn & lightSpeedOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="lightSpeedIn"]
[wait     time="300"]
[mask_off time="700" effect="lightSpeedOut"]
[wait     time="300"]

[cm]rotateIn & rotateOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rotateIn"]
[wait     time="300"]
[mask_off time="700" effect="rotateOut"]
[wait     time="300"]

[cm]rotateInDownLeft & rotateOutDownLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rotateInDownLeft"]
[wait     time="300"]
[mask_off time="700" effect="rotateOutDownLeft"]
[wait     time="300"]

[cm]rotateInDownRight & rotateOutDownRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rotateInDownRight"]
[wait     time="300"]
[mask_off time="700" effect="rotateOutDownRight"]
[wait     time="300"]

[cm]rotateInUpLeft & rotateOutUpLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rotateInUpLeft"]
[wait     time="300"]
[mask_off time="700" effect="rotateOutUpLeft"]
[wait     time="300"]

[cm]rotateInUpRight & rotateOutUpRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rotateInUpRight"]
[wait     time="300"]
[mask_off time="700" effect="rotateOutUpRight"]
[wait     time="300"]

[cm]zoomIn & zoomOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="zoomIn"]
[wait     time="300"]
[mask_off time="700" effect="zoomOut"]
[wait     time="300"]

[cm]zoomInDown & zoomOutDown[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="zoomInDown"]
[wait     time="300"]
[mask_off time="700" effect="zoomOutDown"]
[wait     time="300"]

[cm]zoomInLeft & zoomOutLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="zoomInLeft"]
[wait     time="300"]
[mask_off time="700" effect="zoomOutLeft"]
[wait     time="300"]

[cm]zoomInRight & zoomOutRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="zoomInRight"]
[wait     time="300"]
[mask_off time="700" effect="zoomOutRight"]
[wait     time="300"]

[cm]zoomInUp & zoomOutUp[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="zoomInUp"]
[wait     time="300"]
[mask_off time="700" effect="zoomOutUp"]
[wait     time="300"]

[cm]slideInDown & slideOutDown[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="slideInDown"]
[wait     time="300"]
[mask_off time="700" effect="slideOutDown"]
[wait     time="300"]

[cm]slideInLeft & slideOutLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="slideInLeft"]
[wait     time="300"]
[mask_off time="700" effect="slideOutLeft"]
[wait     time="300"]

[cm]slideInRight & slideOutRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="slideInRight"]
[wait     time="300"]
[mask_off time="700" effect="slideOutRight"]
[wait     time="300"]

[cm]slideInUp & slideOutUp[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="slideInUp"]
[wait     time="300"]
[mask_off time="700" effect="slideOutUp"]
[wait     time="300"]

[cm]bounceIn  & bounceOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="bounceIn "]
[wait     time="300"]
[mask_off time="700" effect="bounceOut"]
[wait     time="300"]

[cm]bounceInDown & bounceOutDown[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="bounceInDown"]
[wait     time="300"]
[mask_off time="700" effect="bounceOutDown"]
[wait     time="300"]

[cm]bounceInLeft & bounceOutLeft[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="bounceInLeft"]
[wait     time="300"]
[mask_off time="700" effect="bounceOutLeft"]
[wait     time="300"]

[cm]bounceInRight & bounceOutRight[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="bounceInRight"]
[wait     time="300"]
[mask_off time="700" effect="bounceOutRight"]
[wait     time="300"]

[cm]bounceInUp & bounceOutUp[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="bounceInUp"]
[wait     time="300"]
[mask_off time="700" effect="bounceOutUp"]
[wait     time="300"]

[cm]rollIn & rollOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="rollIn"]
[wait     time="300"]
[mask_off time="700" effect="rollOut"]
[wait     time="300"]

[cm]flipInX & flipOutX[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="flipInX"]
[wait     time="300"]
[mask_off time="700" effect="flipOutX"]
[wait     time="300"]

[cm]flipInY & flipOutY[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="flipInY"]
[wait     time="300"]
[mask_off time="700" effect="flipOutY"]
[wait     time="300"]

[cm]vanishIn & vanishOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="vanishIn"]
[wait     time="300"]
[mask_off time="700" effect="vanishOut"]
[wait     time="300"]

[cm]puffIn & puffOut[l]
[mask     time="700" graphic="../fgimage/nobekore_x1.jpg" effect="puffIn"]
[wait     time="300"]
[mask_off time="700" effect="puffOut"]
[wait     time="300"]

[cm]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

#
以上です[p]

[jump storage="select.ks"]