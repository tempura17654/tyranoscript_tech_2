
; == 05_mask.ks ============================================

; スクリーンマスクの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
ここでは［mask］タグによる[<y]ゲーム画面のマスク[>]について説明するわ。[p]
このタグを使うと、ゲーム画面をすっぽりと覆うことができるよ。[p]
舞台の[<y]暗幕[>]をイメージしてもらえばいいかな。[p]
さて、実際に使ってみると……。[p]

; [mask]～[mask_off]
; マスクしている間に画面を書き換え、
; 1秒待った後にマスクを外します。
[mask     time=" 500"]
#akane:happy
[bg   time="   0" storage="mori.jpg"]
[wait time="1000"]
[mask_off time=" 500" wait="true"]

#akane
こんな感じ！[l]
#akane:default
_　びっくりした？[p]
画面を完全に覆い隠して……[<y]覆い隠している間に画面を作り直して[>]、マスクを外す……。[p]
という使い方ができる演出だね。[p]
もちろん[<y]色は自由に指定できる[>]し、[r]
[<y]アニメーションも30種類以上から選べる[>]よ。[p]
アニメーションについての詳しい説明は別の章でするけど、とりあえずいくつか見てみよっか？[p]

; 以下、color属性とeffect属性だけ変えて、同じことの繰り返しです。
[mask     time="700" effect="flipInY"      color="0x662211"]
[bg   time="  0" storage="umi.jpg"]
[wait time="700"]
[mask_off time="700" effect="flipOutY"     wait="true"     ]

[mask     time="700" effect="rotateIn"     color="0x00eeaa"]
[bg   time="   0" storage="rouka.jpg"]
[wait time="700"]
[mask_off time="700" effect="rotateOut"    wait="true"     ]

[mask     time="700" effect="fadeInUpBig"  color="0xeeaa00"]
[bg   time="   0" storage="room.jpg"]
[wait time="700"]
[mask_off time="700" effect="fadeOutUpBig" wait="true"     ]

#akane
いろいろあるね！　さらに……。[p]

; [mask]～[mask_off]
; graphicに画像を指定できます（imageフォルダが基準）。
[mask graphic="mask_logo.png" time="800" effect="rotateInDownRight"]
[bg   time="   0" storage="umi.jpg"]
[wait time="1000"]
[mask_off time=" 500" wait="true"]

#akane
この演出、見覚えがあるでしょー。[p]
#akane:happy
じつは、これもマスクを使ってるんだ～。[p]
#akane:default
そう……マスクには[<y]画像も指定できる[>]の。[p]
だから、いわゆる[<y]アイキャッチ画像[>]でマスクすることで、印象的な切り替えができるかもね。[p]
他にも、たとえばこんな感じで、[l]

; [mask]～[mask_off]
; あかね's View。
; こういうふうに視点移動を明示する作品はたまに見ます。
[mask graphic="mask_akane.png" time="1500" effect="fadeInRight"]
[bg   time="   0" storage="mori.jpg"]
[wait time="2500"]
[mask_off time="1500" wait="true" effect="fadeOutLeft"]

#akane
[<y]視点の切り替え[>]を明示してみたりとか。[p]
あとは……[l]

; [mask]～[mask_off]
; TVアニメで時間経過を示すときにトンボのイラストが使われるのをたまに見ますけれども、
; あれは何が由来なんでしょう。名前とかついてるんでしょうか。
[mask graphic="mask_tombo.png" time="800" effect="fadeInRightBig"]
[bg   time="   0" storage="room.jpg"]
[wait time="1000"]
[mask_off time=" 500" wait="true" effect="fadeOutLeftBig"]

#akane
テレビアニメでたまに見る[<y]謎のトンボ[>]演出をしてみたりとか。[p]
#akane:happy
いろいろ楽しめるね！[p]
みんなもマスクを使って楽しい画面の切り替えや再構築をしてみよう！[p]

[jump storage="select.ks"]