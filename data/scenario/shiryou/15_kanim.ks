
; == 15_kanim.ks ===========================================

; [anim][kanim]の資料集。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

[image name="obj1" layer="2" storage="color/black3.png" x="730" y="250" width="100" height="100"]
[ptext name="obj2" layer="2" text="ptext"              x="150" y="250" size="60" color="0x000000"]



;-------------------------------------------------------
*Part1.1
;-------------------------------------------------------

#akane
［anim］でいろいろ操作[l]

; [anim]×10
; obj1(黒い四角形)に対して、アニメーションを10連発します。
; このように連続で記述した場合、同時ではなく、順次にアニメーションが実行されます。
[anim name="obj1" time="700" left="830"]
[anim name="obj1" time="700" top ="350"]
[anim name="obj1" time="700" left="730"]
[anim name="obj1" time="700" top ="250"]
[anim name="obj1" time="700" width ="200"]
[anim name="obj1" time="700" height="200"]
[anim name="obj1" time="700" width ="100"]
[anim name="obj1" time="700" height="100"]
[anim name="obj1" time="700" opacity="  0"]
[anim name="obj1" time="700" opacity="255"]

; [anim]×6
; obj2(ptextという文字)に対して、アニメーションを6連発します。
; テキストに対してはcolor属性が使用可能です。
[anim name="obj2" time="1400" color="0xff0000"]
[anim name="obj2" time="1400" color="0x00ff00"]
[anim name="obj2" time="1400" color="0x0000ff"]
[anim name="obj2" time="1400" color="0xffffff"]
[anim name="obj2" time="700" opacity="  0"]
[anim name="obj2" time="700" opacity="255"]

; [wa]
; アニメーションのすべての完了を待つことができます。
[wa]

; [free]
; 文字はもういらないので解放します。
[free layer="2" name="obj2"]



;-------------------------------------------------------
*Part1.2
;-------------------------------------------------------

[cm]
［anim］でいろいろ操作（相対的）[l]

; [anim]×8
;「+=」や「-=」を頭につけることで、
;「いまの位置からいくら」という、
; 相対的な指定の仕方が可能です。こちらのほうが使いやすいですね。
[anim name="obj1" time="700" left="+=100"]
[anim name="obj1" time="700" top ="+=100"]
[anim name="obj1" time="700" left="-=100"]
[anim name="obj1" time="700" top ="-=100"]
[anim name="obj1" time="700" width ="+=100"]
[anim name="obj1" time="700" height="+=100"]
[anim name="obj1" time="700" width ="-=100"]
[anim name="obj1" time="700" height="-=100"]

[wa]



;-------------------------------------------------------
*Part1.3
;-------------------------------------------------------

[cm]
［kanim］でいろいろ操作[l]

