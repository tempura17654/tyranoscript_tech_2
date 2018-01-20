
; == 09_sleepgame.ks =======================================

; スリープゲームの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]

; [button]
; sleepgame機能を使えるボタンを出します。
; 現時点では x="960" すなわち画面外に追いやっておき、
; 後々アニメーションを用いて画面内に引っ張り出します。
[button name="sleep" fix="true" graphic="button_gear.png" x="960" y="20" role="sleepgame" target="*Sleep_OpenMenu"]



; [eval]
; ゲーム変数f.sleepに0をぶち込んでおきます。
; f.sleepは、この後にあるラベル「*Part1」について、
;
;    ・ほかのシナリオファイルから[sleepgame]を用いて回想シーンとして
;      直接「*Part1」に飛んできたのならば、「1」
;
;    ・ふつうにこのシナリオファイルの先頭に飛んできて
;      順当に「*Part1」にたどり着いたのならば、「0」
;
; を入れるようにしている変数です。
[eval exp=" f.sleep = 0 "]

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------



; [if]～[endif]
; ゲーム変数f.sleepが1の場合、特殊な処理を行います。
; このシナリオファイルの先頭から順当にシナリオが読まれた場合は
; ↑の[eval]によって必ず0が入りますのでここは無視されるわけですが、
; 別のラベルから直接「*Part1」ラベルにジャンプしてきた場合はその限りではありません。
[if exp=" f.sleep == 1 "]

  ; [mask]～[mask_off]
  ; f.sleep が 1 ならば、このラベルは夢の回想シーンとして呼ばれているということで、
  ; 画面の再構築を行います。(飛んでくる前にどんな画面になってるかわからないので。)
  [mask time="400"]

  ; [destroy]
  ; これは独自マクロです(→macro.ks)。
  ; 画面にあるものすべてを破壊します。
  [destroy]

  ; [bg][chara_show][layopt]
  ; 背景、キャラクター、メッセージウィンドウの再現。
  ; 順当にこのシナリオにたどり着いた場合と同様の画面を再現するようにします。
  [bg time="0" storage="room.jpg"]
  [chara_show layer="1" time="0" name="akane" face="default" left="280" top="40"]
  [layopt layer="message0" visible="true"]

  [mask_off]
[endif]



#akane:default
ここでは[<y]［sleepgame］[>]と[<y]［awakegame］[>]機能について説明するよ。[p]
#akane:happy
ちなみにsleepは眠り、awakeは目覚めという意味だね。[p]
機能的にもまさに眠りと目覚めって感じだから、そういうイメージを持っておいて。[p]



; [if]～[endif]
; また分岐。
[if exp=" f.sleep == 1 "]
  ; もしここが夢の回想シーンとして呼ばれているなら、
  ; ここで目覚めてしまいます。
  #
  ……なんてことを言っていたっけ。[p]
  [awakegame]
[endif]



#akane:default
このふたつは、[<y]一時的にまったく別の画面に遷移（せんい）して、戻ってくる[>]……。[p]
という機能を実装するためのタグです。[p]
たとえばコンフィグ画面、ステータス画面、などなど。[p]
そういった画面に一時的に移行することができるよ。[p]
#akane:doki
…………。[p]
もうちょっと詳しく説明するね。[p]
#akane:default
まず、ふつうにゲームが進行しているとします。[p]
あなたはマウスをぽちぽちクリックして、文章を読み進めています。[p]
そこで［sleepgame］が発動すると――[<y]その時点でのゲーム状態が保存[>]されます。[p]
そのうえで、まったく別のラベル……たとえば、コンフィグ画面なんかにジャンプ！[p]
そこから先は、どれだけ画面がめちゃくちゃに[r]なっても大丈夫。[p]
なぜならそこは夢の世界で……［sleepgame］のときのゲーム状態がちゃんととってあるから。[p]
ひとたび［awakegame］を踏めば元通りで、[r]［sleepgame］のときの状態が再現されるよ。[p]
そしたらあなたは、再びシナリオを読んでいく[r]ことができる……。[p]
#akane:doki
……そういう機能です。[p]
#akane:default
ちなみに［sleepgame］のように眠りに入る機能は、［sleepgame］タグだけではなくて……。[p]
#akane:happy
[<y]［button］[>]タグでも使うことができるよ。[p]
#akane:default
というかたぶん、こっちで使うことのほうが多いかな？[p]
具体的には[<y]［button role="sleepgame"］[>]と記述すればいいの。[p]
じゃあ、実際に［sleepgame］機能を利用した[r]ボタンを出してみるよ。[p]

