
; == 16_message.ks =========================================

; メッセージウィンドウ周りのテクニックの解説を行います。

; ==========================================================



; ======================================================

; [macro]～[endmacro]×４
; この章で使う４つのマクロを定義していきます。

; ●[M0]
; 下のメッセージウィンドウを使いますよ、というマクロ。
; [current]タグを用いてmessage0を指定し、
; また[er]タグでそのメッセージウィンドウのメッセージを消去しています。
[macro name="M0"]
  [current layer="message0"]
  [er]
[endmacro]

; ●[M1]
; 上のメッセージウィンドウを使いますよ、というマクロ。
; 上記処理に加えて、
; 文字色の変更も行っています。
[macro name="M1"]
  [current layer="message1"]
  [er]
  [font color="0x99ffcc" shadow="0x000000"]
[endmacro]

; ●[L1]
; 上のメッセージウィンドウに１行の文章を入れますよ、というマクロ。
; 余白の調整用です。
[macro name="L1"]
  [position layer="message1" margint="85" marginr="50"]
[endmacro]

; ●[L2]
; 上のメッセージウィンドウに２行の文章を入れますよ、というマクロ。
; 余白の調整用です。
[macro name="L2"]
  [position layer="message1" margint="62" marginr="50"]
[endmacro]

; ======================================================


; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
ここでは、メッセージウィンドウ回りのテクニックをざっと見ていくよ。[p]
#akane:happy
まずは、メッセージウィンドウの[<y]フェード表現[>]について。[p]
［anim］タグを使えば、メッセージウィンドウをフェードアウトさせることができるわ。[l]
#

; [anim]
; layer="message0"を指定することで、
; メッセージレイヤー０にあるすべての要素にアニメーションを実行することができます。
[anim layer="message0" time="700" opacity="  0"]
[wait time="1000"]
[anim layer="message0" time="700" opacity="255"]
[wait time="1000"]
[cm]

#akane
こんな感じでね。[p]
ウィンドウの背景だけを透かすこともできる。[l]

; [anim]
; name="message_outer"を指定することで、
; メッセージの背景だけにアニメーションを適用することができます。
; (結局のところ、[anim]タグのname属性というのは、HTMLにおけるClassのことなのです。)
[anim name="message_outer" time="700" opacity="  0"]
[wait time="1000"]
[anim name="message_outer" time="700" opacity="255"]
[wait time="1000"]
[cm]

背景を見せたいときなんかは、メッセージウィンドウをフェードアウトさせてあげるといいかも。[p]
#

; 以下は上の技術を使った演出の例。
; ウィンドウ消し→キャラ消しを行ってから背景を切り替えることで、
; 背景全体をしっかりをプレイヤーに見せる。
; その後キャラ→ウィンドウの順で再び出していく。
; ただし、もう少しウェイト時間を絞ったほうがユーザーライクかもしれませんね。
[anim layer="message0" time="700" opacity="  0"]
[wa]
[chara_hide layer="1" name="akane" time="700"]
[wait time="300"]
[bg storage="rouka.jpg" method="fadeInLeft" time="1400"]
[chara_show layer="1" name="akane" time="700" top="40" left="280"]
[anim layer="message0" time="700" opacity="255"]
[wa]

#akane:happy
ね？[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

; [image][keyframe][kanim]
; 矢印画像を出して、キーフレームアニメーションを適用します。
[image name="arrow" layer="2" storage="arrow.png" left="50" top="370" width="70"]
[keyframe name="up_down"]
  [frame p="  0%" y="  0"]
  [frame p=" 50%" y="-10"]
  [frame p="100%" y="  0"]
[endkeyframe]
[kanim name="arrow" keyframe="up_down" count="infinite" time="700"]

#akane:default
それからメッセージウィンドウの名前欄。[p]
#
メッセージウィンドウ素材は、名前欄もセットでデザインされてることが多いと思うけど……。[p]
[<y]文字が入ってないときはその部分を消したい[>]……と思う場合があるかもしれないね。[p]
#akane:happy
それを実現する手法をふたつ、紹介するよ。[p]

; [stop_kanim][free]
; 矢印を消す。
[stop_kanim name="arrow"]
[free name="arrow" layer="2"]



;-------------------------------------------------------
*Part2.1
;-------------------------------------------------------

#akane:default
簡単なほうからいこうか。[p]
まず、〈名前欄のあるウィンドウ素材〉と〈名前欄のないウィンドウ素材〉の２個を使う方法。[p]
この二つを、［position］タグで順次切り替えることで、名前欄を出し入れするってことね。[p]
それを使ってみると、

; [position]
; フレームに用いる画像を変えます。
; message_window.pngと違って、名前欄の部分がありません。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]
#
ほい、[wait time="500"]