; [keyframe]～[endkeyframe]
; 長いキーフレームアニメーションを定義します。
[keyframe name="kanim_test"]
; [frame]×30
; p属性には通常「0%」「50%」「100%」などのパーセントを指定しますが、
; ここでは変わった指定の仕方をしています。
; まず先頭の「&」ですが、これは
;「のちに続く文字をJavaScriptの計算式として評価せよ」
; という合図です。
; 最初の[frame]で言えば、「 0 / 29 * 100 + '%'」という計算式が実行されるので、
; 結局これは、p属性に「0%」という文字列を指定したのと同じことです。
; じゃあ最初っからそう書けやという話ですが、
; のちのち計算が面倒になっていくので、計算をコンピュータにさせることで、手を抜いているんですね。
  [frame p="&  0 / 29 * 100 + '%' " scaleX="1" scaleY="1" scale="1" skewX="0deg" skewY="0deg" skew="0deg" opacity="1" rotate="0deg" rotateX="0deg" rotateY="0deg" rotateZ="0deg"]
  [frame p="&  1 / 29 * 100 + '%' " x="100"          ]
  [frame p="&  2 / 29 * 100 + '%' "         y="100"  ]
  [frame p="&  3 / 29 * 100 + '%' " x="  0"          ]
  [frame p="&  4 / 29 * 100 + '%' "         y="  0"  ]
  [frame p="&  5 / 29 * 100 + '%' " scaleX="2"           ]
  [frame p="&  6 / 29 * 100 + '%' "            scaleY="2"]
  [frame p="&  7 / 29 * 100 + '%' " scaleX="1"           ]
  [frame p="&  8 / 29 * 100 + '%' "            scaleY="1"]
  [frame p="&  9 / 29 * 100 + '%' " scale="2.0"]
  [frame p="& 10 / 29 * 100 + '%' " scale="0.5"]
  [frame p="& 11 / 29 * 100 + '%' " scale="1.0"]
  [frame p="& 12 / 29 * 100 + '%' " rotate="360deg"]
  [frame p="& 13 / 29 * 100 + '%' " rotateX="360deg"]
  [frame p="& 14 / 29 * 100 + '%' " rotateY="360deg"]
  [frame p="& 15 / 29 * 100 + '%' " rotateZ="360deg"]
  [frame p="& 16 / 29 * 100 + '%' " skew=" 10deg"]
  [frame p="& 17 / 29 * 100 + '%' " skew="-10deg"]
  [frame p="& 18 / 29 * 100 + '%' " skew="  0deg"]
  [frame p="& 19 / 29 * 100 + '%' " skewX=" 10deg"]
  [frame p="& 20 / 29 * 100 + '%' " skewX="-10deg"]
  [frame p="& 21 / 29 * 100 + '%' " skewX="  0deg"]
  [frame p="& 22 / 29 * 100 + '%' " skewY=" 10deg"]
  [frame p="& 23 / 29 * 100 + '%' " skewY="-10deg"]
  [frame p="& 24 / 29 * 100 + '%' " skewY="  0deg"]
  [frame p="& 25 / 29 * 100 + '%' " skewX=" 10deg" skewY=" 10deg"]
  [frame p="& 26 / 29 * 100 + '%' " skewX="-10deg" skewY="-10deg"]
  [frame p="& 27 / 29 * 100 + '%' " skewX="  0deg" skewY="  0deg" opacity="1"]
  [frame p="& 28 / 29 * 100 + '%' " opacity="0"]
  [frame p="& 29 / 29 * 100 + '%' " opacity="1"]
[endkeyframe]

; [kanim]
; 上のキーフレームアニメーションをさっそくobj1に適用してみます。
[kanim name="obj1" time="12500" keyframe="kanim_test"]
[wa]



;-------------------------------------------------------
*Part1.4
;-------------------------------------------------------

[cm]
一部のブラウザでは回転にパースをつけられる[l]

; [keyframe]～[endkeyframe]
; perspective属性をつけることでパースをつけられる。
; IE, Edgeでは未対応です。
; 数値が小さいほど激しいパースがつきます。
[keyframe name="kanim_test2"]
  [frame p="  0%" perspective="100" rotateX="0deg" rotateY="0deg" rotateZ="0deg"]
  [frame p=" 25%" rotateX="360deg"]
  [frame p=" 50%" rotateY="360deg"]
  [frame p=" 75%" rotateZ="360deg"]
  [frame p="100%" rotateX="720deg" rotateY="720deg"]
[endkeyframe]
[kanim name="obj1" time="4000" keyframe="kanim_test2"]
[wait time="4000"]


;-------------------------------------------------------
*Part1.5
;-------------------------------------------------------

[cm]
［kanim］で座標絶対指定[l]

; [keyframe]～[endkeyframe]
; x属性、y属性、z属性については、
; 先頭に * をつけることで、画面上の絶対位置を指定することができます。
; が、ゲーム画面のサイズが縮小あるいは拡大されている場合には
; おかしなことになりますので、
; これは画面サイズが固定の場合限定の機能と思ったほうがよいでしょう。
[keyframe name="kanim_test3"]
  [frame p="  0%" x="*  0" y="*  0"]
  [frame p=" 25%" x="*860" y="*  0"]
  [frame p=" 50%" x="*860" y="*540"]
  [frame p=" 75%" x="*  0" y="*540"]
  [frame p="100%" x="*  0" y="*  0"]
[endkeyframe]
[kanim name="obj1" time="4000" keyframe="kanim_test3"]

[wa]



