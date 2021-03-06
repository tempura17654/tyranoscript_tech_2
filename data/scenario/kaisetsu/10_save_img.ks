
; == 10_save_img.ks ========================================

; セーブサムネイルの変更を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
いきなりだけど、あなたは怖いの苦手？

; [glink]
; 怖いのが苦手かどうか答えてもらう選択肢です。
; targetはどちらも同じなので一見選択肢の意味がないようですが、
; exp属性に違いがあることに着目してください！
; 1か0か、ゲーム変数f.horrorに格納する値を変えているわけですね。
[glink color="black" text="苦手です"     x="310" y="200" target="*Part2" width="240" exp="f.horror = 0"]
[glink color="black" text="そうでもない" x="310" y="300" target="*Part2" width="240" exp="f.horror = 1" ]
[s]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane:happy
そっかー……わかった、参考にするね。[p]
#akane:default
……。[p]
ここでは［save_img］について説明するよ。[p]
これは、セーブファイルの[<y]サムネイル画像[>]を指定するタグです。[p]
通常、セーブファイルのサムネイル画像はゲーム画面の[<y]キャプチャ画像[>]になるんだけど、[p]
［save_img］を使えば[<y]好きな画像[>]をサムネイルにできるよ。[p]
よし、じゃあ……。[p]
#akane:happy
まずはふつうにセーブしてみて！

; [wait][showsave]
; ちょっと待った後にセーブ画面を出します。
[wait time="500"]
[showsave]
[p]

#akane:default
セーブした？[p]
じゃあ、今度はサムネイルを指定してみるよ。[p]

; [save_img]
; サムネイルを変更します。
; cond 属性に着目してください！
; この中が正しいときだけタグが実行されます。
; f.horror には 1 か 0 のどちらかが入っているので、
; 必ずどちらか一方が実行されることになります。
[save_img storage="../fgimage/nobekore_x1.jpg" cond="f.horror == 0"]
[save_img storage="save_img_horror.jpg"        cond="f.horror == 1"]

#akane:doki
ハイッ！　指定してみたから、ここでセーブしてみよーう。

[wait time="500"]
[showsave]
[p]

#akane:default
セーブした？[p]
じゃあ、サムネイルを確認してみてね。

[wait time="500"]
[showsave]
[p]

#akane:happy
ふふ、こんな感じの機能だよ。[p]
#akane:default
どんなサムネイルにするかは自由！[p]
YouTubeの動画みたいに、サムネイルに目を引く文字を入れてもいいね。[p]
そうそう、あと、サムネイルを指定するメリットとして……。[p]
セーブの動作が軽くなるってことがあるよ。[p]
ゲーム画面のキャプチャってけっこう処理が重いんだよね。[p]
まあ、それはあくまでおまけの効用なんだけど。[p]
#akane:happy
じゃあみんな、いろんなアイディアを出してみてね！[p]

; [save_img]
; サムネイル設定を元に戻します。
[save_img storage="default"]

[jump storage="select.ks"]