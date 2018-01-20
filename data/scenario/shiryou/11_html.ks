
; == 11_html.ks ============================================

; HTML関連の資料集。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]

/*

※ お願い ※

HTMLやCSSそのものについての解説をしはじめてしまうと、
もはやティラノスクリプトの分野を超えていまいますので、
それらについての解説は省略します。
ご不明な点については、各種解説サイトでの情報調達をお願い申し上げます。
(以下に挙げているのは検索でヒットするWebサイトのほんの一部です。)

●<style>要素について

・HTML文書にCSSを適用する
（http://www.htmq.com/csskihon/004.shtml）

・style 要素 - HTML | MDN
（https://developer.mozilla.org/ja/docs/Web/HTML/Element/style）

●<audio>要素について
 
・絶対に覚えておきたいHTML5の『audio要素』超基本を知る!!
（http://www.html5-memo.com/audio/player001/）

・audio 要素 - HTML | MDN
（https://developer.mozilla.org/ja/docs/Web/HTML/Element/audio）

●<video>要素について

・絶対に覚えておきたいHTML5の『video要素』超基本を知る!!
（http://www.html5-memo.com/video/basic01/）

・video 要素 - HTML | MDN
（https://developer.mozilla.org/ja/docs/Web/HTML/Element/video）

*/

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
〈audio〉要素を埋め込む。（再生する場合は音量注意）[p]

; [html]～[endhtml]
; コントロール可能なオーディオ要素を埋め込みます。
[html]
<style>
audio {
padding: 65px;
width: 350px;
}
</style>
<audio controls="controls">
<source src="data/bgm/music.ogg" type="audio/ogg">
<source src="data/bgm/music.m4a" type="audio/m4a">
</audio>
<audio controls="controls">
<source src="data/sound/cat_1.ogg" type="audio/ogg">
<source src="data/sound/cat_1.m4a" type="audio/m4a">
</audio>
<audio controls="controls">
<source src="data/sound/cat_5.ogg" type="audio/ogg">
<source src="data/sound/cat_5.m4a" type="audio/m4a">
</audio>
<audio controls="controls">
<source src="data/sound/crow_11.ogg" type="audio/ogg">
<source src="data/sound/crow_11.m4a" type="audio/m4a">
</audio>
[endhtml]

; [glink]
; html挿入中はクリックでのイベント進行が不可能になります。
; したがって、何か進めるボタンを出してやる必要があります。
[glink name="end" color="black" text="次へ" x="390" y="370" target="*Part2"]

; [s]
; 停止。
[s]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
〈video〉要素を埋め込む。[p]

; [html]～[endhtml]
; コントロール可能なビデオ要素の埋め込みを行います。
[html]
<style>
video {
position: absolute;
}
</style>
<video width="300" height="200" style="left:  30px; top:  30px;" loop="true" controls="controls">
<source src="data/video/rain.webm" type="video/webm">
<source src="data/video/rain.mp4"  type="video/mp4">
</video>
<video width="300" height="200" style="left:  30px; top: 260px;" loop="true" controls="controls">
<source src="data/video/feather.webm" type="video/webm">
<source src="data/video/feather.mp4"  type="video/mp4">
</video>
<video width="300" height="200" style="left: 630px; top:  30px;" loop="true" controls="controls">
<source src="data/video/kirakira.webm" type="video/webm">
<source src="data/video/kirakira.mp4"  type="video/mp4">
</video>
<video width="300" height="200" style="left: 630px; top: 260px;" loop="true" controls="controls">
<source src="data/video/sepianoise.webm" type="video/webm">
<source src="data/video/sepianoise.mp4"  type="video/mp4">
</video>
[endhtml]
[glink name="end" color="black" text="次へ" x="390" y="370" target="*Part3"]
[s]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane
YouTubeの動画を埋め込む。[p]

; [html]～[endhtml]
; YouTubeの動画を埋め込みます。
; ネットにつながっていない場合は何も表示されません。
[html name="youtube"]
; 下のコード（<iframe>～</iframe>）は、YouTube視聴ページの「共有」ボタン→「埋め込む」を選択すると生成できます。
; ただし style="～" の記述は独自に加えたものです。
<iframe style="position: absolute; left: 200px; top: 30px;" width="560" height="315" src="https://www.youtube.com/embed/310BjKiIPAk" frameborder="0" allowfullscreen></iframe>
[endhtml]
[glink  name="end" color="black" text="次へ" x="390" y="370" target="*Part4"]
[s]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------


#akane
テキストを埋め込む。[p]

; [filter]
; ベースと１レイヤを暗く＆ぼかし。
[filter layer="base" brightness="15" blur="8"]
[filter layer="1"    brightness="15" blur="8"]

; [layopt]
; メッセージレイヤを消します。
[layopt layer="message" visible="false"]

