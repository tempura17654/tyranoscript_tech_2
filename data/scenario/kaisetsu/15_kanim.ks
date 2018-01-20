
; == 15_kanim.ks ===========================================

; キーフレームアニメーションの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]


; [macro]～[endmacro]
; 独自マクロ[[kanim]]を定義します。
;［kanim］という文字を見やすく表示するためのマクロ。
; 本文中で用います。
[macro name="[kanim]"]
［[font color="0xffff33" bold="true"]k[resetfont]anim］
[endmacro]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
表示したモノをアニメーションさせる手段は、[r]じつに二つ!!　あるね。[p]
［anim］と[[kanim]]だよ。[p]
#akane:doki
この二つ……似たような名前だけど、どう使い分ければいいの？　と思う人、いるよね。[p]
#akane:default
この章で、その二つの違いを説明してみるよ。[p]
まずこの二つは、そもそもアニメーションの原理が違うの。[p]
［anim］は[<y]jQuery[>]アニメーション、それに対して[[kanim]]は[<y]CSS[>]アニメーション……。[p]
という原理で、それぞれ動いてるわ。[p]
べつにこの名前を覚える必要はないけど、違いは知っておくといいかな。[p]

[chara_move name="akane" left="+=240" anim="true" time="700"]
[filter layer="base" blur="4" brightness="80"]
[wait time="300"]