; [anim]
; 画面外のボタンを画面内に引っ張り出します。
[anim   name="sleep" left="20" time="800"]

#akane:happy
それっ！[p]
#akane:default
見えるかな？　左上に出たボタン。[p]
このボタンは[<y]fixボタン[>]だから、シナリオ進行中にいつでも押すことができるわ。[p]
これを押すと［sleepgame］が発動して、オプションウィンドウが表示されるよ。[p]
そしてそれ以降［awakegame］を踏んだ時点で、開く直前に戻ってくるというわけ。[p]
よし、じゃあ、十分に機能を確認できたら目次に戻ってね。[l]

[glink color="black" text="目次に戻る" x="310" y="250" storage="select.ks" width="240"]
[s]











;-----------------------------------------------------------
*Sleep_OpenMenu
;-----------------------------------------------------------



; 左上のメニューを開くラベルです。
; このラベルは[sleepgame]で呼び出されます！
; したがって[awakegame]義務が生じます。



; == 事前準備 ==========================================

; [cm][clearfix][layopt]
; いま表示されている通常ボタン・fixボタン・メッセージウィンドウを全部消します。
; どうせ[awakegame]すればすべて元通りなので、やりたい放題です。
[cm]
[clearfix]
[layopt layer="message" visible="false"]

; [stop_keyconfig]
; キーコンフィグからセーブできないようにします。
[stop_keyconfig]

; == 画像と文字を出す ==================================

; [image][anim]
; [image]によってウィンドウ画像を表示した直後に[anim time="0"]で位置などを調整します。
[image name="window" layer="2" storage="sleepgame/window.png" left="20" top="20"    width="306" height="306"]
[anim  name="window" layer="2" time="0"                             top="+=153" width="306" height="  0"]

; [ptext][anim]
; [ptext]で文字を表示した直後に[anim time="0"]で透明度をゼロにします。
[ptext name="texts"  layer="2" text="環境設定"   x="20" y="&80*0+70" size="38" color="white" edge="0x000000" width="306" align="center"]
[ptext name="texts"  layer="2" text="ステータス" x="20" y="&80*1+70" size="38" color="white" edge="0x000000" width="306" align="center"]
[ptext name="texts"  layer="2" text="閉じる"     x="20" y="&80*2+70" size="38" color="white" edge="0x000000" width="306" align="center"]
[anim  name="texts"  layer="2" opacity="0" time="0"]

; [anim]
; テキストとウィンドウ画像にアニメーション効果を与えます。
[anim name="texts"   layer="2" time="222" opacity="255"]
[anim name="window"  layer="2" time="222" top="-=153" width="306" height="306"]

; == クリッカブルをセット ==============================

; [clickable]
; テキストの上にクリッカブルをかぶせます。
; 上から順に、
;
;    storage="config.ks"   ← コンフィグファイルにジャンプ
;    target="*ShowStatus"  ← ステータス表示ラベルにジャンプ
;    target="*CloseMenu"   ← クローズラベルにジャンプ
;
; です。
[clickable color="white" opacity="0" x="30" y="&80*0+60" width="286" height="70" mouseopacity="50" storage="config.ks" ]
[clickable color="white" opacity="0" x="30" y="&80*1+60" width="286" height="70" mouseopacity="50" target="*ShowStatus"]
[clickable color="white" opacity="0" x="30" y="&80*2+60" width="286" height="70" mouseopacity="50" target="*CloseMenu" ]

; ここで停止します。
[s]



;-----------------------------------------------------------
*CloseMenu
;-----------------------------------------------------------



; メニューを閉じてawakegameするラベルです。



; [free]
; テキストを削除します。
[free name="texts"  layer="2" time="111" wait="false"]

; [anim][free]
; ウィンドウをアニメーションさせつつ削除します。
[anim name="window" layer="2" time="222" top="+=153" width="306" height="  0"]
[free name="window" layer="2" time="222" wait="false"]

; [wait]
; 上記操作の完了を待ちます。
[wait                         time="222"]

; [awakegame]
; ここで[sleepgame]時点に復帰します。
[awakegame]










;-----------------------------------------------------------
*ShowStatus
;-----------------------------------------------------------



; ステータスを表示するラベルです。



; [keyframe]～[endkeyframe]
; キーフレーム定義。
; 上下に拡縮を繰り返すことでキャラクターの呼吸表現を行います。
[keyframe name="breath"]
  [frame p="  0%" y=" 0" scaleY="1.000"]
  [frame p=" 50%" y="-3" scaleY="1.004"]
  [frame p="100%" y=" 0" scaleY="1.000"]
[endkeyframe]

