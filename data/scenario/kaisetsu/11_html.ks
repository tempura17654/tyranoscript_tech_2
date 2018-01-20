
; == 11_html.ks ============================================

; HTMLの埋め込みやWEBリンクの張り方を説明します。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
ティラノスクリプトは[<y]HTML[>]で動くエンジン。[p]
HTMLっていうのは、[<y]Webページ[>]を形作っている言語のことだよ。[p]
そんなティラノスクリプトは、[<y]任意のHTML[>]を[r]ゲーム中に記述して――[p]
#akane:happy
その内容を[<y]ゲーム画面に挿入[>]できるんだ～。[p]
#akane:default
任意のHTMLが記述できるということは、つまり[<y]Webサービスの埋め込み[>]ができるってこと！[p]
インターネットに接続されていれば、ゲーム中でYouTubeだって見れちゃうよっ!![p]
ちょっとやってみようか。[p]
#akane:happy
ネットにつながっていれば、ティラノビルダーのPVが見れるよ。[p]

; [layopt]
; メッセージウィンドウを消します。
[layopt layer="message0" visible="false"]

; [keyframe]～[endkeyframe]
; スマホを下から上に持ち上げるだけのキーフレームアニメーションを定義します。
; それだけのために！？という感じですが、[anim]よりも動作が軽快なので、
; 大きな画像を動かすときはキーフレームアニメーションを使うことを検討するとよいです。
[keyframe name="sumaho_up"]
  [frame p="  0%" y="640"]
  [frame p="100%" y="  0"]
[endkeyframe]

; [image][kanim][wait][stop_kanim]
; スマホ画像を出して、キーフレームアニメーションを適用して、
; アニメの完了を待ち、待ったらキーフレームアニメーションを切ります。
[image name="sumaho" layer="1" storage="sumaho.png" x="0" y="0"]
[kanim name="sumaho" time="700" keyframe="sumaho_up"]
[wait                time="700"]
[stop_kanim name="sumaho"]

; [html]～[endhtml]
; YouTube埋め込み用のHTMLコードを貼り付けます。
; name="youtube"を指定しておくことで、
; 埋め込んだhtmlをのちのち[anim]などで操作できるようになります。
[html name="youtube"]
<iframe style="position: absolute; left: 200px; top: 160px;" width="560" height="315" src="https://www.youtube.com/embed/310BjKiIPAk" frameborder="0" allowfullscreen></iframe>
; 上のコード（<iframe>～</iframe>）は、YouTube視聴ページの「共有」ボタン→「埋め込む」を選択すると生成できます。
; ※ ここでは、さらに style="～" を指定することで、位置を調整しています。
; 　 詳しくはHTMLやCSSの解説サイトをご参照ください。
[endhtml]

; [anim][wait]
; フェードインしてちょっと待ちます。
; name="youtube" というのは、上の[html]で指定したものです。ご確認ください。
[anim  time="  0" name="youtube" opacity="  0"]
[anim  time="800" name="youtube" opacity="255"]
[wait  time="200"]

; [glink][anim][s]
;「見るのをやめる」ボタンを出して、これもフェードインします。
[glink  name="end" color="black" text="見るのをやめる" x="310" y="530" target="*Part2"]
[anim   name="end" time="  0" opacity="  0"]
[anim   name="end" time="800" opacity="255"]
[s]

;
; ※ HTML挿入中は、クリックでシナリオを進めることができなくなります。
; 　 したがってこのように、何か先に進めるボタンを出してやらねばなりません。
;




;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; [cm]
; ボタンやフリーレイヤーを消します。
[cm]

; [free]
; スマホ画像を消します。
[free layer="1" name="sumaho" time="1000"]

; [layopt]
; メッセージウィンドウを表示します。
[layopt layer="message0" visible="true"]

#akane:default
こういうのを見てると、ゲームを作りたくなってうずうずしてこない？[p]
#akane:happy
私はしちゃうよっ!![p]
#akane:default
さて。[p]
これに関連した機能として……。[p]
ティラノスクリプトから[<y]Webページを開く[>]こともできるよ。[p]
ゲームがアプリ版の場合は、既定のブラウザで。[l]
ゲームがブラウザ版の場合は、新しいタブで。[p]
#akane:happy
それぞれ指定のWebページを開けるんだ～。[p]
#akane:default
この機能は、たとえばゲームから[<y]公式サイト[>]へのリンクを張ったり、[p]
[<y]アンケートページ[>]へのリンクを張ったりするのに使えるね!![p]
試しにGoogleフォームで作ったアンケートページを開いてみよっか。[l]

; [glink][s]
; 選択肢をふたつ表示して停止します。
[glink color="black" text="いいよ" x="310" y="200" target="*Part2.1" width="240"]
[glink color="black" text="やめて" x="310" y="300" target="*Part2.2" width="240"]
[s]



;-----------------------------------------------------------
*Part2.1
;-----------------------------------------------------------

#akane:default
よし、開くよ。[p]
#akane:doki
あ！　これただのサンプルだから、回答しなくていいからね。[p]
#akane:default

; [web]
; アンケートページを開いてみます。
[web url="https://docs.google.com/forms/d/e/1FAIpQLSfn4R_92dwcwHkZFuZl0ZFQN2bGq0JJJWf9IbLN65Ot2XaAWw/viewform?usp=sf_link"]
[wait time="3000"]

開いたよ～。[p]

[jump target="*Part3"]



;-----------------------------------------------------------
*Part2.2
;-----------------------------------------------------------

#akane:doki
そう？　じゃあやめとく。[p]

[jump target="*Part3"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:default
どうかな。[p]
Webページを埋め込んだり、開いたり。[p]
#akane:happy
いろいろできそうだね!![p]

[jump storage="select.ks"]