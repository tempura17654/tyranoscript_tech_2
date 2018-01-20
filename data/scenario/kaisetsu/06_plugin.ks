
; == 06_plugin.ks ==========================================

; プラグインの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]

; [keyframe]～[endkeyframe]×２
; キーフレームを定義します。
; これは矢印用。
[keyframe name="left_right"]
  [frame p="  0%" y="  0" rotateZ="-90deg"]
  [frame p=" 50%" y="-10"]
  [frame p="100%" y="  0"]
[endkeyframe]
; こっちはプラグイン紹介Webページのスクリーンショット画像を
; スクロールさせるやつ。
[keyframe name="scsho_up"]
  [frame p="  0%" y="    0"]
  [frame p="100%" y="-2600"]
[endkeyframe]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
ティラノスクリプトは、外部プラグインをとても簡単に組み込むことができるよ！[p]
プラグインを組み込むことで、素の状態ではできなかったことができるようになる……。[p]
#akane:happy
機能を拡張できるってことだね。[p]
#akane:default
プラグインには、たとえばティラノスクリプトで[r][<y]Live2Dモデル[>]を扱えるようにするものがあるわ。[p]
他にも、システム回りのグラフィックをがらっとイメチェンできるプラグインとか。[p]
これらは[<y]公式[>]のプラグインなんだけど……。[p]
#akane:happy
実はプラグインには、[<y]有志が公開してる非公式のプラグインがいっぱいある[>]んだっ!![p]
#akane:default
いろんな人が、いろんなプラグインを公開してるよ。[p]

; [image]
; 公式ページのスクリーンショット画像をレイヤー2に。
[image time="1000"  layer="2" storage="plugin/screenshot_01.png" left="0" top="0" width="960" height="640"]

#akane
そのすべてを網羅!!……とまではいかないけど、公式で把握しているプラグインについては、[p]

; [image][kanim]
; 矢印画像をレイヤー2に出して、キーフレームアニメーションを適用します。
[image name="arrow" layer="2" storage="arrow.png"         left="670" top="230" width="70"]
[kanim name="arrow" keyframe="left_right" count="infinite" time="700"]

#akane
ティラノスクリプト公式ホームページで紹介しているから、チェックしてみてね～。[p]

; [image][kanim]
; 非常に縦長のスクリーンショット画像(プラグイン紹介ページ)をレイヤー2に出し、
; キーフレームアニメーションを適用することで徐々にスクロールしていきます。
[image name="scsho" layer="2" storage="plugin/screenshot_02.png" left="0" top="0" width="960" time="3000" wait="false"]
[kanim name="scsho" keyframe="scsho_up" time="30000"]

#akane:happy
プラグインであなたの悩みが解決するかもっ！[p]

