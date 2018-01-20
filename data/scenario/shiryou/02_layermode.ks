
; == 02_layermode.ks =======================================

; レイヤーモードの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
～画像×すべての合成方法～[p]


; [layermode]
; レイヤーを合成します。
; mode="normal"に着目してください！
; mode="normal"を指定すると、まったく普通の合成方法で合成することができます。
; graphic属性には画像のパス（通常はimageフォルダが基準となりますが、
; ここでは ../fgimage/ としてfgimgaeフォルダのファイルを選択）を指定します。
[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="normal"]
;↑
これが合成する画像。[p]

; [free_layermode]
; 合成レイヤーを解放します。
; name属性を指定することで個別に解放することもできますが、
; ここでは指定していませんので、
; 存在するすべての合成レイヤーを解放することになります。
; また、time属性にミリ秒を指定することで、時間をかけて解放できます。
[free_layermode time="0"]

; [layermode]
; 以下、mode属性だけを変えながら同じ記述の繰り返しです。
[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="multiply"]
;↑
multiply（乗算）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="screen"]
;↑
screen（スクリーン）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="overlay"]
;↑
overlay（オーバーレイ）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="darken"]
;↑
darken（比較(暗)）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="lighten"]
;↑
lighten（比較(明)）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="color-dodge"]
;↑
color-dodge（覆い焼きカラー）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="color-burn"]
;↑
color-burn（焼き込みカラー）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="hard-light"]
;↑
hard-light（ハードライト）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="soft-light"]
;↑
soft-light（ソフトライト）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="difference"]
;↑
difference（差の絶対値）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="exclusion"]
;↑
exclusion（除外）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="hue"]
;↑
hue（色相）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="saturation"]
;↑
saturation（彩度）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="color"]
;↑
color（カラー）。[p][free_layermode time="0"]

[layermode time="  0" graphic="../fgimage/nobekore_x1.jpg" mode="luminosity"]
;↑
luminosity（輝度）。[p][free_layermode time="0"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

[skipstop]
#akane
～単色×すべての合成方法～[p]

; [layermode]
; 色を合成することもできます。
; 画像を用意する必要なし。
; graphic属性の代わりにcolor属性を指定すればよいです。
; ほかの使い方は同じ。
[layermode time="  0" color="0x00ccff" mode="normal"]
;↑
これが合成する色。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="multiply"]
;↑
multiply（乗算）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="screen"]
;↑
screen（スクリーン）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="overlay"]
;↑
overlay（オーバーレイ）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="darken"]
;↑
darken（比較(暗)）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="lighten"]
;↑
lighten（比較(明)）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="color-dodge"]
;↑
color-dodge（覆い焼きカラー）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="color-burn"]
;↑
color-burn（焼き込みカラー）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="hard-light"]
;↑
hard-light（ハードライト）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="soft-light"]
;↑
soft-light（ソフトライト）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="difference"]
;↑
difference（差の絶対値）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="exclusion"]
;↑
exclusion（除外）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="hue"]
;↑
hue（色相）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="saturation"]
;↑
saturation（彩度）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="color"]
;↑
color（カラー）。[p][free_layermode time="0"]

[layermode time="  0" color="0x00ccff" mode="luminosity"]
;↑
luminosity（輝度）。[p][free_layermode time="0"]




;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

[skipstop]
#akane
～画像合成で可能な表現いろいろ～[p]

; [layermode]
; 指定した画像は、リサイズを受けず、画面を埋めるように縦横に繰り返されます。
; これを利用して、わざわざ画面サイズ分の画像を用意せずとも、
; 小さなパターン画像をgraphic属性に指定することで、
; 画面全体を埋めるレイヤー合成が可能です。
[layermode time="  0" graphic="layer_dot_white.png" mode="lighten" opacity="150"]
;↑
白ドットパターン。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_dot_black.png" opacity="120"]
;↑
黒ドットパターン。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_line_black.png" opacity="120"]
;↑
走査線パターン。[l]

[layermode time="  0" graphic="layer_tv.gif" mode="lighten" opacity="100"]
;↑
＋モニタ光のGIF。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_frame_white.png" mode="screen"]
;↑
白モヤフレーム。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_frame_black.png"]
;↑
黒モヤフレーム。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_frame_clasic.png" mode="color-dodge"]
;↑
クラシカルフレーム。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_intensive_black.png" mode="multiply"]
;↑
集中線（黒）。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_intensive_white.png" mode="screen"]
;↑
集中線（白）。[p][free_layermode time="0"]

[layermode time="  0" graphic="layer_intensive_toon.png" mode="color-dodge" opacity="255" name="toon"]
;↑
集中線（コミカル）。[l]

; [keyframe]～[endkeyframe]
; 拡縮を繰り替すキーフレームアニメーションです。
; 反復再生を前提としています。
[keyframe name="zoom_in_out"]
  [frame p="  0%" scale="1.0"]
  [frame p="100%" scale="1.1"]
[endkeyframe]

; [kanim]
; 合成レイヤーに対してキーフレームアニメーションを適用することができます(処理重し)。
; name属性の指定の仕方にクセがありますので、注意してください。
; アニメーションを適用するときのname属性は、
;
;     layer_mode_ + ([layermode]のときに指定したname属性の値)
;
; です。
[kanim name="layer_blend_toon" keyframe="zoom_in_out" direction="alternate" time="800" count="infinite" easing="ease-in-out"]
;↑
＋拡縮アニメーション。[p][free_layermode time="0"]


;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

[skipstop]
#akane
～色合成で可能な表現いろいろ～[p]

; [layermode]
; やっていることは単なる色合成なのですが、
; 色と合成モードの組み合わせによって、
; いろんな効果が可能になります。
[layermode time="  0" color="0x504000" mode="color"]
;↑
セピア。[p][free_layermode time="0"]

[layermode time="  0" color="0xffffff" mode="color"]
;↑
グレースケール。[p][free_layermode time="0"]

[layermode time="  0" color="0xffffff" mode="difference"]
;↑
階調反転。[p][free_layermode time="0"]

[layermode time="  0" color="0xff0000" mode="saturation"]
;↑
彩度増加。[p][free_layermode time="0"]

[layermode time="  0" color="0x002266" opacity="200"]
;↑
夜っぽい。[p][free_layermode time="0"]

[layermode time="  0" color="0xff6600" mode="soft-light"]
;↑
夕焼けっぽい。[p][free_layermode time="0"]

[layermode time="  0" color="0xAAAAAA" mode="hard-light"]
;↑
煙たい。あるいは霧模様。[p][free_layermode time="0"]

[layermode time="  0" color="0x999999" mode="color-burn"]
;↑
焼き込み。[p][free_layermode time="0"]

[layermode time="  0" color="0x444444" mode="color-burn"]
;↑
焼き込み強。[p][free_layermode time="0"]

;[layermode time="  0" color="0x000000" mode="color-burn"]
;↑
;焼き込み最強。[p][free_layermode time="0"]

[layermode time="  0" color="0x000000" mode="overlay"]
;↑
暗い部分を強調。[p][free_layermode time="0"]

[layermode time="  0" color="0xffffff" mode="overlay"]
;↑
明るい部分を強調。[p][free_layermode time="0"]

[layermode time="  0" color="0x000000" mode="overlay"]
[layermode time="  0" color="0xffffff" mode="overlay"]
;↑
コントラスト増加。[p][free_layermode time="0"]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

[skipstop]
#akane
以上です[p]



[jump storage="select.ks"]