;-------------------------------------------------------
*Part1.6
;-------------------------------------------------------

[cm]
［kanim］で0%と100%のフレームを省略[l]

; [keyframe]～[endkeyframe]
; 0%と100%のフレームを省略することができます。
; 省略した場合の挙動はちょっと説明しにくいので、
; 実際に見てみるのがよいでしょう。
[keyframe name="kanim_test4"]
;[frame p="  0%" x="   0" y="   0"]
  [frame p=" 50%" x="*430" y="*270"]
;[frame p="100%" x="   0" y="   0"]
[endkeyframe]
[kanim name="obj1" time="1000" keyframe="kanim_test4"]



[wa][wait time="700"][cm][freeimage layer="2"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
［anim］［kanim］は、殆どのオブジェクトを[r]対象にとれる。[p]

; [layopt]
; メッセージウィンドウを非表示にします。
[layopt layer="message0" visible="false"]

; [glink]～[endhtml]
; いろんなオブジェクトをname付きで出していきます。
[glink      name="obj, obj1"                                     text="glink"                     x="  0" y=" 80" target="*Part2.1"]
[button     name="obj, obj2"                                     graphic="button_next.png"        x="  0" y="160" target="*Part2.1"]
[ptext      name="obj, obj3" layer="2"                           text="ptext"                     x="  0" y="250" size="60" color="0x000000"]
[mtext      name="obj, obj4" layer="2" wait="false"              text="mtext"                     x="  0" y="320" size="60" color="0x000000" time="7000"]
[image      name="obj, obj5" layer="2"                           storage="mini_akane_anim.gif"    x="  0" y="400"]
[html       name="obj, obj7"]
<button style="width: 200px; height: 60px;">html</button>
[endhtml]



;-------------------------------------------------------
*Part2.1
;-------------------------------------------------------

; ====== まとめて動かす！

; [anim]
; objというname属性を持つオブジェクトをまとめて右に300px動かします。
[anim name="obj" left="+=300" time="2000"]

; [wa]
; [anim][kanim]タグはアニメーションの完了を待ちません。
; 待ちたい場合は、[wa]を使います。
[wa]



;-------------------------------------------------------
*Part2.2
;-------------------------------------------------------

; ====== 個別に動かす！

; [anim]
; それぞれのname属性のオブジェクトを個別に動かします。
[anim name="obj1"             left="+=400" time="2000"]
[anim name="obj2"             left="-=300" time="2000"]
[anim name="obj3"             left="+=200" time="2000"]
[anim name="obj4"             left="-=100" time="2000"]
[anim name="obj5"             left="+=200" time="2000"]
[anim name="obj7"             left="-=500" time="2000"]
[wa]



;-------------------------------------------------------
*Part2.3
;-------------------------------------------------------

; ===== レイヤー指定で動かす！

; [anim]
; layer="2"を指定することで、レイヤー２にあるオブジェクトをまとめて動かすことができます。
[anim layer="2" opacity="0" time="2000"]
[wa]



;-------------------------------------------------------
*Part2.4
;-------------------------------------------------------

[cm]
[freeimage layer="2"]
[layopt layer="message0" visible="true"]






;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; [keyframe]～[endkeyframe]
; 右に680px動くだけのキーフレームアニメーションです。
[keyframe name="right_680"]
  [frame p="  0%" x="  0"]
  [frame p="100%" x="680"]
[endkeyframe]

; [macro]～[endmacro]
; アニメーション完了町→さらに300ミリ秒待ち→
; 左から100pxの位置に瞬間移動→キーフレームアニメーション切り→メッセージクリア
; をまとめたマクロです。
[macro name="reset"]
[wa]
[wait time="300"]
[anim  name="obj" left="100" time="0"]
[stop_kanim name="obj"]
[cm]
[endmacro]

; [image]
; 画像を3つ出す。
[image name="obj, obj1" layer="2" storage="color/black3.png" width="80" height="80" left="100" top=" 60"]
[image name="obj, obj2" layer="2" storage="color/black3.png" width="80" height="80" left="100" top="200"]
[image name="obj, obj3" layer="2" storage="color/black3.png" width="80" height="80" left="100" top="340"]

#akane
［anim］のイージングいろいろ

[glink color="black" text="見る"     x="310" y="200" target="*Part3.1" width="240"]
[glink color="black" text="スキップ" x="310" y="300" target="*Part4"   width="240"]
[s]



;-------------------------------------------------------
*Part3.1
;-------------------------------------------------------

linear[r]（直線的）[l]

[anim  name="obj1" left="780" time="1400" effect="linear"]

[reset]easeInSine，easeOutSine，easeInOutSine[r]（正弦イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInSine"]
[anim  name="obj2" left="780" time="1400" effect="easeOutSine"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutSine"]

[reset]easeInQuad，easeOutQuad，easeInOutQuad[r]（２乗イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInQuad"]
[anim  name="obj2" left="780" time="1400" effect="easeOutQuad"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutQuad"]

[reset]easeInCubic，easeOutCubic，easeInOutCubic[r]（３乗イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInCubic"]
[anim  name="obj2" left="780" time="1400" effect="easeOutCubic"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutCubic"]

[reset]easeInQuart，easeOutQuart，easeInOutQuart[r]（４乗イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInQuart"]
[anim  name="obj2" left="780" time="1400" effect="easeOutQuart"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutQuart"]

[reset]easeInQuint，easeOutQuint，easeInOutQuint[r]（５乗イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInQuint"]
[anim  name="obj2" left="780" time="1400" effect="easeOutQuint"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutQuint"]

[reset]easeInExpo，easeOutExpo，easeInOutExpo[r]（指数イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInExpo"]
[anim  name="obj2" left="780" time="1400" effect="easeOutExpo"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutExpo"]

[reset]easeInCirc，easeOutCirc，easeInOutCirc[r]（円形イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInCirc"]
[anim  name="obj2" left="780" time="1400" effect="easeOutCirc"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutCirc"]

[reset]easeInBack，easeOutBack，easeInOutBack[r]（戻りイージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInBack"]
[anim  name="obj2" left="780" time="1400" effect="easeOutBack"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutBack"]

[reset]easeInElastic，easeOutElastic，easeInOutElastic（弾性イージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInElastic"]
[anim  name="obj2" left="780" time="1400" effect="easeOutElastic"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutElastic"]

[reset]easeInBounce，easeOutBounce，easeInOutBounce（跳ね返りイージング）[l]

[anim  name="obj1" left="780" time="1400" effect="easeInBounce"]
[anim  name="obj2" left="780" time="1400" effect="easeOutBounce"]
[anim  name="obj3" left="780" time="1400" effect="easeInOutBounce"]

[reset]



;-------------------------------------------------------
*Part3.2
;-------------------------------------------------------

#akane
［kanim］でもイージングいろいろ[p]

linear，ease[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="linear"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="ease"]

[reset]ease-in，ease-out，ease-in-out[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="ease-in"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="ease-out"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="ease-in-out"]

[reset]以下、cubic-bezier関数をを使用して［anim］のイージングを再現[p]
easeInSine，easeOutSine，easeInOutSine[r]（正弦イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.47, 0, 0.745, 0.715)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.39, 0.575, 0.565, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.445, 0.05, 0.55, 0.95)"]

[reset]easeInQuad，easeOutQuad，easeInOutQuad[r]（２乗イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.55, 0.085, 0.68, 0.53)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.25, 0.46, 0.45, 0.94)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.455, 0.03, 0.515, 0.955)"]

[reset]easeInCubic，easeOutCubic，easeInOutCubic[r]（３乗イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.55, 0.055, 0.675, 0.19)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.215, 0.61, 0.355, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.645, 0.045, 0.355, 1)"]

[reset]easeInQuart，easeOutQuart，easeInOutQuart[r]（４乗イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.895, 0.03, 0.685, 0.22)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.165, 0.84, 0.44, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.77, 0, 0.175, 1)"]

[reset]easeInQuint，easeOutQuint，easeInOutQuint[r]（５乗イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.755, 0.05, 0.855, 0.06)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.23, 1, 0.32, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.86, 0, 0.07, 1)"]

