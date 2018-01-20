
; == 09_sleepgame.ks =======================================

; スリープゲームの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
［sleepgame］タグを使ってみる[p]

; [sleepgame]
; ここで眠って、*Part1.Sleepラベルの夢を見ます!!!!
[sleepgame target="*Part1.Sleep"]

#akane
［awakegame］で元通り[p]

[jump target="*Part2"]



;-------------------------------------------------------
*Part1.Sleep
;-------------------------------------------------------

; [sleepgame]で飛んでくるラベル。

#akane
ここはスリープラベル[p]

; いろいろやってめちゃくちゃにしてみます。どうでもいい処理なのでコメントは省略
[bg storage="../image/mask_noise.gif" time="0"]
[chara_show name="yamato" layer="0" left="500" top="-10" wait="false"]
[filter layer="1" name="akane" invert="100"]
[camera zoom="1.5" wait="false"]
[wait time="1000"]

ここでどれだけ画面を変えても、[p]

; [awakegame]
; 目覚めます!!!
[awakegame]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------



;-------------------------------------------------------
*Part2.1
;-------------------------------------------------------

#akane
sleepgame機能を持ったボタンを出してみる[p]

; [button]
; sleepgame機能を使えるボタンを出します。
; storage="config.ks" に飛びます。
; これは、ティラノスクリプトのデフォルトのコンフィグシナリオですね。
[button role="sleepgame" storage="config.ks" fix="true" graphic="button_gear.png" x="20" y="20" ]

; [ptext]
; 説明を出します。
[ptext layer="2" text="←クリックするとコンフィグ画面を開くボタン" size="32" x="100" y="29" color="0xffffff" edge="0x000000"]



;-------------------------------------------------------
*Part2.2
;-------------------------------------------------------

#akane
変数・条件分岐を活用すれば、回想シーンを作成することもできる[p]

; [button]
; storage="kaisetsu/09_sleepgame.ks" 
; target="*Part1"
; に飛ぶボタンです。
; ようは回想シーン、ということですが、とある工夫をしています。
; exp属性に着目してください。
; f.sleep というゲーム変数に 1 をぶち込む処理をしています。
; この変数が実際にどう使われているかは、ジャンプ先のシナリオファイルをご確認ください。
[button role="sleepgame" storage="kaisetsu/09_sleepgame.ks" target="*Part1" exp=" f.sleep = 1 " fix="true" graphic="button_gear.png" x="20" y="100" ]
[ptext layer="2" text="←クリックすると解説編の*Part1を回想するボタン" size="32" x="100" y="110" color="0xffffff" edge="0x000000"]



;-------------------------------------------------------
*Part2.3
;-------------------------------------------------------

#akane
ステータス画面に移行する機能も、sleepgameで作れる[p]

; [button]
; ステータスを表示。
; storage="kaisetsu/09_sleepgame.ks"
; target="*ShowStatus"
; に飛びます。
[button role="sleepgame" storage="kaisetsu/09_sleepgame.ks" target="*ShowStatus" fix="true" graphic="button_gear.png" x="20" y="180" ]
[ptext layer="2" text="←クリックするとステータス画面を開くボタン" size="32" x="100" y="192" color="0xffffff" edge="0x000000"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane
以上です

[glink color="black" text="目次に戻る" x="310" y="380" storage="select.ks" width="240"]
[s]