; [position]
; 名前欄のある画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window.png"]
#akane
ほい、[wait time="500"]

; [position]
; 名前欄のない画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]
#
ほい、[wait time="500"]

; [position]
; 名前欄のある画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window.png"]
#akane
ほいと。[p]
#akane:happy
この手法を使う場合、ウィンドウの変更処理を、短い名前のマクロで登録しておくといいよ。[p]


;-------------------------------------------------------
*Part2.2
;-------------------------------------------------------

#akane:default
次に、いまの手法を少しコンパクトにしたやり方を紹介しておくね。[p]
こっちの手法では、〈名前欄のないウィンドウ素材〉と〈名前欄の画像素材〉の２個を使うよ。[p]

; [position]
; 名前欄のない画像に変更。
[position layer="message0" top="440" margint="50" marginr="50" frame="message_window_2.png"]
#akane:default
まず、さっきと同じように、名前欄のないウィンドウを読み込む。[p]

; [image]
; このタグを用いて、名前欄の画像を出してあげます。
; layer="message0" zindex="100" がポイント。
[image name="chara_name_image" layer="message0" zindex="100" storage="name_area.png" left="24" top="442" width="121"]

#akane
そして、layer="message0"を指定した［image］タグで、名前欄の画像を出す。[p]
このとき、zindex属性で重なりの順序を調整できるわ。[p]

; [::]
; これは独自マクロです(→macro.ks)。
; 名前欄を空白にするついでに、画像も非表示にします。
[::]
あとは、名前の文字を消すときに、一緒に画像も消すようなマクロを作れば……。[p]

; [:akane:]
; これは独自マクロです(→macro.ks)。
; 名前欄に「あかね」を入れるついでに、名前欄の画像も表示します。
[:akane:]
ね？[p]
[::]
こんなふうに……。[p]
[:akane:]
名前欄の出し入れができるね。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:default
それから……。[p]
ティラノスクリプトでは、メッセージウィンドウを[<y]いくらでも[>]出すことができるよ！[l]

; [position][anim][layopt]
; 神用のメッセージウィンドウを定義・フェードインします。
; いったん不透明度をゼロ→レイヤー設定自体は表示→透明度を255までアニメーション、
; としているところがポイントです。
[position layer="message1" page="fore" left="0" top="170" width="960" height="260" visible="true" frame="message_window_3.png"]
[position layer="message1" page="fore" margint="85" marginl="25" marginr="25"]
[anim     layer="message1" time="  0" opacity="  0"]
[layopt   layer="message1" visible="true" ]
[anim     layer="message1" time="400" opacity="255"]
[wait time="400"]

; [M1][L1]
; このシナリオファイル上部で定義しているマクロ。
; 上のメッセージウィンドウを操作して、1行文章用にセッティングする。
[M1][L1]
〝いくらでも〟じゃと……？[l]

; [L2]
; このシナリオファイル上部で定義しているマクロ。
; 2行文章用にセッティングする。
[M1][L2]
正確には〝メッセージレイヤーと同じ数だけ出すことができる〟じゃな。[l]
[M1][L2]
そのメッセージレイヤーが設定次第でいくつでも出せるんじゃから、結局一緒なんじゃが。[l]
#akane:doki

; [M0]
; このシナリオファイル上部で定義しているマクロ。
; 下のメッセージウィンドウを操作する。
[M0]
な、なになに!!　誰なの!?[l]
[M1][L1]
ふぉっふぉっふぉ。わしは〝神〟じゃよ。[l]
#akane:happy
[M0]
えっ！　うそっ!!　5000兆円ください!!!![l]
[M1][L1]
ごせ…………。[l]
[M1][L2]
亀有公園前派出所の警官でも、もう少し遠慮するじゃろ……。[l]
#akane:doki
[M0]
うっ……そうかも……。[l]
[M1][L1]
そうじゃろ。[l]
[M1][L2]
5000兆円が欲しければ……もっと無欲になることじゃな。[l]
[M0]
それはむずかしいよ～。[l]
[M1][L1]
それじゃあの。[l][er]