[reset]easeInExpo，easeOutExpo，easeInOutExpo[r]（指数イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.95, 0.05, 0.795, 0.035)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.19, 1, 0.22, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(1, 0, 0, 1)"]

[reset]easeInCirc，easeOutCirc，easeInOutCirc[r]（円形イージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.6, 0.04, 0.98, 0.335)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.075, 0.82, 0.165, 1)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.785, 0.135, 0.15, 0.86)"]

[reset]easeInBack，easeOutBack，easeInOutBack[r]（戻りイージング）[l]

[kanim  name="obj1" keyframe="right_680" time="1400" easing="cubic-bezier(0.6, -0.28, 0.735, 0.045)"]
[kanim  name="obj2" keyframe="right_680" time="1400" easing="cubic-bezier(0.175, 0.885, 0.32, 1.275)"]
[kanim  name="obj3" keyframe="right_680" time="1400" easing="cubic-bezier(0.68, -0.55, 0.265, 1.55)"]

[reset]弾性イージングと跳ね返りイージングは不可[p]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------



;-------------------------------------------------------
*Part4.1
;-------------------------------------------------------

#akane
［kanim］は、アニメーションの回数指定再生や無限ループ再生に対応する[p]
1回再生、2回再生、無限再生の例[l]

; [kanim]×3
; count属性に着目してください!
[kanim  name="obj1" keyframe="right_680" time="700" easing="linear" count="1"]
[kanim  name="obj2" keyframe="right_680" time="700" easing="linear" count="2"]
[kanim  name="obj3" keyframe="right_680" time="700" easing="linear" count="infinite"]