; こちらはskewXで変形を行うことでキャラクターの影を投影したような変形を行います。
[keyframe name="shadow"]
  [frame p="  0%" y=" 0" scaleY="0.500" skewX="-20deg"]
  [frame p=" 50%" y="-2" scaleY="0.505"]
  [frame p="100%" y=" 0" scaleY="0.500"]
[endkeyframe]

; [destroy]
; これは独自マクロです。
; いま画面に表示されているものをすべて破壊します。
[destroy]

; [bg]
; 背景を表示します。
[bg time="0" storage="system_base.png"]

; [jump]
; あかねのステータス表示ラベルにジャンプします。
[jump target="*ShowStatusAkane"]



;-----------------------------------------------------------
*ShowStatusAkane
;-----------------------------------------------------------



; あかねのステータスを表示するラベルです。



; [freeimage]
; レイヤー１に表示していたもの（全身絵・全身絵の影・棒グラフ）を削除します。
[freeimage layer="1"]

; [image][filter][kanim]
; あかねの【全身絵の影】を作ります。
; まずふつうに[image]で全身絵を出したあと、
; [filter]で画像を真っ黒にするフィルター効果をかけます。
; そのあと[kanim]であらかじめ定義しておいた[keyframe]を用いて
; 傾斜をつけて影っぽく見えるようにしています。
[image  name="akane, akane_shadow" layer="1" storage="sleepgame/status_akane_sprite.png" x="229" y="191"]
[filter name="       akane_shadow" layer="1" brightness="0" opacity="30"]
[kanim  name="       akane_shadow" keyframe="shadow" easing="ease-in-out" count="infinite"]

; [image][kanim]
; あかねの【全身絵】を出します。
; 非常にゆっくりと、わずかに縦方向に拡縮を繰り返すことで、
; 呼吸しているっぽい演出をしています。
[image name="akane, akane_body" layer="1" storage="sleepgame/status_akane_sprite.png" x="130" y="50"]
[kanim name="       akane_body" keyframe="breath"  easing="ease-in-out" count="infinite"]

; [ptext]
; キャラクターの名前と簡単な説明を出します。
; text属性内に<br>を入れることで改行が可能です。
[ptext layer="0" name="text1" overwrite="true"             color="0x4B4B4B" size="70" x="430" y="350" text="あかね"]
[ptext layer="0" name="text2" overwrite="true" bold="bold" color="0x4B4B4B" size="30" x="430" y="450" text="どこにでもいる普通の高校生。<br>ノベルゲーム作りが趣味。"]

; [ptext]
; 画力、文章力など【パラメータの項目名】を出します。
; y="&60*0+50"に注目してください。
; 最初の & は、その後の文字列をJavaScriptの式として評価せよという合図です。
; つまり & のあと、すなわち 60*0+50 が式として評価されますので、
; 結局これは 60×0＋50＝50 で 50 ということです。
; じゃあ最初から50って書けよという話ですが、
; こう書いたほうが「どういうルールで配置されているか」がわかりやすいので、
; こういう書き方をしています。
[ptext layer="0"             color="0x4B4B4B" size="28" width="88" align="center" x="430" y="& 60 * 0 + 50" text="画力"]
[ptext layer="0"             color="0x4B4B4B" size="28" width="88" align="center" x="430" y="& 60 * 1 + 50" text="文章力"]
[ptext layer="0"             color="0x4B4B4B" size="28" width="88" align="center" x="430" y="& 60 * 2 + 50" text="発想力"]
[ptext layer="0"             color="0x4B4B4B" size="28" width="88" align="center" x="430" y="& 60 * 3 + 50" text="演出力"]
[ptext layer="0"             color="0x4B4B4B" size="28" width="88" align="center" x="430" y="& 60 * 4 + 50" text="構築力"]

; [image]
;【棒グラフ】を出します。
; 1×1ピクセルの単色PNG画像を使い、
; width属性とheight属性を指定することでそのサイズに引き伸ばしています。
[image name="param,param_1" layer="1" storage="color/col1.png" x="540" y="&60*0+60" width="0" height="20"]
[image name="param,param_2" layer="1" storage="color/col1.png" x="540" y="&60*1+60" width="0" height="20"]
[image name="param,param_3" layer="1" storage="color/col1.png" x="540" y="&60*2+60" width="0" height="20"]
[image name="param,param_4" layer="1" storage="color/col1.png" x="540" y="&60*3+60" width="0" height="20"]
[image name="param,param_5" layer="1" storage="color/col1.png" x="540" y="&60*4+60" width="0" height="20"]