; [anim][layopt]
; 神用のメッセージウィンドウをフェードアウト→レイヤー設定自体も非表示。
[anim   layer="message1" time="700" opacity="0"]
[wait time="700"]
[layopt layer="message1" visible="false"]

[M0]
な、なんだったんだ、いまの……。[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#akane:default
最後に、[<y]メッセージウィンドウに顔を出す[>]表現について。[p]
昨今の、画面サイズが非常に大きいゲームの場合[r]……。[p]

; [anim][position][deffont][resetfont]
; このあたりはメっセージウィンドウの余白の変更、
; それに伴うフォント設定の位置調整など。
[anim name="chara_name_area"  left="+=200" time="0"]
[anim name="chara_name_image" left="+=200" time="0"]
[position layer="message0" marginl="220" marginr="30"]
[deffont size="32"][resetfont]

; [chara_show]
; ピックアップ用のキャラクターを出す。
; キャラクターの定義→first.ks。
; すべてのキャラクターの立ち絵をこのname="pickup"の定義に突っ込んでいます。
; width="450"として、実際の立ち絵よりはやや縮小されて表示されるようにしています。
; ※ 注意
; 素材側での工夫も必要です。
; ◎すべての立ち絵の「横幅」を統一する。
; ◎すべての立ち絵の「顔の位置」を統一する。
; この２点が成立していない場合、この手法だとうまくいきません。
[chara_show name="pickup" face="akane/default" left="-80" top="380" layer="message0" zindex="1000" width="450"]

; [macro]～[endmacro]
; キャラクターの表情変更用のマクロ[mod]を定義します。
; これは、通常の立ち絵の表情を変えるついでに、
; ピックアップ用の立ち絵の表情も変えるというものです。
[macro name="mod"]
[chara_mod wait="false"  cross="%cross" name="%name" face="%face"]
; [chara_mod]
; face属性にJavaScript式を用いることで、ちょっとした工夫をしています。
[chara_mod name="pickup" cross="%cross" face="& mp.name + '/' + mp.face" wait="%wait"]
[endmacro]

; [mod]
; さっそく上で定義したマクロを使っていきます。
[mod name="akane" face="happy"]
プレイヤーの視線移動の負担を減らすために、[r]メッセージレイヤーに顔を出すことがあるね。[p]

[mod name="akane" face="angry"]
こんな感じで、[wait time="700"]

[mod name="akane" face="sad"]
立ち絵の顔のあたりが、[wait time="700"]

[mod name="akane" face="doki"]
そのまんま出てくるやつ。[p]

[mod name="akane" face="default"]
こういうのは、スクリプト側と素材側、両方でちょっとした工夫をすれば、できるよ。[p]

[mod name="akane" face="happy"]
変更するときも、マクロひとつで簡単！[p]

[chara_move name="akane" left="70" anim="true" time="700"]
[chara_show name="yamato" left="470" top="10"]

[:yamato:][mod name="yamato" face="happy"]
キャラクターが増えても大丈夫だ!![p]
[:akane:][mod name="akane" face="doki"]
わっ!!　驚かさないでー!!![p]
[:yamato:][mod name="yamato" face="default"]
はは、すまんすまん。[p]
けど、キャラクター関連の機能をチェックするときには、最低二人は必要かと思ってな。[p]
[:akane:][mod name="akane" face="angry"]
それはそうだけど……。[p]
[:yamato:][mod name="yamato" face="default"]
ティラノスクリプトは[<y]マクロ[>]を駆使すれば、[r]いろんな表現ができる。[p]
いろんな表現ができるし、
[:yamato:][mod name="yamato" face="happy"]
何よりスクリプトの記述が圧倒的に楽になる。[p]
[:yamato:][mod name="yamato" face="default"]
記述が楽になれば、他の、よりクリエイティブな部分に時間を割ける。[p]
[:yamato:][mod name="yamato" face="happy"]
俺はマクロの積極的な活用をオススメするぞ!![p]
[:akane:][mod name="akane" face="default"]
以上、メッセージウィンドウ関連のテクニックでした。[p]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

; [chara_hide]
; キャラ消し。
[chara_hide layer="message0" name="pickup" time="0"]
[free layer="message0" name="chara_name_image"]
; [set_message_window]
; これは独自マクロです(→macro.ks)。
; メッセージウィンドウをいじくってしまったので元に戻します。
[set_message_window]
[jump storage="select.ks"]