; [image][ptext]→[trans][wt]
; 裏レイヤーに必要なものを描写してから[trans]を用いて表に出します。
[image page="back" name="white" layer="2" x=" 12" y=" 30" storage="color/white2.png" width="580" height="380"]
[ptext page="back" name="text"  layer="2" x=" 50" y=" 60" size="26" color="0x333333" edge="none" text="[anim]"]
[ptext page="back" name="text"  layer="2" x="460" y=" 60" size="26" color="0x333333" edge="none" text="[kanim]"]
[ptext page="back" name="check" layer="2" x=" 80" y="122" size="26" color="green" edge="none" text="✓" bold="bold"]
[ptext page="back" name="check" layer="2" x=" 80" y="320" size="26" color="black  edge="none" text="×" bold="bold"]
[ptext page="back" name="check" layer="2" x=" 80" y="220" size="26" color="green" edge="none" text="✓" bold="bold"]
[ptext page="back" name="check" layer="2" x="495" y="170" size="26" color="green" edge="none" text="✓" bold="bold"]
[ptext page="back" name="check" layer="2" x="495" y="270" size="26" color="green" edge="none" text="✓" bold="bold"]
[ptext page="back" name="check" layer="2" x="495" y="320" size="26" color="green" edge="none" text="✓" bold="bold"]
[ptext page="back" name="text"  layer="2" x="156" y="120" size="26" color="0x333333" edge="none" width="300" align="center" text="扱いやすさ"]
[ptext page="back" name="text"  layer="2" x="156" y="170" size="26" color="0x333333" edge="none" width="300" align="center" text="動作の滑らかさ"]
[ptext page="back" name="text"  layer="2" x="156" y="220" size="26" color="0x333333" edge="none" width="300" align="center" text="イージングの豊富さ"]
[ptext page="back" name="text"  layer="2" x="156" y="270" size="26" color="0x333333" edge="none" width="300" align="center" text="操作項目の豊富さ"]
[ptext page="back" name="text"  layer="2" x="156" y="320" size="26" color="0x333333" edge="none" width="300" align="center" text="無限ループアニメ"]
[image layer="2" storage="color/gray.png" width="520" top="116" left="40" height="1" page="back"]
[image layer="2" storage="color/gray.png" width="520" top="162" left="40" height="1" page="back"]
[image layer="2" storage="color/gray.png" width="520" top="212" left="40" height="1" page="back"]
[image layer="2" storage="color/gray.png" width="520" top="262" left="40" height="1" page="back"]
[image layer="2" storage="color/gray.png" width="520" top="312" left="40" height="1" page="back"]
[image layer="2" storage="color/gray.png" width="520" top="362" left="40" height="1" page="back"]
[wait time="100"]
[trans   layer="2" time="700" method="fadeInRight"]
[wt]
[wait time="300"]

#akane
いくつかの項目で、どちらに軍配が上がるかを、私なりにチェックしてみたよ。[p]
総合的に見ると、一方がもう一方の上位互換ってことはなくて、それぞれに良さがあるわ。[p]
じゃあ、それぞれの項目を見ていくね。[p]

; [free_filter][freeimage][chara_move]
; フィルター効果消し、レイヤー２解放、キャラ移動でもとに戻す。
[free_filter]
[freeimage layer="2" time="700"]
[freeimage layer="2" page="back"]
[chara_move name="akane" left="-=240" anim="true" time="700"]




;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
まず、[<y]扱いやすさ[>]については、［anim］に軍配が上がるかな。[p]
#akane:sad
[[kanim]]は事前に［keyframe］でキーフレームアニメーションを定義しなきゃいけないけど、[p]
#akane:happy
［anim］はそういうの、ないからね。[p]
ちょいっと動かしたい場合には便利だよ。[p]
#akane:default
それから[<y]画像の位置や大きさがシナリオの進行に合わせてころころ変わる[>]という場合!![p]
この場合も［anim］を推奨します。[p]
たとえば、[<y]右に100px移動[>]するアニメーションを私に[[kanim]]で適用してみるとする。[p]

; [keyframe]～[endkeyframe]
; 右に100px移動するだけのキーフレームを定義します。
; [frame]タグのx属性は、そのオブジェクトがいまいる位置が基準となります。が……。
[keyframe name="to_right_100px"]
  [frame p="  0%" x="  0"]
  [frame p="100%" x="100"]
[endkeyframe]

; [kanim][wa]
; 上のキーフレームアニメをあかねに700ミリ秒で適用し、その完了を待ちます。
[kanim name="akane" keyframe="to_right_100px" time="700"]
[wa]

すーっ。さらに……。[p]
同じアニメーションをもっかい私に[[kanim]]で適用する。すると、[p]

; [kanim][wa]
; もう一度適用してみる。
[kanim name="akane" keyframe="to_right_100px" time="700"]
[wa]

こういう動きになる。[p]

; [stop_kanim]
; キーフレームアニメーションを切ります。
[stop_kanim name="akane"]

#akane:sad
さらに右に100px行ってほしいところだけど……行ってくれないの。[p]
これはHTMLの仕様だからしょーがない……。[p]
#akane:default
このあたりは、［anim］なら解決するよ。[p]

; [anim][wa]
; 今度は[anim]で同じことをしています。
; +=100というように指定することで、いまいる位置を基準に移動量を指定できます。
; (単にleft="100"とすると、これは画面上の左から100pxの位置を目標として
; アニメーションしてしまいます。)
; その完了を[wa]で待ちます。
[anim name="akane" left="+=100" time="700"]
[wa]

１回。[l]

[anim name="akane" left="+=100" time="700"]
[wa]

２回と。想定通りの動きをしてくれるわ。[p]

[anim name="akane" left="-=200" time="700"]

じゃあ、もとに戻るね。[p]
以上、［anim］のほうが扱いやすいぜって話でした。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:default
次に、[<y]動作の滑らかさ[>]について。[p]
これはねえ……[[kanim]]に軍配が上がるよ。[p]
論より証拠!!　やってみよう。[p]

;---------------------------------------------------
*AnimStart
;---------------------------------------------------

#akane
まず、［anim］で動くね。[p]

; [anim]
; [anim]で左、右、左と動きます。
[anim name="akane" left="-=480" time="700"]
[anim name="akane" left="+=960" time="700"]
[anim name="akane" left="-=480" time="700"]
[wa]
[wait time="400"]

#akane
ほい。次は、[[kanim]]で動くよ。[p]

; [keyframe]～[endkeyframe]
; 移動結果は上の[anim]と同じになるのですが、
; その指定の仕方にかなり違いがありますね。
; [frame]のx属性やy属性は、
; いまいる座標を0としたときの目標座標で指定するのですが、
; このへんは慣れないとわかりにくいかもしれませんね。
[keyframe name="left_right_center"]
  [frame p="  0%" x="   0"]
  [frame p=" 33%" x="-480"]
  [frame p=" 66%" x=" 480"]
  [frame p="100%" x="   0"]
[endkeyframe]

; [kanim][wa][stop_kanim]
; キーフレームアニメーションを適用、完了待ち、完了後にアニメーションを切る。
[kanim name="akane" keyframe="left_right_center" time="2100"]
[wa]
[stop_kanim name="akane"]
[wait time="400"]

#akane
どうかな？

; [glink]
; 選択肢を出します。
; たまたまマシンが重かったりすると違いがわかりにくいかもしれないので、
; 何回でも見れるように。
[glink color="black" text="もっかいみせて" x="310" y="200" target="*AnimStart" width="240"]
[glink color="black" text="わかった"       x="310" y="300" target="*AnimEnd"   width="240"]
[s]

;---------------------------------------------------
*AnimEnd
;---------------------------------------------------

#akane:happy
マシンによっては違いがないかもしれないけど、２回目の[[kanim]]のほうが滑らかだと思うの。[p]
#akane:default
大きな・大量の画像を動かす場合は[[kanim]]のほうがいいかもね。[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#akane
そして次に、[<y]イージング[>]について。[p]
そもそもイージングってなんやねん!!って話なんだけど……。[p]
これは[<y]変化のし具合[>]というか、加速減速の具合というか、そういうのを制御する機能のことだよ。[p]

; [filter]
; ベースと１レイヤーをぼかし＋暗くしてレイヤー２を強調。
[filter layer="base" blur="6" brightness="40"]
[filter layer="1"    blur="6" brightness="40"]

; [image]
; 白画像を横に引き伸ばして、ラインを作る。
[image storage="color/white.png" left="147" top=" 70" width="665" height="7" layer="2"]

; [image]
; あかねのSD顔画像を出す。
; name="mini, mini1" に注目してください。
; name属性は、カンマ区切りで指定することで、複数の指定が可能です。
; こうすることによって、[anim name="mini"]でも指定できるし、
; [anim name="mini1"]でも指定できるようになるのです。
; miniはまとめて操作するとき用、mini1は個別に操作するとき用ですね。
[image storage="mini_akane_stop.png" layer="2" left="100" top=" 20" width="100" height="100" name="mini, mini1"]

; [keyframe]～[endkeyframe]
; 右に660px動くだけのキーフレームを定義します。
[keyframe name="right"]
  [frame p="  0%" x="  0"]
  [frame p="100%" x="660"]
[endkeyframe]

#akane
実際に見てみるのが早い。[p]
まず、直線的な動きを見てみるよ。[l]

; [change_image]
; これは独自マクロです(→macro.ks)。
; name属性の[image]オブジェクトのstorageを変更します(時間指定は不可)。
; gif画像にチェンジ。
[change_image name="mini" storage="./data/fgimage/mini_akane_anim.gif"]

; [kanim][wa]
; 右に動かします。
[kanim name="mini1" keyframe="right" time="2500" easing="linear"]
[wa]

; [change_image]
; 動かし終わったら、またstorageを元に戻す。
[change_image name="mini" storage="./data/fgimage/mini_akane_stop.png"]
[wait time="500"]
[cm]

#akane
こうなる。ふつうだ……。[p]

; [image]
; さらに白いラインとあかねの顔画像を追加。
[image storage="color/white.png" left="147" top="170" width="665" height="7" layer="2"]
[image storage="mini_akane_stop.png" layer="2" left="100" top="120" width="100" height="100" name="mini,mini2"]
[image storage="color/white.png" left="147" top="270" width="665" height="7" layer="2"]
[image storage="mini_akane_stop.png" layer="2" left="100" top="220" width="100" height="100" name="mini,mini3"]
[image storage="color/white.png" left="147" top="370" width="665" height="7" layer="2"]
[image storage="mini_akane_stop.png" layer="2" left="100" top="320" width="100" height="100" name="mini,mini4"]
[stop_kanim name="mini"]

#akane
ここに、イージング処理をしたアニメーションの例を付け足すよ。[l]

; [change_image][kanim][wa][change_image]
; 上と同じことをします。
[change_image name="mini" storage="./data/fgimage/mini_akane_anim.gif"]
[kanim name="mini1" keyframe="right" time="2500" easing="linear"]
[kanim name="mini2" keyframe="right" time="2500" easing="ease"]
[kanim name="mini3" keyframe="right" time="2500" easing="ease-in"]
[kanim name="mini4" keyframe="right" time="2500" easing="ease-out"]
[wa]
[change_image name="mini" storage="./data/fgimage/mini_akane_stop.png"]
[cm]

#akane
違うのがわかるでしょ？[p]
始めや終わりが滑らか～になってるの。[p]

[stop_kanim name="mini"]

#akane
もう少し見てみようか。[l]

; [change_image][kanim][wa][change_image]
; 上と同じことをします。が、バネイージングと跳ねイージングは[anim]限定。
[change_image name="mini" storage="./data/fgimage/mini_akane_anim.gif"]
[anim  name="mini3" left="760"       time="2500" effect="easeOutElastic"]
[anim  name="mini4" left="760"       time="2500" effect="easeOutBounce"]
[kanim name="mini1" keyframe="right" time="2500" easing="linear"]
[kanim name="mini2" keyframe="right" time="2500" easing="cubic-bezier(0.68, -0.55, 0.265, 1.55)"]
[wa]
[change_image name="mini" storage="./data/fgimage/mini_akane_stop.png"]
[cm]

#akane
びょんびょんとバネみたいな運動をしたり、球がバウンドするような運動をしたりしてるでしょ？[p]
こういうのもイージング処理の一種なの。[p]

; [free_filter][freeimage]
; レイヤー２の解放とフィルター効果の解除を行います。
[free_filter]
[freeimage layer="2" time="700"]

#akane
イージングの一覧を見てみよっか。[l]

; [image]
; レイヤー２にイージングの一覧画像を出します。
; 大きさは960x1280。画面に収まり切りませんので、
; のちのちレイヤー２のカメラを動かして見せていきます。
[image layer="2" storage="easings.png" left="0" top="0" time="700"]
[cm]

#akane
これはあるWebサイトのキャプチャ画像です。[p]

; [reset_camera]
; 使用前に念のため一度カメラをリセットしておく。
[reset_camera layer="2" time="0"]

; [camera]
; カメラを下に動かします。
; ease_type="linear"に注目してください。
; これは直線的な移動にせよ、という指定ですね。
; 実は[camera]タグのease_type属性と、
; [kanim]タグのeaseing属性は、
; まったく同じものが指定可能です。
[camera layer="2" y="-260" wait="false" ease_type="linear" time="5000"]

#akane
ここに写っているのは、［anim］で使用可能な[r]イージングのグラフとキーワード一覧だよ。[p]
こんなにたくさん選べるんだよー!![p]
ここが[[kanim]]よりも［anim］が勝る点その２というワケ。[p]
でも[[kanim]]だって、なにもイージングが一つも選べないなんてことはないわ。[p]

; [image][anim][anim]
; 黄色い枠を出して強調します。
; フェードイン。
[image layer="2" storage="color/yellow.png" width="960" height="480" top="260" opacity="100" name="cover"]
[anim name="cover" time="  0" opacity="  0"]
[anim name="cover" time="700" opacity="100"]

#akane
上の４段については、[[kanim]]でも使えるよ。[p]
ただし、このキーワードをそのまま使うわけにはいかなくって、[p]
cubic-bezierっていうのを使う必要があるから、ちょっと面倒なんだけどね。[p]

; [free]
; 黄色い枠を消します。
[free name="cover" layer="2" time="700"]

; [camera]
; カメラを動かします。
[camera layer="2" y="-550" time="5000" ease_type="linear" wait="false"]

; [image][anim][anim]
; 黄色い枠の出し直し。
[image layer="2" storage="color/yellow.png" width="960" height="150" top="750" opacity="100" name="cover"]
[anim name="cover" time="  0" opacity="  0"]
[anim name="cover" time="700" opacity="100"]

#akane
そして残念なことに、[[kanim]]では使うことができないイージングが、下１段。[p]
バネみたいなのと、跳ねるボールみたいなのの、２タイプね。[p]
これは［anim］限定のイージング処理です……[r]悲しいよ～。[p]
この２タイプを使いたかったら、［anim］を使おうね。[p]

; [freeimage][reset_camera]
; レイヤーの解放とカメラのリセット。
[freeimage    layer="2" time="1000"]
[reset_camera layer="2" time="   0"]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------



#akane:doki
いやー……長くなってきたね。[p]
あと少しだから、一緒に頑張ろ!![p]
#akane:default
［anim］と[[kanim]]では、[<y]アニメーション可能な項目[>]に違いがあるよ。[p]
まず［anim］が動かせるのは、[<y]x座標、[<y]y座標[>]、[r][<y]幅[>]、[<y]高さ[>]、[<y]透明度[>]、ptextについては[<y]文字色[>]。[p]
対して[[kanim]]が動かせるのは……。[p]
[<y]x座標[>]、[<y]y座標[>]、[<y]x拡大率[>]、[<y]y拡大率[>]、[<y]x傾斜[>]、[r][<y]y傾斜[>]、[<y]x軸回転[>]、[<y]y軸回転[>]、[<y]z軸回転[>]、[<y]透明度[>]!!!![p]
#akane:happy
文字色だけは［anim］が勝ってるけど、他はもう[[kanim]]の圧勝と言っても過言じゃないねっ。[p]
#akane:default
なお、xは水平方向、yは垂直方向、zは前後方向のことです。[p]
実際に[[kanim]]を使った変形を見てみよーう。[l]

; [filter]
; いつもの。
[filter layer="base" blur="6" brightness="20"]
[filter layer="1"    blur="6" brightness="20"]

; [image]
; ノベコレ画像を出します。
[image layer="2" page="fore" name="stl, stl1" storage="nobekore_x2.jpg" width="300" left="015" top="100" zindex="999"]
[image layer="2" page="fore" name="stl, stl2" storage="nobekore_x2.jpg" width="300" left="330" top="100" zindex="999"]
[image layer="2" page="fore" name="stl, stl3" storage="nobekore_x2.jpg" width="300" left="645" top="100" zindex="999"]

; [ptext]
; 文字を出します。
[ptext layer="2" page="fore" name="stl" text="傾斜X/Y"   size="32" x=" 15" y="310" width="300" align="center" shadow="0x000000"]
[ptext layer="2" page="fore" name="stl" text="拡大率X/Y" size="32" x="330" y="310" width="300" align="center" shadow="0x000000"]
[ptext layer="2" page="fore" name="stl" text="回転X/Y/Z" size="32" x="645" y="310" width="300" align="center" shadow="0x000000"]

; [anim]
; ノベコレ画像のフェードイン。
[anim name="stl" time="  0" opacity="  0"]
[anim name="stl" time="700" opacity="255"]

; [keyframe]～[endkeyframe]
; skew(傾斜、ゆがみ)の変形をテストするキーフレームアニメーションです。
[keyframe name="skew_sample"]
  [frame p="&  0/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="&  1/12*100 +'%'" skewX=" 12deg" skewY="  0deg"]
  [frame p="&  2/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="&  3/12*100 +'%'" skewX="-12deg" skewY="  0deg"]
  [frame p="&  4/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="&  5/12*100 +'%'" skewX="  0deg" skewY=" 12deg"]
  [frame p="&  6/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="&  7/12*100 +'%'" skewX="  0deg" skewY="-12deg"]
  [frame p="&  8/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="&  9/12*100 +'%'" skewX=" 12deg" skewY=" 12deg"]
  [frame p="& 10/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
  [frame p="& 11/12*100 +'%'" skewX="-12deg" skewY="-12deg"]
  [frame p="& 12/12*100 +'%'" skewX="  0deg" skewY="  0deg"]
[endkeyframe]

; [keyframe]～[endkeyframe]
; scale(拡大率)の変形をテストするキーフレームアニメーションです。
[keyframe name="scale_sample"]
  [frame p="&  0/16*100 +'%'" scaleX="1.0" scaleY="1.0" scaleZ=" 1"]
  [frame p="&  1/16*100 +'%'" scaleX="0.5"              scaleZ=" 1"]
  [frame p="&  2/16*100 +'%'" scaleX="1.0"              scaleZ=" 1"]
  [frame p="&  3/16*100 +'%'" scaleX="1.5"              scaleZ=" 1"]
  [frame p="&  4/16*100 +'%'" scaleX="1.0"              scaleZ=" 1"]
  [frame p="&  5/16*100 +'%'"              scaleY="0.5" scaleZ=" 1"]
  [frame p="&  6/16*100 +'%'"              scaleY="1.0" scaleZ=" 1"]
  [frame p="&  7/16*100 +'%'"              scaleY="1.5" scaleZ=" 1"]
  [frame p="&  8/16*100 +'%'"              scaleY="1.0" scaleZ=" 1"]
  [frame p="&  9/16*100 +'%'" scaleX="1.5" scaleY="0.5" scaleZ=" 1"]
  [frame p="& 10/16*100 +'%'" scaleX="1.0" scaleY="1.0" scaleZ=" 1"]
  [frame p="& 11/16*100 +'%'" scaleX="0.5" scaleY="1.5" scaleZ=" 1"]
  [frame p="& 12/16*100 +'%'" scaleX="1.0" scaleY="1.0" scaleZ=" 1"]
  [frame p="& 13/16*100 +'%'" scaleX="0.5" scaleY="0.5" scaleZ=" 1"]
  [frame p="& 14/16*100 +'%'" scaleX="1.0" scaleY="1.0" scaleZ=" 1"]
  [frame p="& 15/16*100 +'%'" scaleX="1.5" scaleY="1.5" scaleZ=" 1"]
  [frame p="& 16/16*100 +'%'" scaleX="1.0" scaleY="1.0" scaleZ=" 1"]
[endkeyframe]

; [keyframe]～[endkeyframe]
; rotate(回転)の変形をテストするキーフレームアニメーションです。
[keyframe name="rotate_sample"]
  [frame p="&  0/ 7*100 +'%'" rotateX="   0deg" rotateY="   0deg" rotateZ="   0deg"]
  [frame p="&  1/ 7*100 +'%'" rotateX=" 360deg"                                    ]
  [frame p="&  2/ 7*100 +'%'"                   rotateY=" 360deg"                  ]
  [frame p="&  3/ 7*100 +'%'"                                     rotateZ=" 360deg"]
  [frame p="&  4/ 7*100 +'%'" rotateX=" 720deg" rotateY=" 720deg"                  ]
  [frame p="&  5/ 7*100 +'%'"                   rotateY="1080deg" rotateZ=" 720deg"]
  [frame p="&  6/ 7*100 +'%'" rotateX="1080deg"                   rotateZ="1080deg"]
  [frame p="&  7/ 7*100 +'%'" rotateX="1440deg" rotateY="1440deg" rotateZ="1440deg"]
[endkeyframe]

; [kanim]×３
; 定義したキーフレームアニメーションを適用します。
[kanim name="stl1" keyframe="skew_sample"   time="&500*12" count="infinite" easing="ease-in-out"]
[kanim name="stl2" keyframe="scale_sample"  time="&500*16" count="infinite" easing="ease-in-out"]
[kanim name="stl3" keyframe="rotate_sample" time="&2000*7" count="infinite" easing="ease-in-out"]

; [wait]
; 無限ループアニメーションは[wa]で待つことができません。
[wait time="1400"]

#akane
[cm]
こんな感じだよー!!　面白い～。[l]

; [free_filter][freeimage]
; レイヤーの解放とフィルター効果の削除。
[free_filter]
[freeimage layer="2" time="700"]

#akane:happy
[cm]
[[kanim]]の可能性を感じるねっ。[p]



;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

#akane:default
最後に、[<y]ループ再生[>]ができるか、できないか。[p]
#akane:happy
これは、[[kanim]]だけができるよ。[p]
#akane:doki
［anim］はループ再生に対応してません。[p]
#akane:default
[[kanim]]は再生する回数を自然数……あるいはinfinite（無限）で指定できるの、[p]
また、direction="alternate"を指定することで、[<y]反復移動[>]にもできるから、[p]
それと無限ループを組み合わせると、いろいろできちゃうよっ![p]
じゃあ、見てみるよ。[l]

; このへんはコメントを省略
[filter layer="base" blur="6" brightness="20"]
[filter layer="1"    blur="6" brightness="20"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="065" top="060" name="stl,stl1" zindex="999"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="380" top="060" name="stl,stl2" zindex="999"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="695" top="060" name="stl,stl3" zindex="999"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="065" top="260" name="stl,stl4" zindex="999"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="380" top="260" name="stl,stl5" zindex="999"]
[image     layer="2" page="fore" storage="nobekore_x2.jpg" width="200" left="695" top="260" name="stl,stl6" zindex="999"]
[anim name="stl" time="  0" opacity="  0"]
[anim name="stl" time="700" opacity="255"]

; ※ 画面の並び ※
;
;  ①　　②　　③
;
;　④　　⑤　　⑥

; [keyframe]～[endkeyframe]×６
; ６つのキーフレームアニメーションを定義します。
[keyframe name="loop_sample1"]
  [frame p="  0%" y="  0"]
  [frame p="100%" y="-50"]
[endkeyframe]
[keyframe name="loop_sample2"]
  [frame p="  0%" scale="1.0"]
  [frame p="100%" scale="1.1"]
[endkeyframe]
[keyframe name="loop_sample3"]
  [frame p="  0%" rotateY="  0deg"]
  [frame p="100%" rotateY="360deg"]
[endkeyframe]
[keyframe name="loop_sample4"]
  [frame p="  0%" opacity="1.0"]
  [frame p="100%" opacity="0.5"]
[endkeyframe]
[keyframe name="loop_sample5"]
  [frame p="  0%" skewX=" 4deg" skewY=" 4deg"]
  [frame p="100%" skewX="-4deg" skewY="-4deg"]
[endkeyframe]
[keyframe name="loop_sample6"]
  [frame p="  0%" x="  0" y="-40"]
  [frame p=" 33%" x="-20" y=" 20"]
  [frame p=" 66%" x=" 20" y=" 20"]
  [frame p="100%" x="  0" y="-40"]
[endkeyframe]

; [kanim]×６
[kanim name="stl1" keyframe="loop_sample1" time=" 300" count="infinite" direction="alternate" easing="cubic-bezier(0.215, 0.61, 0.355, 1)"]
[kanim name="stl2" keyframe="loop_sample2" time=" 300" count="infinite" direction="alternate" easing="ease-in-out"]
[kanim name="stl3" keyframe="loop_sample3" time="1200" count="infinite"                       easing="linear"]
[kanim name="stl4" keyframe="loop_sample4" time=" 300" count="infinite" direction="alternate" easing="ease-in-out"]
[kanim name="stl5" keyframe="loop_sample5" time=" 300" count="infinite" direction="alternate" easing="ease-in-out"]
[kanim name="stl6" keyframe="loop_sample6" time="2700" count="infinite"                       easing="linear"]
[wait time="1400"]

#akane
[cm]
ほいっ!![p]
これは全部[[kanim]]で動いてるんだ～。[l]

[free_filter]
[freeimage layer="2" time="700"]

#akane
[cm]
ふふ、どうだったかな。[p]

; [mask]～[mask_off]
; マスクで切り替え
[mask graphic="mask_tombo.png" time="1000" effect="fadeInRightBig"]
#akane:default
[wait time="500"]
[bg storage="umi.jpg" time="0"]
[mask_off time="1000" effect="fadeOutLeftBig"]



;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------

#akane
お疲れ様ー!!　機能の比較は以上です。[p]
最後にひとつ、補足をしておくわ。[p]
複数の［anim］を同時にひとつの画像に適用してアニメを合成したり……。[p]
あるいは複数の[[kanim]]を同時にひとつの画像に適用してアニメを合成したり……。[p]
#akane:sad
といったことは、できないの。[p]
上に動く［anim］と右に動く［anim］を同時に使ってナナメに動かすとかは、無理ってことね。[p]
#akane:default
だけど!![p]
［anim］同士、または[[kanim]]同士の同時適用が無理というだけで、[p]
［anim］＋[[kanim]]の同時適用なら可能だよ。[p]

; [keyframe]～[endkeyframe]
; 花を無限に回転させ続けるためのキーフレームアニメーション。
[keyframe name="flower_rotate"]
  [frame p="100%" rotate="360deg"]
[endkeyframe]

; [keyframe]～[endkeyframe]
; テキストを拡大アニメーションで表示するためのキーフレームアニメーション。
[keyframe name="flower_text"]
  [frame p="  0%" scale="0" opacity="0"]
  [frame p="100%" scale="1" opacity="1"]
[endkeyframe]

; [ptext][kanim]
; [ptext]オブジェクトを出し、その瞬間にキーフレームアニメーションを適用します。
[ptext name="text"   layer="2" x="330" y="300" color="0x333333" text="お疲れ様!!" size="30" align="center" width="300"]
[kanim name="text"   time="300" keyframe="flower_text" easing="ease-out"]

; [image][anim][kanim]
; [image]オブジェクトを出し、その瞬間にアニメーションを適用します。
; [anim]と[kanim]の合わせ技（！）です。
[image name="circle" layer="2" storage="circle_frame.png" left="480" top="320" width="0" height="0" zindex="998"]
[anim  name="circle" time=" 1500" width="300" height="300" left="-=150" top="-=150" effect="easeOutElastic"]
[kanim name="circle" time="30000" keyframe="flower_rotate" count="infinite" easing="linear"]
[wait time="1400"]

#akane
こういう感じでね。[p]
最初のびょんびょんっていう拡大は［anim］じゃないとできないから、［anim］でやって……。[p]
無限ループで回転させ続けるのは[[kanim]]じゃないとできないから、[[kanim]]でやって……。[p]

; [stop_kanim][freeiamge]
; キーフレームアニメーションの停止とレイヤーの解放。
; キーフレームアニメーションはこまめに停止してやると動作が安定します。
[stop_kanim name="text"]
[freeimage layer="2" time="700"]

#akane:happy
共同作業ってことだね。[p]
#akane:default
じゃあ、これで［anim］と[[kanim]]の解説を[r]終わります。[p]
ご清聴、ありがとね！[p]

[layopt layer="message" visible="false"]
[chara_mod name="akane" time="0" face="happy"]

; [keyframe]～[endkeyframe]
; 上がったり下がったりするキーフレームアニメーション。
[keyframe name="down_up"]
  [frame p="  0%" y=" 0"]
  [frame p=" 50%" y="20"]
  [frame p="100%" y=" 0"]
[endkeyframe]

; [kanim][anim]
; ↑をあかねに適用させつつ、[anim]で左に動かします。
[kanim name="akane" time="1000" keyframe="down_up" count="infinite" easing="ease-in-out"]
[anim  name="akane" time="2400" opacity="0" left="-=120"]
[wait time="2000"]



[jump storage="select.ks"]