; [freeimage]
; レイヤー2消し。
[freeimage layer="2" time="1000" wait="false"]
[wait                time="1000"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane:default
じゃあ、さっそく使ってみよっか。[p]
本日使うのは～っ、チキチキチキチキ……。[p]

; [chara_move]
; あかねを右に動かします。
; left="+=240"は、「現在の位置を基準にして、右側に240px移動せよ」です。
[chara_move name="akane" left="+=240" anim="true"]

; [image][anim]
; 画像をwidth="0", height="0"の状態で出し、
; 直後に拡大アニメーションを行います。
; そのとき、effect="easeOutElastic"を指定することで、
; びよんびよんとしたアニメーションにしています。
[image name="scsho" time="0" layer="2" storage="plugin/screenshot_03.png" left="420" top="250" width="0" height="0"]
[anim  name="scsho" time="1000" left="-=170" top="-=220" width="340" height="440" effect="easeOutElastic"]

[chara_mod name="akane" face="happy" time="0"]
ジャン!!　こちらのプラグインです!!![p]
システムデザインを一気に変えちゃうプラグインだよっ!![p]
#akane:default
それじゃあいくよ。３、２、１……。[p]
[chara_mod name="akane" face="doki" time="0"]
そいっ!!!

; [mask]～[mask_off]
; 画面をマスクでおおって隠して、隠している間に画面をととのえて、
; ととのえ終わったらおおっていたマスクを外します。
[mask time="1000" color="white"]


; [plugin]
; ここ!!!!　この行でプラグインを読み込んでいます。
; nameに指定しているのはプラグインのフォルダの名前です。
[plugin name="theme_tyrano_02"]

; [position][deffont][resetfont]
; フォントや余白を調整します。
[position marginl="30" marginr="30"]
[deffont edge="0xffffff"]
[resetfont]

;[cm][chara_ptext]そいっ!!!
; 文字設定がいろいろ変わってしまったので、
; 一度テキストの打ち直しを行います。
[cm]
#akane
そいっ!!!

; [free]
; スクショはもういらないので消去します。
[free layer="2" name="scsho" time="0"]

; [clearfix]
; いまのロールボタンはいらないので解放します。
[clearfix]

[mask_off time="1000"]
[p]

#akane:happy
ね？　一気にイメチェンしたでしょー。[p]

; [add_theme_button]
; これは上のプラグインを読み込むことで新たに使えるようになったマクロです。
; ロールボタン一式を追加します。
[add_theme_button]

#akane
さらにロールボタンを追加したり!![p]

;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:default
そしたら、プラグインの導入法を簡単に説明するよ。[p]

; [image][anim]
; 縦横1pxしかない白いドットのPNG画像を表示したあと、
; 横に拡大→縦に拡大の順でアニメーションさせます。
; 最初はeffect="easeInQuart"、
; その次にeffect="easeInQuart"でいい感じです。
[image name="white" layer="1" left="12" top="30" storage="color/white2.png" width="1" height="1"]
[anim  name="white" time="700" width="580" effect="easeInQuart"]
[wait               time="700"]
[anim  name="white" time="700" height="380" effect="easeOutQuart"]
[wait               time="700"]

; [ptext]
; 文字をレイヤー2に出しますが、
; この時点ではメッセージウィンドウに隠れていて見えません。
[ptext name="text,text1" layer="2" text="①ダウンロード"           x="50" y="540" size="48" color="0x000000" edge="0xffffff"]
[ptext name="text,text2" layer="2" text="②フォルダを配置"         x="50" y="540" size="48" color="0x000000" edge="0xffffff"]
[ptext name="text,text3" layer="2" text="③[plugin]タグを記述"     x="50" y="540" size="48" color="0x000000" edge="0xffffff"]

といっても、やることは三つだけ！[p]

; [anim]
; メッセージウィンドウに隠れているptextを1個ずつ引っ張り出します。
[anim  name="text1" top=" 90" time="1000"]

ダウンロードして、[l]

; [anim]
; 同上。
[anim  name="text2" top="190" time="1000"]

#akane:happy
フォルダを配置して、[l][r]

; [anim]
; 同上。
[anim  name="text3" top="290" time="1000"]

#akane:doki
［plugin］タグを記述して読み込む!!　以上!!!![p]

; [anim]
; 豆知識ですが、ptextのcolorをアニメーションさせることもできます。
[anim name="text" color="0xffffff" time="300"]
[wait time="300"]
[freeimage layer="2" time="300"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#akane:default
……もう少し詳しく説明するね。[p]
まず一つ目、プラグインの[<r]ダウンロード[>]。[p]

; [iamge][anim]
; ダンボール画像をぼとんと落とします。
[image name="zip" layer="2" left="75" top="-200" storage="plugin/icon_zip.png" width="150"]
[anim  name="zip" top="120" time="1000" effect="easeOutBounce"]

#akane
どさっと。[p]
プラグインを、配布サイトから自分のパソコンにダウンロードするよ。[p]

; [ptext][anim]
; ptextを出した直後に透明度0→255でフェードイン。
[ptext name="text1" layer="2" x="55" y="290" text="sample.zip" size="40"]
[anim  name="text1" time="   0" opacity="  0"]
[anim  name="text1" time="1200" opacity="255"]

#akane:doki
プラグインの多くは、ZIPなどの、[<r]いったん圧縮された状態[>]で配布されているから、[p]
それを適当な[<r]解凍ソフト[>]でもとに戻す必要があるよ。[p]

; [image][anim]
; 画像を出してアニメーション。
[image name="text2"  layer="2" left="150" top="297" storage="plugin/icon_sample.png"]
[image name="folder" layer="2" left="110" top="160" storage="plugin/icon_folder_2.png" width="80" zindex="10"]
[anim  name="text2"  time="   0" opacity="  0"]
[anim  name="folder" time="   0" opacity="  0"]
[anim  name="text2"  time="1200" left="382" top="297" opacity="255"]
[anim  name="folder" time="1200" left="370" top="140" width="150" opacity="255"]

#akane:default
解凍すると[<r]「init.ks」が含まれるフォルダ[>]が出てきて……このフォルダがプラグイン本体だから、[p]
これをゲームのパッケージに放りこむってわけ。[p]

; [camera]
; 説明シーンの画像は全部レイヤー2に出していますので、
; レイヤー2のカメラを動かすことで画像をスライドさせることができます。
; こういうカメラの使い方もアリですね。
[camera layer="2" x="300" wait="false"]

; [image][ptext][anim]
; 表示→アニメーション。
[image name="folders" layer="2" left="620" top="100" storage="plugin/icon_folder.png" width=" 80"]
[image name="folders" layer="2" left="650" top="175" storage="plugin/icon_folder.png" width=" 70"]
[image name="folders" layer="2" left="680" top="242" storage="plugin/icon_folder.png" width=" 60"]
[ptext name="folders" layer="2" x   ="708" y  ="105" text="data"   size="40"]
[ptext name="folders" layer="2" x   ="727" y  ="180" text="others" size="35"]
[ptext name="folders" layer="2" x   ="748" y  ="245" text="plugin" size="25" color="0xf01070"]
[anim  name="folders" time="0" opacity="0"]
[anim  name="folders" time="1200" opacity="255"]

#akane
放りこむ場所は、data/others/[<r]plugin[>]。[p]

; [anim]
; pluginフォルダに放り込むようなアニメーション。
[anim  name="folder" left="710" top="300" width="50"    time="800" effect="easeInBack"]
[anim  name="text2"  left="714" top="388" width="50"    time="800" effect="easeInBack"]
[anim  name="text2"  left="768" top="308" width="78"    time="400" effect="easeOutQuad"]

#akane:happy
pluginフォルダの中に配置します。[p]
#akane:default
そうしたら適当なシナリオファイル……[<r]first.ks[>]がいいかな。first.ksを開いて、[p]

; タグはいろいろありますがやってること自体は単純です。
[camera x="425" layer="2" y="-100" time="1400" wait="false"]
[free layer="2" name="folders"     time="1400"]
[image name="text5"  time="700" layer="2" wait="false" left="584" top="306" storage="plugin/icon_plugin.png" zindex="0"]
[free  name="folder" time="700" layer="2"]

#akane
[<r]［plugin］[>]タグを記述するの。[p]
name属性にはプラグインのフォルダ名を入れてね。[p]

[camera x="425" layer="2" y="-175"]
[image name="text6"  time="700" layer="2" left="504" top="442" storage="plugin/icon_plugin_2.png"]
[image name="line"   time="100" layer="2" left="788" top="467" width="3" height="3" storage="color/pink.png"]
[anim  name="line"   time="700"  width="157"]
[wait                time="700"]

#akane:happy
このとき、プラグインによってはさらに[<r]他の属性[>]を指定することもできるわ。[p]


;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

#akane:doki
プラグインによって何ができるかは全然違うから[r]……。[p]
同梱されてるであろう説明書をよーく読んでから使ってね。[p]
#akane:happy
私との約束だよっ!![p]
#akane:default
それでは、よいプラグインライフを～!![p]

[layopt layer="message0" visible="false"]

; [set_message_window]
; これは独自マクロです(→macro.ks)。
; メッセージウィンドウをいじくってしまったので元に戻します。
[set_message_window]
[jump storage="select.ks"]