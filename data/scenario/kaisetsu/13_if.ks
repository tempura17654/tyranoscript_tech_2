
; == 13_if.ks ==============================================

; 条件分岐の解説。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part0
;-----------------------------------------------------------

; [ignore]～[endignore]
; もしシステム変数 sf.ichinara_chuui_mita の中身が１ならば、
; この間の記述をまるっと無視します。ignore(ｲｸﾞﾉｱ)=無視の意
[ignore exp="sf.ichinara_chuui_mita == 1"]

; ここはシステム変数 sf.ichinara_chuui_mita の中身が１ではない場合……
; ……すなわち ①１以外の中身が入っている。もしくは②そもそも中身がない。
; のどちらかのケースで実行される。

; [iscript]～[endscript]
[iscript]
; sf.ichinara_chuui_mita の中身として１を入れてやります。
; これは"もうここには訪れたぞ"という証です。
; こうすることで、次回以降ここは上の[ignore]が働くわけです。
sf.ichinara_chuui_mita     = 1

; また、f.ichinara_kaisetsu1_mita変数と、
; f.ichinara_kaisetsu2_mita変数にゼロをいれます(初期化処理)。
; この初期化処理をサボると、最初から解説２が見れてしまいます。
sf.ichinara_kaisetsu1_mita = 0
sf.ichinara_kaisetsu2_mita = 0
[endscript]

～注意～[p]
この章では条件分岐の解説を行います。[p]
「解説１」を見ると「解説２」が解放されますので……。[p]
「解説１」を見て目次に戻ったあと、繰り返しこの章を見てみてください。[p]
なお、この注意は一度見るともう現れません。[p]

[endignore]

; [glink]
; 選択肢を出します。
[glink                                        target="*Part1" text="解説１--分岐の基礎--" y="110" color="green" size="24" x="220" width="440"]
[glink cond="sf.ichinara_kaisetsu1_mita == 1" target="*Part2" text="解説２--条件の文法--" y="190" color="green" size="24" x="220" width="440"]
[glink cond="sf.ichinara_kaisetsu2_mita == 1" target="*Part3" text="目次に戻る"           y="290" color="blue"  size="24" x="220" width="440"]
[s]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
ある〈[<y]条件[>]〉を満たしたときだけ、ある〈[<p]処理[>]〉を実行したい。[p]
……という[<y]条件分岐[>]を実装したいと思ったことはある？[p]
たとえば……。[p]

[chara_move name="akane" left="+=240" anim="true" time="700"]

; [image][ptext]→[trans][wt]
; 裏レイヤーに必要なものを描写してから[trans]を用いて表に出します。
[image page="back" name="white" layer="2" x="12" y="30" storage="color/white2.png" width="580" height="380"]

; ※ 余談 ※
; ※ 難しい話なので、このへんはスルーしてよいです。※
; 
; ここでは、[iscript]内で文字列を適当な一時変数に放り込んで、
; あとからそれを[ptext text="&tf.text0"]という形で呼び出しています。
; 最初から直接text属性に書き込まずにわざわざ一時変数を介しているのはなぜか？
; というと、属性値に「空白入りの文字」を指定するため"です。
; 実は属性値に直接書き込んだスペース文字は、ゲーム実働時には無効にされてしまい、
; そのため空白を必要とするhtmlタグを入れようとするとエラーが生じてしまうのです。
;
;      例) <span style="..."></span> → <spanstyle="..."></span> となります、、、。
;
; しかしこのように、[iscript]内で一時変数に放り込む→あとから呼び出す、という形にすると、
; スペース文字を属性値に用いることができます。
[iscript]
; 豆知識 … ptextにはhtmlコードを記述することができます。
tf.text1 = '✓<span style="background: #fff352;">初回起動時</span>だけ<span style="background: pink;">警告</span>を出したい。'
tf.text2 = '✓<span style="background: #fff352;">クリア後</span>だけ<span style="background: pink;">おまけ</span>を出したい。'
tf.text3 = '✓<span style="background: #fff352;">好感度100以上</span>のときだけ<br>　<span style="background: pink;">告白選択肢</span>を出したい。'
[endscript]