[wait time="1400"][l]
[stop_kanim name="obj1"]
[stop_kanim name="obj2"]
[stop_kanim name="obj3"]



;-------------------------------------------------------
*Part4.2
;-------------------------------------------------------

[cm]
［kanim］は反復再生に対応する。その際、イージングも反転する[p]
通常再生、反復再生、反復＋イージング再生の例[l]

; [kanim]×3
; direction属性に着目してください!
[kanim  name="obj1" keyframe="right_680" time="700" easing="linear"   count="infinite"]
[kanim  name="obj2" keyframe="right_680" time="700" easing="linear"   count="infinite" direction="alternate"]
[kanim  name="obj3" keyframe="right_680" time="700" easing="ease-out" count="infinite" direction="alternate"]

[wait time="1400"][l]
[stop_kanim name="obj1"]
[stop_kanim name="obj2"]
[stop_kanim name="obj3"]
[freeimage layer="2"]
[cm]



;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

#akane
無限ループで強調表現いろいろ[l]

; ※ 補足・画像の並び順 ※
;
;     ①  ②  ③  ④
;
;     ⑤  ⑥  ⑦  ⑧
;

; [image]×8+1
; 画像を8+1個出します。
; +1というのは何かというと、
; ⑥の画像の裏にこっそり敷いている画像のことです。
; 画面上では画像は８個しかないように見えますが、
; 実は⑥の下には輝度を高く加工した画像を敷いているのです。
[image name="obj1" layer="2" storage="bikkuri.png"  x="& 215 * 0 + 100" y="& 190 * 0 + 100" width="100" height="100"]
[image name="obj2" layer="2" storage="bikkuri.png"  x="& 215 * 1 + 100" y="& 190 * 0 + 100" width="100" height="100"]
[image name="obj3" layer="2" storage="bikkuri.png"  x="& 215 * 2 + 100" y="& 190 * 0 + 100" width="100" height="100"]
[image name="obj4" layer="2" storage="bikkuri.png"  x="& 215 * 3 + 100" y="& 190 * 0 + 100" width="100" height="100"]
[image name="obj5" layer="2" storage="bikkuri.png"  x="& 215 * 0 + 100" y="& 190 * 1 + 100" width="100" height="100"]
[image name="obj " layer="2" storage="bikkuri2.png" x="& 215 * 1 + 100" y="& 190 * 1 + 100" width="100" height="100"]
[image name="obj6" layer="2" storage="bikkuri.png"  x="& 215 * 1 + 100" y="& 190 * 1 + 100" width="100" height="100"]
[image name="obj7" layer="2" storage="bikkuri.png"  x="& 215 * 2 + 100" y="& 190 * 1 + 100" width="100" height="100"]
[image name="obj8" layer="2" storage="bikkuri.png"  x="& 215 * 3 + 100" y="& 190 * 1 +  75" width="100" height="100"]

