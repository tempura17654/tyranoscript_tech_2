
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
ティラノスクリプトには、[<y]レイヤーモード[>]という合成機能があるわ。[p]
乗算、スクリーン、覆い焼き、焼き込み、比較、差分……などなど。[p]
グラフィッカーの人にはおなじみのワードかな？[p]
#akane:doki
……それ以外の人はきっとワケわかんないよね。[p]
いま私が言ったのは、レイヤーモードのたくさんある[<y]合成方法[>]の一部。[p]
さて、どういうことかというと……。[p]

; [layermode]
; レイヤーを合成します。
; mode="normal"に着目してください！
; mode="normal"を指定すると、まったく普通の合成方法で合成することができます。
[layermode time="700" graphic="../fgimage/nobekore_x1.jpg" mode="normal"]

#akane:default
こういう一枚絵があるとするよね？[p]
これは普通の表示の仕方。一方で、この一枚絵をレイヤーモードで合成してみると……。[p]

; [free_layermode][layermode]
; レイヤーモードを消します。
; 消してから、今度はcolor-dodgeで合成します。
[free_layermode time="700"]
[layermode time="700" graphic="../fgimage/nobekore_x1.jpg" mode="color-dodge"]

#akane:happy
一例として、こうなるよー!![p]
#akane:default
これは[<y]覆い焼きカラー[>]っていう合成方法。[p]
もとの一枚絵の黒かった部分が透けて、白かった部分が光るように合成されるね。[p]

; 乗算合成。
[free_layermode time="700"]
[layermode time="700" graphic="../fgimage/nobekore_x1.jpg" mode="multiply"]

他によく使いそうなのだと……これが[<y]乗算[>]。[p]
さっきとは逆で、白い部分が透けるね。[p]

; スクリーン合成。
[free_layermode time="700"]
[layermode time="700" graphic="../fgimage/nobekore_x1.jpg" mode="screen"]

これは[<y]スクリーン[>]。黒い部分が透ける。[p]
#akane:happy
よく使うのはこの三つかな！[p]
#akane:default
[<y]白い部分を透かしたい[>]なら乗算、[<y]黒い部分を透かしたい[>]ならスクリーン……。[p]
黒い部分を透かした上で[<y]光っている感じにしたい[>]なら覆い焼きカラー[>]が良いと思う。[p]