[ptext page="back" name="text"  layer="2" x="50" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text1"]
[ptext page="back" name="text"  layer="2" x="50" y="170" size="32" color="0x333333" edge="none" text="&tf.text2"]
[ptext page="back" name="text"  layer="2" x="50" y="250" size="32" color="0x333333" edge="none" text="&tf.text3"]
[trans   layer="2" time="700" method="lightSpeedIn"]
[wt]

#akane
典型例だと、こういうのとか。[p]
#akane:happy
もちろんティラノスクリプトでは[<y]どれも実現可能[>]だよ!![p]
#akane:default
ただ、その記述方法が問題だよね。[p]
ここはだれでもつまづくと思うから……その記述方法を少し解説します。[p]
条件を満たしたときだけ何か処理する……というシナリオの記述方法は、大きく分けて２つ。[p]

; [freeimage][image][ptext]→[trans][wt]
; レイヤーの解放を行った後、上と同じ処理。
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[image page="back" name="white" layer="2" x="12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text"  layer="2" x="50" y=" 90" size="32" color="0x333333" edge="none" text="✓すべてのタグに使える<br>　cond属性を利用する。"]
[ptext page="back" name="text"  layer="2" x="50" y="220" size="32" color="0x333333" edge="none" text="✓[if][elsif][else][ignore]<br>　などのタグを利用する。"]
[trans   layer="2" time="700" method="lightSpeedIn"]
[wt]

#akane:default
cond属性を使うか、［if］系のタグを使うか。[r]どちらかだね。[p]
#akane:happy
まず、cond属性からみてみよう!![p]

; [freeimage][image][ptext]→[trans][wt]
; 上と同じ処理。
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text1 = '[<span style="background: pink;">jump</span> target="*A"]'
tf.text2 = '[<span style="background: pink;">jump</span> target="*A" cond="<span style="background: #fff352;">条件</span>"]'
[endscript]
[image page="back" name="white" layer="2" x="12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text1" layer="2" x="50" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text1"]
[ptext page="back" name="text2" layer="2" x="50" y="220" size="32" color="0x333333" edge="none" text="&tf.text2"]
[trans layer="2" time="700" method="lightSpeedIn"]
[anim  name="text2" time="0" opacity="0" top="+=20"]
[wt]

#akane:default
これは「ラベル*Aに[<p]ジャンプ[>]せよ」というタグ。[p]
これはいいよね。[p]
[anim  name="text2" time="1000" opacity="255" top="-=20"]
#akane:happy
そしてどのタグにも使える属性、cond属性!![p]
#akane:default
condはconditionの略で、条件という意味だよ。[p]
このcond属性をつけるとどうなるかというと、[p]
#akane:happy
「[<y]条件[>]を満たしていたときだけ、ラベル*Aに[<p]ジャンプ[>]せよ」という意味になるわ。[p]
条件が満たされていなければ、このタグはスルーされるというわけ。[p]
#akane:default
条件によってやりたい処理がひとつふたつだけの場合は、cond属性がいいかな。[p]
#akane:doki
次に、［if］を見てみよう。[p]

; [freeimage][image][ptext]→[trans][wt]
; 上と同じ処理。
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text1 = '[<span style="background: pink;">jump</span> target="*A"]'
tf.text2 = '[if exp="<span style="background: #fff352;">条件</span>"]<br>　　[<span style="background: pink;">jump</span> target="*A"]<br>[endif]'
[endscript]
[image page="back" name="white" layer="2" x="12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text1" layer="2" x="50" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text1"]
[ptext page="back" name="text2" layer="2" x="50" y="220" size="32" color="0x333333" edge="none" text="&tf.text2"]
[trans layer="2" time="700" method="lightSpeedIn"]
[anim  name="text2" time="0" opacity="0" top="+=20"]
[wt]

#akane
まず、ふつうのタグがある。[p]
これを［if］で条件分岐させると……。[p]

[anim  name="text2" time="1000" opacity="255" top="-=20"]

#akane:default
こうなるよ。[p]
これも意味合いはさっきと同じ。[p]
条件を満たしていればジャンプせよ、だね。[p]
ただ、こっちの書き方なら、［if］と［endif］の間にいくらでも処理を書いていけるから、[p]
条件を満たしていた時にやりたい処理がいっぱいあるなら、こっちの書き方がおススメだよ～。[p]
[font size="24"]補足：［if］～［endif］の間でジャンプさせると、[<y]スタック[>][font size="24"]がたまっていきます。スタックがたまったままだと、セーブデータの肥大化などの問題が起こります。[p]
[font size="24"]［if］～［endif］の間でジャンプさせるのがいけないというわけではありません。が、ジャンプさせる場合はこまめに[<y]［clearstack］[>][font size="24"]でスタックを掃除しましょう。[>][p]
#akane:doki
［if］には親戚みたいなタグがいくつかあるけどそれについては解説は割愛するね。[p]
タグリファレンスか、このサンプルテクニック集のソースコードを覗いてくださいっ。[p]

; ★★★★★★★★★★★★★★★★★★★★★★★★★★★
; [eval]
; 解説１を見たあかしとして、sf.ichinara_kaisetsu1_mitaに1を放り込む。
[eval exp="sf.ichinara_kaisetsu1_mita = 1"]
; ★★★★★★★★★★★★★★★★★★★★★★★★★★★

[jump storage="select.ks"]
















;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------


#akane:happy
条件による分岐のさせ方は勉強したね！[p]
#akane:default
cond属性か［if］タグ、どちらかを使えばいいんだったね。[p]
その中で[<y]"条件"[>]という単語を使っていたと思うんだけど、この"条件"の書き方がクセモノ!![p]
#akane:doki
ゲームって、プログラムで動いているから……。[p]
プログラム相手に「ゲームを初めて起動したときだけ」なんて言ったって、伝わらないわ。[p]
プログラムに判断できるのは、２個の値が[<y]同じ[>]か[<y]違う[>]か……[<y]大きい[>]か[<y]小さい[>]か……。[p]
それくらいなの。[p]
#akane:happy
でも、それで十分！[p]
その小学生でもできるような単純な判断に、[<y]変数[>]という概念をプラスすれば――[p]
いろんな条件がつけられるわっ!![p]
#akane:doki
あ、変数って概念については、解説サイトで事前知識を入れておいてね。[p]
よく、モノを入れておく箱ってたとえがされてるわ。[p]
#akane:default
さて……。[p]
まず、"大きい"とか"小さい"とかいうのを、スクリプトでどう記述すればいいのかを説明するよ。[p]

[chara_move name="akane" left="+=240" anim="true" time="700"]

; [image][ptext]→[trans][wt]
[iscript]
tf.text0 = 'ＡはＢと<span style="color: #f01070;">同じ</span>か？<br>ＡはＢと<span style="color: #f01070;">違う</span>か？<br>ＡはＢより<span style="color: #f01070;">小さい</span>か？<br>ＡはＢ<span style="color: #f01070;">以下</span>か？<br>ＡはＢより<span style="color: #f01070;">大きい</span>か？<br>ＡはＢ<span style="color: #f01070;">以上</span>か？<br>'
tf.text1 = 'Ａ<br>Ａ<br>Ａ<br>Ａ<br>Ａ<br>Ａ<br>'
tf.text2 = '==<br>!=<br><<br><=<br>><br>>='
tf.text3 = 'Ｂ<br>Ｂ<br>Ｂ<br>Ｂ<br>Ｂ<br>Ｂ<br>'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 50" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text0"]
[ptext page="back" name="text1" layer="2" x="400" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text1"]
[ptext page="back" name="text2" layer="2" x="430" y=" 90" size="32" color="0xf01070" edge="none" text="&tf.text2" align="center" width="80"]
[ptext page="back" name="text3" layer="2" x="510" y=" 90" size="32" color="0x333333" edge="none" text="&tf.text3"]
[image page="back" name="hider" storage="color/white2.png" left="380" top="80" width="180" height="270" layer="2" zindex="1000"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
さあ……これがコンピュータにできる判断。[p]
そして、それをスクリプトで記述するには？[p]

[anim name="hider" time="1000" opacity="0"]
[wa]

#akane
……こう書けばいいの。[p]
記号の使い方に注目してね!!　数学記号とは使い方が全然違うから。[p]
ＡやＢには、変数だったり、数値だったり、文字だったりが入ることになるよ。[p]
たとえば……「好感度が80以上」という条件は、次のように表現できる。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = 'f.koukando >= 80'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 12" y="170" size="50" color="0xf01070" width="580" align="center" edge="none" text="&tf.text0"]
[ptext page="back" name="text1" layer="2" x=" 12" y="250" size="25" color="0x333333" width="580" align="center" edge="none" text="好感度は80以上ですか？"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
いいかな？[p]
あ、これは好感度の数値をf.koukandoという変数に入れてる場合の話だね。[p]
これを使ってシナリオを分岐させるなら、こう。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br>[jump target="*Bad" cond="f.koukando <= 20"]<br>[jump target="*Normal"]<br><br>*Good<br>　...<br><br>*Bad<br>　...<br><br>*Normal<br>　...'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y="30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 36" y="55" size="22" color="0x333333" edge="none" text="&tf.text0"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
これは全部ひとつづきのスクリプトだよ。[p]

; [iscript]～[endscript]
; <span style="background: #fff352;">～</span>でマーカーをつけています。
[iscript]
tf.text0 = '<span style="background: #fff352;">[jump target="*Good" cond="f.koukando >= 80"]</span><br>[jump target="*Bad" cond="f.koukando <= 20"]<br>[jump target="*Normal"]<br><br>*Good<br>　...<br><br>*Bad<br>　...<br><br>*Normal<br>　...'
[endscript]

; [ptext]
; ↑のマーカーを付けた文章でptextの内容を上書きします。
; (overwrite="true"に着目してください。
; これをtrueにしたうえでnameを指定することで、
; そのname属性のptextを上書きすることができるのです。)
[ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
まず１行目を見てみよう。cond属性がついてるよね？[p]
ここで好感度が80以上かどうかをチェック!![p]

; [iscript][ptext]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br>[jump target="*Bad" cond="f.koukando <= 20"]<br>[jump target="*Normal"]<br><br><span style="background: #fff352;">*Good</span><br>　...<br><br>*Bad<br>　...<br><br>*Normal<br>　...'
[endscript][ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
好感度80以上ならここで［jump］タグが発動してグッドルートにジャンプしちゃうよ。[p]

; [iscript][ptext]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br><span style="background: #fff352;">[jump target="*Bad" cond="f.koukando <= 20"]</span><br>[jump target="*Normal"]<br><br>*Good<br>　...<br><br>*Bad<br>　...<br><br>*Normal<br>　...'
[endscript][ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
80以上でなければ、ただ単に下の行に進むわけ。[p]
そしたら次は、20以下かどうかをチェック。[p]

; [iscript][ptext]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br>[jump target="*Bad" cond="f.koukando <= 20"]<br>[jump target="*Normal"]<br><br>*Good<br>　...<br><br><span style="background: #fff352;">*Bad</span><br>　...<br><br>*Normal<br>　...'
[endscript][ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
好感度が20以下ならバッドルートにジャンプ!![p]

; [iscript][ptext]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br>[jump target="*Bad" cond="f.koukando <= 20"]<br><span style="background: #fff352;">[jump target="*Normal"]</span><br><br>*Good<br>　...<br><br>*Bad<br>　...<br><br>*Normal<br>　...'
[endscript][ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
そして、80以上でも20以下でもなければこの行が読まれるから……。[p]

; [iscript][ptext]
[iscript]
tf.text0 = '[jump target="*Good" cond="f.koukando >= 80"]<br>[jump target="*Bad" cond="f.koukando <= 20"]<br>[jump target="*Normal"]<br><br>*Good<br>　...<br><br>*Bad<br>　...<br><br><span style="background: #fff352;">*Normal</span><br>　...'
[endscript][ptext page="fore" layer="2" name="text0" overwrite="true" text="&tf.text0" x="0" y="0"]

#akane
ノーマルルートにジャンプ。[p]
……これがcond属性による分岐だよ。[p]
#akane:doki
複雑だったかな？[p]
いまどこにジャンプしてるんだかわからなくなるかもしれないね。[p]
#akane:happy
こういう分岐の追いかけ方・把握の仕方には、[r]ちょっとしたコツがあるの！[p]
#akane:default
それはね、[<y]自分がコンピュータになりきる[>]こと。[p]
[<y]自分がコンピュータになったつもりで、１行１行スクリプトを読んでいく[>]ことだよ。[p]
ゆっくり、落ち着いて、声に出してもいいから、タグの名前や属性をひとつひとつ見ていくの。[p]
#akane:doki
ちなみにこのスクリプトは、［if］を使って書くこともできるよ。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = '[if exp="f.koukando >= 80"]<br>　　[jump target="*Good"]<br><br>[elsif exp="f.koukando <= 20"]<br>　　[jump target="*Bad"]<br><br>[else]<br>　　[jump target="*Normal"]<br><br>[endif]'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y="30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 36" y="80" size="22" color="0x333333" edge="none" text="&tf.text0"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
［if］を使って書くなら、こんな感じかな。[p]
#akane:default
どっちの書き方をしてもいいんだけど……。[p]
こっちのほうが[<y]「アッ、ここで条件分岐するんだな」[>]って視覚的にすぐわかるから、[p]
慣れないうちはこっちで書いたほうがいいかも。[p]
#akane:doki
これは余談だけど……視覚的なわかりやすさってけっこう重要でね。[p]
「自分が書いたスクリプトなんだから、視覚的なわかりやすさなんてどうでもいいだろ！」[p]
……なんて思ったら大間違い。[p]
一か月前の自分が書いたスクリプトなんて、他人の書いたスクリプトとおんなじなんだから！[p]
#akane:default
あともうひとつ、[<y]クリア後限定でなにか別の処理をする[>]方法を説明しておくね。[p]
たとえば、こういう条件を使えばいいよ。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = 'sf.ichinara_kuriazumi == 1'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 12" y="170" size="40" color="0xf01070" width="580" align="center" edge="none" text="&tf.text0"]
[ptext page="back" name="text1" layer="2" x=" 12" y="250" size="25" color="0x333333" width="580" align="center" edge="none" text="クリア済みですか？"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
sf.ichinara_kuriazumiは、[<y]クリア済みなら１が放り込まれているはずのシステム変数[>]だと思って。[p]
#akane:doki
え？　変数名がおバカっぽいって？[p]
まったくそんなことはないよ！　わかればいいんだもの。[p]
#akane:default
この条件を使って、たとえばこんな記述をする。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = '[button cond="sf.ichinara_kuriazumi == 1"]'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 12" y="200" size="25" color="0xf01070" width="580" align="center" edge="none" text="&tf.text0"]
[ptext page="back" name="text1" layer="2" x=" 12" y="250" size="25" color="0x333333" width="580" align="center" edge="none" text="クリア済みならボタンを表示せよ。"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
こうすれば……この［button］タグはクリア済みじゃないと表示されないよ。[p]
こういう記述をしておいてから……。[p]

; [freeimage][image][ptext]→[trans][wt]
[freeimage layer="2" page="fore" time="700"]
[freeimage layer="2" page="back"]
[iscript]
tf.text0 = '[eval exp="sf.ichinara_kuriazumi = 1"]'
[endscript]
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text0" layer="2" x=" 12" y="190" size="25" color="0xf01070" width="580" align="center" edge="none" text="&tf.text0"]
[ptext page="back" name="text1" layer="2" x=" 12" y="230" size="25" color="0x333333" width="580" align="center" edge="none" text="クリア済みということにせよ。"]
[trans layer="2" time="700" method="flipInX"]
[wt]

#akane
シナリオファイルのゲームクリア部分に、そっとこういう記述を加える。[p]
［eval］タグによって、sf.ichinara_kuriazumi[r]というシステム変数に、１をぶち込むの。[p]
#akane:doki
[<y]イコールが１個[>]なのに注意してね。[p]
[<y]Ａ＝Ｂ[>]は、[<y]ＡにＢをぶち込む[>]って意味だよ。[p]
[<y]Ａ＝＝Ｂ[>]とはまったく別の処理だからね!![p]
#akane:default
プレイヤーがゲームを一度でもクリアすれば、［eval］タグによって変数に１が入るから、[p]
それ以降はさっきの［button］タグが発動するってわけ。[p]

[freeimage layer="2" page="fore" time="700"]
[chara_move name="akane" left="-=240" anim="true" time="700"]

#akane:happy
くう～、疲れましたっ！　これにて解説２は終了です。[p]
#akane:default
あなたもお疲れ様。これで解説編は終わりだよ。[p]
#akane:happy
実例は資料編にあるから、興味があればぜひ見てねっ。[p]
じゃあ、ばいばーい！[p]

; ★★★★★★★★★★★★★★★★★★★★★★★★★★★
; [eval]
; 解説２を見たあかしとして、sf.ichinara_kaisetsu2_mitaに1を放り込む。
[eval exp="sf.ichinara_kaisetsu2_mita = 1"]
; ★★★★★★★★★★★★★★★★★★★★★★★★★★★

[jump storage="select.ks"]















;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

[jump storage="select.ks"]