; [html]～[endhtml]
; テキストを埋め込みます。
; テキストを埋め込むときは、<style>要素でのフォントスタイル調整が必須になるでしょう。
; (ただ、わざわざ[html]～[endhtml]で記述しなくても、
; 別のCSSファイルに記述しておいて、それをどこかで[loadcss]タグで読み込んでおく、
; という手もあります。というより、そちらのほうがスマートですね。)
;
; name属性を指定することで、挿入するHTML要素を包むブロック要素のクラス名を指定することができます。
; これは[anim]タグなどで指定できるnameと共通のものです。
[html name="wrapper"]
<style>
.wrapper {
width: 100%;
text-align: center;
color: white;
font-family: メイリオ;
font-size: 40px;
}
.wrapper h1 {
font-weight: bold;
font-size: 80px;
line-height: 85px;
margin-top: 120px;
margin-bottom: 100px;
}
.wrapper h2 {
margin-top: 100px;
font-weight: bold;
font-size: 60px;
}
</style>
<h1>ティラノスクリプト<br>サンプルテクニック集２</h1>
<h2>制作</h2>
<p>STRIKE WORKS</p>
[endhtml]
[glink name="end" color="black" text="次へ" x="750" y="550" target="*Part5"]
[s]



;-------------------------------------------------------
*Part5
;-------------------------------------------------------

; [free_filter][layopt]
; 元に戻す。
[free_filter layer="base"]
[free_filter layer="1"]
[layopt layer="message0" visible="true"]

#akane
テキストを埋め込む＋アニメーション。[p]

[filter layer="base" brightness="15" blur="8"]
[filter layer="1"    brightness="15" blur="8"]
[layopt layer="message" visible="false"]
[html name="wrapper"]
<style>
.wrapper {
width: 100%;
text-align: center;
color: white;
font-family: メイリオ;
font-size: 40px;
padding-top: 640px;
}
.wrapper h1 {
font-weight: bold;
font-size: 80px;
line-height: 85px;
margin-top: 120px;
margin-bottom: 100px;
}
.wrapper h2 {
margin-top: 100px;
font-weight: bold;
font-size: 60px;
}
</style>
<h1>ティラノスクリプト<br>サンプルテクニック集２</h1>
<h2>制作</h2>
<p>STRIKE WORKS</p>
<h2>出演</h2>
<p>あかね</p>
<p>やまと</p>
<p>神</p>
[endhtml]

; [keyframe]～[endkeyframe]
; 上に2500pxスライドさせるキーフレームアニメーションを定義。
[keyframe name="scroll"]
  [frame p="  0%" y="    0"]
  [frame p="100%" y="-1700"]
[endkeyframe]

; [kanim]
; [html]タグで指定していたname属性を用いて、HTML要素をアニメーションさせることが可能です。
[kanim name="wrapper" keyframe="scroll" time="3000" easing="linear"]

; [wait]
; 3秒待ちます。
; このとき、演出をスキップできるボタンを出してあげると親切ですね。
; その際はジャンプ先に[wait_cancel]を設置しましょう。
[wait time="3000"]

; [jump]
; 次のラベルへ。
[jump target="*Part6"]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

; [cm]
; htmlを挿入しているレイヤー（フリーレイヤー）を解放します。
; 解放しないとクリックでゲームが進行できるようになりません。
; グラフィカルリンクなどでジャンプしてきた場合は自動的に解放されるのですが、
; [jump]タグでジャンプしてきた場合は手動での解放が必要です。
[cm]

[free_filter layer="base"]
[free_filter layer="1"]
[layopt layer="message0" visible="true"]

#akane
変数の値を埋め込む。[p]

; [iscript]～[endscript]
; のちのち[emb]タグで用いる用の変数を設定します。
[iscript]
tf.a = '<div style="position: absolute; color: black; font-size: 80px; width: 960px; height: 640px; text-align: center; line-height: 640px;">'
tf.b = 'Hello, Tyrano Script!'
tf.c = '</div>'
[endscript]

[html]
; [emb]×３
; このように、[html]内で変数の値を使うことができます。
[emb exp="tf.a"]
[emb exp="tf.b"]
[emb exp="tf.c"]
[endhtml]

[glink name="end" color="black" text="次へ" x="390" y="370" target="*Part7"]
[s]



;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------

#akane
埋め込んだ内容をジャンプボタン化する。[p]


[html]
<button class="hogehoge" style="cursor: pointer; position: absolute; width: 300px; height: 70px; left: 330px; top: 270px;">次へ</button>
; <script>要素を埋め込むこともできます。
; ここに埋め込まず、[endhtml]の後に[iscript]～[endscript]を設置してそこに書いても同じですが、、、。
<script>
; hogehogeクラスの要素をクリックしたとき
$(".hogehoge").click(function(){
; [jump]タグを発動せよ、その属性値は
TYRANO.kag.ftag.startTag("jump", {
; storage="shiryou/11_html.ks"
storage: "shiryou/11_html.ks",
; target="*Part8"
target: "*Part8"
});
});
</script>
[endhtml]
[s]



;-----------------------------------------------------------
*Part8
;-----------------------------------------------------------

[cm]

#akane
Webページを開く。[p]

; [web]
; Webページを開いてみます。
; [web]タグは、その直前に[l]または[p]を置く必要があります。
[web url="https://docs.google.com/forms/d/e/1FAIpQLSfn4R_92dwcwHkZFuZl0ZFQN2bGq0JJJWf9IbLN65Ot2XaAWw/viewform?usp=sf_link"]




;-----------------------------------------------------------
*Part9
;-----------------------------------------------------------

#akane:default
以上です[p]

[jump storage="select.ks"]