[free_layermode time="700"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
合成方法は他にもいっぱいあるから、その一覧を見てみよう！[p]

; [mask]～[mask_off]
; スクリーンマスクしてから、サンプル画像一覧画面を作成するサブルーチンを呼びます。
[mask color="black" time="700" effect="fadeInDown"]
; [filter]
; ベースレイヤーとレイヤー１にぼかし＆暗くするフィルター効果。
[filter layer="base" blur="8" brightness="20"]
[filter layer="   1" blur="8" brightness="20"]
; [call]
; レイヤーモードのサンプル一覧を作成するサブルーチンを呼びます。
[call target="*Sub_TestBlend"]
; ※ 余談 ※
; サブルーチン先のコードは見る必要はないです。(かなり複雑なことをしているため)
; ｢ここで一覧を作成するサブルーチンを呼んでいるんだな｣というところだけ
; 理解していただければ、まったく問題ありません。
[wait time="100"]
[mask_off           time="700" effect="fadeOutDown"]

#akane
これは、上の「ブレンドする画像」を「ゲーム画面」に合成したときの結果一覧だよ。[p]
すこし画像が小さいかもだけど、雰囲気は伝わる[r]……かな？[p]
全部で15種類の合成方法があるから、いろんな使い方を考えてみてねっ!![p]

; [mask]～[mask_off]
; 画面を元に戻します。
[mask color="black" time="700" effect="fadeInDown"]
; [free_filter][free_layermode][freeimage]
; レイヤー、フィルター効果、合成レイヤーを解放します。
[free_filter]
[free_layermode]
[freeimage layer="2"]
[mask_off           time="700" effect="fadeOutDown"]

#akane:doki
レイヤーモードの注意点として、動作がちょっと重いからPC環境推奨……ということと、[p]
IEやEdgeなどの一部のブラウザで動作しない……ということがあるから、[p]
それだけおさえておいてね。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:default
ちなみに、画面サイズより小さい画像を指定すると画像が縦横に繰り返されるから、[p]
それを利用して、[<y]パターン画像[>]を合成する、なんてアイディアもあるわ。[p]

; 効果：電光掲示板
[layermode time="700" graphic="layer_dot_white.png" mode="lighten" opacity="150"]

白いドットを合成して電光掲示板っぽくしたり、[p][free_layermode time="700"]

; 効果：モニタ風
[layermode time="700" graphic="layer_line_black.png" opacity="120"]

黒い走査線を走らせてモニターっぽくしたりね。[p]

; 効果：モニタ風＋
[layermode time="700" graphic="layer_tv.gif" mode="lighten" opacity="100"]

さらにこんなGIF画像を合成してみたり……。[p][free_layermode time="700"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#akane:doki
…………。[p]
一気に説明しすぎたかな？[p]
もうちょっとだけ続くよ。[p]
#akane:default
レイヤーモード機能は画像だけじゃなくて、[r][<y]一色の色を指定して合成[>]することもできるの。[p]
画像を用意する必要がないから楽だし、一色の色だけでもけっこういろいろできるんだよ。[p]
いろいろやってみるね？[p]

; 効果：夜
[layermode time="700" color="0x002266" opacity="200"]

藍色を乗算合成して夜っぽく。[p][free_layermode time="700"]

; 効果：夕焼け
[layermode time="700" color="0xff6600" mode="soft-light"]

橙色をソフトライト合成して夕焼けっぽく。[p][free_layermode time="700"]

; 効果：霧あるいは充満した煙
[layermode time="700" color="0xAAAAAA" mode="hard-light"]

灰色をハードライト合成して煙たい部屋に。[p][free_layermode time="700"]

; 効果：セピア
[layermode time="700" color="0x503000" mode="color"]

茶色をカラー合成してセピアに。[p]

; 効果：セピア＋
[layermode time="700" graphic="layer_frame_white.png" mode="screen"]
[chara_mod time="700" name="akane" face="happy"]

さらに白いもやもや画像を合成すれば、古い写真みたいな雰囲気になるね。[p][free_layermode time="700"]


; 効果：階調反転
[layermode time="700" color="0xffffff" mode="difference"]
[chara_mod time="700" name="akane" face="default"]

白色を差分合成して階調を反転。[p][free_layermode time="700"]

; 効果：彩度増加
[layermode time="700" color="0xff0000" mode="saturation"]

赤色を彩度合成して彩度を上げる。[p][free_layermode time="700"]

; 効果：焼き込み
[layermode time="700" color="0x777777" mode="color-burn"]

灰色を焼き込み合成。[p]
#akane:doki
いやー、だいぶ焼き込んでるね～。[p][free_layermode time="700"]
#akane:default
……などなど。[p]
#akane:happy
どう？　色の合成だけでも遊べるでしょー。[p]
資料集のほうに、もうちょっと詳しく載せておくから、興味のある人は覗いてみてね。[p]
以上、レイヤーモードの説明でした～。[p]

[jump storage="select.ks"]






;-----------------------------------------------------------
*Sub_TestBlend
;-----------------------------------------------------------

; ここは技術的にかなり複雑なことをしています。
; ふつうにノベルゲームを製作するうえで必要になることはまずない技術ですから、
; 無理して読解に挑むことはありません。
; 特に強い興味をお持ちの方はご覧くださいませ。

[image layer="2" name="test" storage="../image/layer_test_b.png"  left="110" top="12" width="150" height="100"]
[ptext layer="2" text="ブレンドする画像" x="110" y="112" width="150" align="center"]
[iscript]
tf.list_of_mode = [
'',
'multiply',
'screen',
'overlay',
'darken',
'lighten',
'color-dodge',
'color-burn',
'hard-light',
'soft-light',
'difference',
'exclusion',
'hue',
'saturation',
'color',
'luminosity'
]
tf.list_of_mode_jp = [
'ゲーム画面',
':乗算',
':スクリーン',
':オーバーレイ',
':比較(暗)',
':比較(明)',
':覆い焼きｶﾗｰ',
':焼き込みｶﾗｰ',
':ハードライト',
':ソフトライト',
':差の絶対値',
':除外',
':色相',
':彩度',
':カラー',
':輝度'
]
tf.i = 0
tf.len = tf.list_of_mode.length
[endscript]
;-------------------------------------------------------
*NextLoop
;-------------------------------------------------------
[iscript]
tf.w = 150
tf.h = 100
tf.x = 110 + (tf.w + 42) * ( tf.i % 4   )
tf.y = 134 + (tf.h + 24) * ((tf.i / 4)|0)
tf.mode = tf.list_of_mode[tf.i]
tf.name = tf.i
tf.animname = 'layer_blend_' + tf.name;
tf.text = tf.mode + tf.list_of_mode_jp[tf.i]
[endscript]
[image layer="2" name="test" storage="../image/layer_test_a.png"  left="&tf.x" top="&tf.y" width="&tf.w" height="&tf.h"]
[layermode cond="tf.mode!=''" time="0" name="&tf.name" graphic="layer_test_b.png" mode="&tf.mode"               ]
[anim      cond="tf.mode!=''" time="0" name="&tf.animname" left="&tf.x" top="&tf.y" width="&tf.w" height="&tf.h"]
[ptext     layer="2" text="&tf.text" x="&tf.x-40" y="&tf.y+tf.h" width="&tf.w+80" align="center"]
[jump target="*NextLoop" cond="++tf.i < tf.len"]
[iscript]
$('.blendlayer').css('background-size', 'cover')
[endscript]
[return]