;-------------------------------------------------------
*Part5.1
;-------------------------------------------------------
[keyframe name="infinite1"]
  [frame p="  0%" y="  0"]
  [frame p=" 80%" y="  0"]
  [frame p="100%" y="-40"]
[endkeyframe]
[kanim  name="obj1" keyframe="infinite1" time="1400" easing="cubic-bezier(0.215, 0.61, 0.355, 1)" count="infinite" direction="alternate"]

;-------------------------------------------------------
*Part5.2
;-------------------------------------------------------
[keyframe name="infinite2"]
  [frame p="  0%" rotateY="  0deg"]
  [frame p=" 50%" rotateY="  0deg"]
  [frame p="100%" rotateY="360deg"]
[endkeyframe]
[kanim  name="obj2" keyframe="infinite2" time="2800"  count="infinite"]

;-------------------------------------------------------
*Part5.3
;-------------------------------------------------------
[keyframe name="infinite3"]
  [frame p="  0%" scale="1"]
  [frame p=" 80%" scale="1"]
  [frame p=" 90%" scale="1.1"]
  [frame p="100%" scale="1"]
[endkeyframe]
[kanim  name="obj3" keyframe="infinite3" time="1400"  count="infinite"]

;-------------------------------------------------------
*Part5.4
;-------------------------------------------------------
[keyframe name="infinite4"]
  [frame p="  0%" skewX="  0deg" skewY="  0deg"]
  [frame p=" 30%" skewX="  0deg" skewY="  0deg"]
  [frame p=" 40%" skewX="- 8deg" skewY="- 8deg"]
  [frame p=" 50%" skewX="  0deg" skewY="  0deg"]
  [frame p=" 80%" skewX="  0deg" skewY="  0deg"]
  [frame p=" 90%" skewX="  8deg" skewY="  8deg"]
  [frame p="100%" skewX="  0deg" skewY="  0deg"]
[endkeyframe]
[kanim  name="obj4" keyframe="infinite4" time="1400"  count="infinite"]

;-------------------------------------------------------
*Part5.5
;-------------------------------------------------------
[keyframe name="infinite5"]
  [frame p="  0%" y="-30"]
  [frame p="100%" y=" 30"]
[endkeyframe]
[kanim  name="obj5" keyframe="infinite5" time="1400" easing="ease-in-out" count="infinite" direction="alternate"]

;-------------------------------------------------------
*Part5.6
;-------------------------------------------------------
[keyframe name="infinite6"]
  [frame p="  0%" opacity="1"]
  [frame p="100%" opacity="0"]
[endkeyframe]
[kanim  name="obj6" keyframe="infinite6" time="1400" easing="ease-in-out" count="infinite" direction="alternate"]

;-------------------------------------------------------
*Part5.7
;-------------------------------------------------------
[keyframe name="infinite7"]
  [frame p="  0%" scaleX="1.2" scaleY="0.9" y="  8"]
  [frame p="100%" scaleX="0.9" scaleY="1.2" y="- 4"]
[endkeyframe]
[kanim  name="obj7" keyframe="infinite7" time="1400" easing="ease-in-out"  count="infinite" direction="alternate"]

;-------------------------------------------------------
*Part5.8
;-------------------------------------------------------
[keyframe name="infinite8"]
  [frame p="  0%" rotate="360deg" y=" 25"]
  [frame p="100%" rotate="  0deg"        ]
[endkeyframe]
[kanim  name="obj8" keyframe="infinite8" time="1400" easing="ease-in-out"  count="infinite"]

;-------------------------------------------------------
*Part5.9
;-------------------------------------------------------
[wait time="1400"][l]
[freeimage layer="2"]
[cm]



;-----------------------------------------------------------
*Part10
;-----------------------------------------------------------

#akane
以上です[p]

[jump storage="select.ks"]