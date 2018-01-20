
; == 12_bg.ks ==============================================

; V450から使えるようになった切り替え方法について学びます。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------


#akane:default
ティラノスクリプトでは、多くの背景の切り替え方法が使えるよ！[p]
V450以降なら……
#akane:happy
なんと[<y]30種類以上[>]の切り替え方法が選べます。[p]
いろいろやってみせようか。[p]

; [bg][wait]
; 自動で背景を切り替えていきます。
fadeInLeft。
[bg time="1000" storage="rouka.jpg" method="fadeInLeft"]
[wait time="600"]
vanishIn。
[bg time="1000" storage="mori.jpg" method="vanishIn"]
[wait time="600"]
zoomIn。
[bg time="1000" storage="umi.jpg" method="zoomIn"]
[wait time="600"]
bouceInDown。
[bg time="1000" storage="rouka.jpg" method="bounceInDown"]
[wait time="600"]
rotateIn。
[bg time="1000" storage="eki.jpg" method="rotateIn"]
[wait time="600"]
[cm]

#akane:default
とりあえず５個使ってみたよ。[p]
このまま全部見せると時間がかかっちゃうから[r]……もう一覧を見せちゃおう！[p]
#akane:default
それっ!!


; [chara_move][wa]
; あかねを右に相対的に660px動かしてそのアニメーションの完了を待ちます。
[chara_move name="akane" left="+=660" time="700" anim="true"]
[wa]

; [bgmovie]
; 背景で動画を再生します。
[bgmovie storage="effects.mp4"]
;[layermode_movie time="700" video="effects.webm" mode="normal"]

[cm]
#akane
これが使えるキーワードの一覧だよー!![p]
いやー、壮観だね～。[p]
気になるのがあったら、使ってみてね。[p]

; [stop_bgmovie]
; 動画の再生を終了します。
[stop_bgmovie time="700"]
;[free_layermode time="700"]

; [chara_move][wa]
; あかねを元に戻してその完了を待ちます。
[chara_move name="akane" left="-=660" time="700" anim="true"]
[wa]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
ちなみにいまのキーワードが使えるのは、背景の切り替えだけじゃないよ。[p]
［mask］［mask_off］タグによるスクリーン[r]マスクにも使えるし、それに……。[p]
［trans］タグによる、レイヤーごとのトランジションにも使えるの。[p]

#akane
じゃあ、やってみるよ。[p]


; [image]
; バックレイヤーに描写します。
[image     layer="2" page="back" storage="nobekore_x2.jpg" width="600" left="180" top="40" name="nov"]

zoomInUp。
; [trans][wt][wait][freeimage]
; 自動でレイヤー2を切り替えていきます。
; トランジション→トランジション完了待ち→ウェイト→レイヤー2消し。の繰り返し
[trans     layer="2" time="1400" method="zoomInUp"]
[wt]
[wait                time=" 800"]
[freeimage layer="2" time="1000"]
flipInY。
[trans     layer="2" time="1400" method="flipInY"]
[wt]
[wait                time=" 800"]
[freeimage layer="2" time="1000"]
rollIn。
[trans     layer="2" time="1400" method="rollIn"]
[wt]
[wait                time=" 800"]
[freeimage layer="2" time="1000"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

[cm]

#akane:happy
……さらに！[p]
これはちょっと高等なテクニックだけど……。[p]
#akane:default
CSSの知識があれば、オリジナルの切り替え方法も簡単に作れちゃうよ。[p]

[layopt layer="message0" visible="false"]
[bg   time="1000" storage="rouka.jpg" method="brightIn"]
[wait time="400"]
/*
; IE, Edgeで動作しないためコメントアウト。
[bg   time="1600" storage="eki.jpg  " method="columnIn"]
[wait time="400"]
[bg   time="2000" storage="umi.jpg  " method="sliceIn "]
[wait time="400"]
[bg   time="2000" storage="mori.jpg " method="circleIn"]
[wait time="400"]
[bg   time="2000" storage="room.jpg " method="clipIn  "]
[wait time="400"]
*/
[layopt layer="message0" visible="true"]

#akane:default
こんなのとかね。[p]
data/othersフォルダにanimate.cssってファイルを独自に作っていて、[p]
そこでアニメを定義してるんだよ～。[p]
#akane:happy
気になる人は、見てみてくださいっ！[p]
#akane:default
……CSSについて詳しいほど好きなアニメーションが組めるけれど、[p]
#akane:doki
ブラウザによっては動作しないこともよくあるので、気を付けてね。[p]

[jump storage="select.ks"]