; [anim]
; びよーん。
[anim  name="param_1" time="888" width="150" effect="easeOutElastic"]
[anim  name="param_2" time="888" width="250" effect="easeOutElastic"]
[anim  name="param_3" time="888" width="120" effect="easeOutElastic"]
[anim  name="param_4" time="888" width="180" effect="easeOutElastic"]
[anim  name="param_5" time="888" width="300" effect="easeOutElastic"]

; [kadomaru]
; これは独自マクロです(→macro.ks)。
; name="param"を指定した画像の角を10px削ります。
[kadomaru name="param" radius="10px" layer="1"]

; [jump]
; あかねステータスとやまとステータスの共通処理を行うラベルにジャンプします。
[jump target="*Common"]



;-----------------------------------------------------------
*ShowStatusYamato
;-----------------------------------------------------------



; やまとのステータスを表示するラベルです。
; あかねとまったく同じ処理です。。



[freeimage layer="1"]

[image  name="yamato,yamato_shadow" layer="1" storage="sleepgame/status_yamato_sprite.png" x="239" y="171"]
[filter name="yamato_shadow"        layer="1" brightness="0" opacity="30"]
[kanim  name="yamato_shadow"        keyframe="shadow" easing="ease-in-out" count="infinite"]

[image name="yamato,yamato_body" layer="1" storage="sleepgame/status_yamato_sprite.png" x="130" y="20"]
[kanim name="yamato_body"        keyframe="breath"  easing="ease-in-out" count="infinite"]

[ptext name="text1" overwrite="true" layer="0"             color="0x4B4B4B" size="70" x="430" y="350" text="やまと"]
[ptext name="text2" overwrite="true" layer="0" bold="bold" color="0x4B4B4B" size="30" x="430" y="450" text="コンスタントにクソゲーを発表する<br>クソゲークリエイターとして有名。"]

[ptext layer="0" color="0x4B4B4B" size="28" width="88" align="center" x="430" y="&60*0+50" text="画力"]
[ptext layer="0" color="0x4B4B4B" size="28" width="88" align="center" x="430" y="&60*1+50" text="文章力"]
[ptext layer="0" color="0x4B4B4B" size="28" width="88" align="center" x="430" y="&60*2+50" text="発想力"]
[ptext layer="0" color="0x4B4B4B" size="28" width="88" align="center" x="430" y="&60*3+50" text="演出力"]
[ptext layer="0" color="0x4B4B4B" size="28" width="88" align="center" x="430" y="&60*4+50" text="構築力"]

[image name="param,param_1" layer="1" storage="color/col1.png" x="540" y="&60*0+60" width="0" height="20"]
[image name="param,param_2" layer="1" storage="color/col1.png" x="540" y="&60*1+60" width="0" height="20"]
[image name="param,param_3" layer="1" storage="color/col1.png" x="540" y="&60*2+60" width="0" height="20"]
[image name="param,param_4" layer="1" storage="color/col1.png" x="540" y="&60*3+60" width="0" height="20"]
[image name="param,param_5" layer="1" storage="color/col1.png" x="540" y="&60*4+60" width="0" height="20"]
[anim  name="param_1" time="888" width=" 20" effect="easeOutElastic"]
[anim  name="param_2" time="888" width=" 80" effect="easeOutElastic"]
[anim  name="param_3" time="888" width="330" effect="easeOutElastic"]
[anim  name="param_4" time="888" width="280" effect="easeOutElastic"]
[anim  name="param_5" time="888" width="150" effect="easeOutElastic"]

[kadomaru name="param" radius="10px" layer="1"]

[jump target="*Common"]



;-----------------------------------------------------------
*Common
;-----------------------------------------------------------



; あかねのステータス、やまとのステータス、両方の画面で行うべき共通の処理をここに書きます。



; [button]
; ボタンを3個配置します。
; 上から順に、
;
;    target="*AwakeGame"        → [awakegame]するだけのラベルです。
;    target="*ShowStatusAkane"  → あかねのステータスを表示します。
;    target="*ShowStatusYamato" → やまとのステータスを表示します。
;
; です。
[button target="*AwakeGame"        graphic="config/c_btn_back.png"    x="860" y=" 20" width=" 70" enterimg="config/c_btn_back2.png"]
[button target="*ShowStatusAkane"  graphic="button_status_akane.png"  x="430" y="550" width="200"]
[button target="*ShowStatusYamato" graphic="button_status_yamato.png" x="660" y="550" width="200"]
[s]



;-----------------------------------------------------------
*AwakeGame
;-----------------------------------------------------------



; 目覚めるだけのラベルです。



[awakegame]