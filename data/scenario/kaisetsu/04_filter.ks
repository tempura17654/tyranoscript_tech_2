
; == 04_filter.ks ==========================================

; フィルター効果の解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:sad
誰かの気配がする……。[p]

; [chara_move]
; キャラクターを動かすタグです。
; ここでは、あかねをleft="70"の位置に動かしています。
[chara_move time="800" wait="false" anim="true" left="70" name="akane" ]

; [chara_show][filter][anim][wa]
; やまとを画面外右端に表示し、真っ黒にするフィルターをかけ、
; animによって画面内に引っ張り出し、その完了をwaで待ちます。
[chara_show  layer="1" name="yamato" left="960" top="10" time="0" face="default"]
[filter      layer="1" name="yamato" brightness="0"]
[anim        layer="1" name="yamato" left="470" time="800"]
[wa]

#？？？
ふっふっふ……。[p]
#akane:doki
だっ、誰！？[p]
#？？？
俺だよ、俺！[p]
#akane
わかんないよ!![p]
#？？？
あっ……[<y]フィルター効果[>]がかかってるからか。[p]

; [backlay]
; レイヤ1の情報をbackレイヤにコピーします。
[backlay layer="1"]

; [filter]
; backレイヤのやまとに色相１２０度回転のフィルター効果をかけます。
; こうすることで、先ほどまでかかっていたフィルター効果は自動的に消えます。
[filter layer="1" page="back" name="yamato" hue="120"]

; [trans][wt]
; レイヤ1をトランジションします。
[trans layer="1" time="700"]
[wt]

#yamato
俺だよ、[<y]やまと[>]だよ。[p]
#akane
ぞっ……ゾンビ!?　やまとみたいになってるけど大丈夫？[p]
#yamato:angry
逆、逆ゥー!![p]
そんなこと言うやつには……

[wait time="800"]

; [filter]
; 効果：グレースケール
[filter layer="1" name="akane" grayscale="100"]

#yamato
こうだ!![p]
#akane
キャー!!　石になっちゃったよー!![p]
#yamato:happy
うはは!　一度そうなったら一生そのままだぞ!![p]

; [filter]
; 効果：階調の反転
[filter layer="1"    invert="100"]
[filter layer="base" invert="100"]

#akane
な……なんだって――!![p]

; [filter]
; 効果：セピア
[filter layer="1"    sepia="100"]
[filter layer="base" sepia="100"]

#yamato
そうしてあかねは、余生を石として過ごしましたとさ。めでたし、めでたし。[p]

; [free_filter]
; すべてのフィルター効果を外します。
; レイヤーにかかっていたものも、オブジェクト個別にかかっていたものも、
; 全部外れます。
[free_filter]

#akane
なんにもめでたくなーい!![p]
#yamato:default
ふふふ……これが[<y]フィルター効果[>]のチカラだ。[p]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#yamato
フィルター効果は、表示した画像や文字、またはレイヤーそのものに、特殊な画像処理を施す。[p]
たとえば明るくする、色をなくす、セピアカラーにする、ぼかしをかける……いっぱいある。[p]
一覧を見てもらったほうが早いだろ。[p]

; [mask]～[mask_off]
; スクリーンマスクしてから、サンプル画像一覧画面を作成するサブルーチンを呼びます。
[mask color="black" time="700" effect="fadeInDown"]
; [filter]
; レイヤー１とベースを暗く＆ぼかして、レイヤー２を強調します。
[filter layer="base" blur="8" brightness="20"]
[filter layer="   1" blur="8" brightness="20"]
; [call]
; サンプル画像一覧画面を作成するサブルーチンを呼びます。
[call target="*Sub_TestFilter"]
; ※余談
; サブルーチン先のコードは見る必要はないです(かなり複雑なことをしているため)。
;  ｢ここで一覧を作成するサブルーチンを呼んでいるんだな｣というところだけ
;  理解していただければ、まったく問題ありません。
[wait time="100"]
[mask_off           time="700"  effect="fadeOutDown"]

#yamato
これが、実際に［filter］タグで設定するときの属性、設定値および結果サンプルだ。[p]
ここには載せていないが、opacity(透明度)も設定できるぞ。[p]
まあ、これについてはあとで個人的に見てくれ。[p]

; [mask]～[mask_off]
; サンプル画像を消します。
[mask color="black" time="700" effect="fadeInDown"]
[free_filter]
[freeimage layer="2"]
[mask_off           time="700" effect="fadeOutDown"]

#akane
効果がいっぱいあるんだね。[p]
#yamato
そうだ！　特に[<y]blur(ぼかし)[>]は使い勝手が良い。……これだけかなり処理が重いんだけどな。[p]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#yamato
ちなみに……知っているか？[p]
ティラノスクリプトには、[<y]話していないキャラを自動的に暗くする機能[>]があるんだが、[p]
実はこれも、内部的にはフィルター効果を使っている。[p]
ちょっとその機能を有効にしてみるか？[p]

; [chara_config]
; 話しているキャラクター以外を自動で暗くする機能を有効化します。
[chara_config talk_focus="brightness"]

#yamato
ほいっ、有効にしてみた。[p]
ここからは、しゃべっているキャラだけが明るくなるぞ。[p]
#akane
……。[p]


;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------

#yamato
さて、これを使った具体的な演出についてだが。[p]

; [filter]
; 効果：ブラー
[filter layer="base" blur="3"]

#yamato
たとえば[<y]背景だけをぼかす[>]ことで、キャラクターを強調することができる。[p]
[<y]主人公がそこに目の焦点を合わせている[>]、という演出だな。[p]
これはカメラ効果と組み合わせれば、より効果的になる。[p]


; [layopt]
; メッセージウィンドウを消します。
[layopt layer="message0" visible="false"]

; [chara_mod][camera]
; あかねの顔を変えながらカメラでズームします。
#akane
[chara_mod name="akane" face="default" time="2000" wait="false"]
[camera time="2000" zoom="2.6" x="-200" y="100"]

; [camera]
; カメラをゆっくり上にあげます。
[camera y="120"  time="3000"]

; [free_filter][reset_camera]
; 効果をいろいろ消します。
[free_filter layer="base"]
[reset_camera]

[cm]
[layopt layer="message0" visible="true"]

#yamato
(こいつ……急に撮影用の顔に……！)[p]
……まあ、こんな感じだな。[p]


;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------

#yamato:default
また、当然だが、画面全体にぼかしをかけることもできる。[p]

; [filter]
; ベースレイヤーとレイヤー１をぼかします。
[filter layer="base" blur="5"]
[filter layer="1"    blur="5"]

#yamato
こんなふうにな。[p]
#akane
こ、こんな効果、使い道ある？[p]
#yamato
さっきと逆で、[<y]主人公の目の焦点が合っていない[>]ことの演出ができる。[p]

; [image]
; マブタっぽい画像を上下ひとつずつレイヤー１に出します。
[image name="mabuta_ue"    layer="1" x="75" y=" 10" width="500" height="400" storage="mabuta_ue.png"]
[image name="mabuta_shita" layer="1" x="75" y=" 10" width="500" height="400" storage="mabuta_shita.png"]

さらに、画像やカメラを活用することで……。[p]

; ★IE, Edge対策
[camera x="0" time="0"]

; [camera][anim]
; カメラでズームした後、マブタを上下に開くようなアニメーショノを適用します。
[camera zoom="3" x="-180" y="120" rotate="-25"]
[anim  name="mabuta_ue"    top="-=100" time="2000"]
[anim  name="mabuta_shita" top="+=100" time="2000"]

#akane
おーい、見えてるーー??[p]

; [free_filter]
; ここでパッとぼかしを外します。視界がクリアに。
[free_filter layer="1"]

#akane
ほっ、見えてるみたいだね。[p]

; [free_filter][free][reset_camera]
; 効果いろいろ消し。
[free_filter layer="base"]
[free layer="1" name="mabuta_ue"    time="1000" wait="false"]
[free layer="1" name="mabuta_shita" time="1000" wait="false"]
[reset_camera wait="false"]

#akane
なんてこともできるのか～。[p]
#yamato:happy
そのとーり！[p]


;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------

#akane
ちなみにこのフィルター効果……[<y]アニメーション[>]はさせられないの？[p]
じょじょに変えていくみたいなやつ。[p]
#yamato:sad
それを試みた成果を報告している有志はいるが、[<y]公式ではサポートしてない[>]な。[p]
time属性みたいなのはない。[p]
#yamato:tohoho
ただし一応……公式でサポートしている範囲でもアニメーションみたいなことはできる。[p]
裏面レイヤーとの連携が必要になってくるが。[p]
実例は資料編のほうに載せておくわ。[p]
#akane:happy
そう？　わかった、ありがとー。[p]


;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------

#akane:doki
ちなみに私、画像編集ソフトが使えるから……。[p]
別にゲーム上でフィルター効果を使わなくても、
そっちで同じことはできるんだけど……。[p]
ゲーム上でフィルター効果を使うメリットって、
なにかあるの？[p]
#yamato
そうだな。[p]
画像編集ソフトであらかじめ効果をかけておいた差分画像を複数用意するのに比べると……。[p]
画像はひとつだけにしておいて、他の差分画像はフィルター効果でまかなったほうが……。[p]
#yamato:happy
まず、[<y]素材の管理が楽[>]になる。[p]
それに、[<y]ゲーム容量が節約できる[>]な。[p]
#yamato:default
Webコンテンツでは、容量を抑えることはわりと重要だ。[p]
#akane:doki
逆に、デメリットは？[p]
#yamato:tohoho
リアルタイムでフィルター効果をかける以上……[<y]処理はわずかに重くなる[>]。[p]
blur以外は気にしなくて良いレベルだと思うが。[p]
あと[<y]フィルターの解除忘れ[>]とかが発生したりな。[p]
どれだけスクリプトに慣れていても、人間って、うっかりするもんだから。[p]
#akane:default
ほうほう。[p]


;-----------------------------------------------------------
*Part8
;-----------------------------------------------------------

#akane
最後に……[<y]レイヤーモードとの明確な違い[>]は？[p]
レイヤーモードでも似たことができるよね？[p]
#yamato:happy
比較的処理が[<y]軽い[>]。それから……。[p]
#yamato:default
画像や文字に[<y]個別に[>]効果を与えられるところは、ひとつ明確な違いだな。[p]
それに、レイヤーモードと違って[<y]動作する環境が多い[>]。[p]
……フィルター効果の説明は、こんなところだ！[p]
#akane:happy
ありがとう！　やまと!![p]

; [chara_config]
; 話しているキャラクター以外を暗くする機能を切ります。
[chara_config talk_focus="none"]

[jump storage="select.ks"]






























;-----------------------------------------------------------
*Sub_TestFilter
;-----------------------------------------------------------

; ここは技術的にかなり複雑なことをしています。
; ふつうにノベルゲームを製作するうえで必要になることはまずない技術ですから、
; 無理して読解に挑むことはありません。
; 特に強い興味をお持ちの方はご覧くださいませ。

[iscript]
tf.i = 0;
tf.w = 100;
tf.h = 60;
[endscript]
;-------------------------------------------------------
*NextLoop
;-------------------------------------------------------
[iscript]
tf.xn = 5;
tf.yn = 8;
tf.x = (tf.i % tf.xn) * (tf.w + 20) + 270;
tf.y = Math.floor(tf.i / tf.xn) * (tf.h + 10) + 40;
tf.name = "colors" + tf.i;
tf.texts1 = [
0,   2,   4,   6,   8,
0,  25,  50,  75, 100,
0,  25,  50,  75, 100,
0,  25,  50,  75, 100,
0,  90, 180, 270, 360,
0,  50, 100, 200, 400,
0,  50, 100, 200, 400,
0,  50, 100, 200, 400
];
tf.texts2 = [
'blur(ぼかし)',
'grayscale(ｸﾞﾚｰｽｹｰﾙ)',
'sepia(ｾﾋﾟｱ)',
'invert(階調の反転)',
'hue(色相)',
'brightness(輝度)',
'contrast(ｺﾝﾄﾗｽﾄ)',
'saturate(彩度)'
];
tf.text1 = "" + tf.texts1[tf.i]
tf.text2 = "" + tf.texts2[tf.i/tf.xn]
tf.row   = (tf.i/tf.xn)|0
[endscript]
[image layer="2" name="&tf.name" x="&tf.x" y="&tf.y" storage="../image/layer_test_a.png" width="&tf.w" height="&tf.h"]
[ptext layer="2" size="20"       x="&tf.x" y="&tf.y+37" text="&tf.text1" edge="0x000000"]
[ptext layer="2" size="20"　     x="&tf.x - 190" y="&tf.y+26" text="&tf.text2" color="0xffffff" cond="(tf.i/tf.xn)%1==0"]
[if    exp="tf.row == 0"][filter layer="2" name="&tf.name" blur       ="&tf.text1"]
[elsif exp="tf.row == 1"][filter layer="2" name="&tf.name" grayscale  ="&tf.text1"]
[elsif exp="tf.row == 2"][filter layer="2" name="&tf.name" sepia      ="&tf.text1"]
[elsif exp="tf.row == 3"][filter layer="2" name="&tf.name" invert     ="&tf.text1"]
[elsif exp="tf.row == 4"][filter layer="2" name="&tf.name" hue        ="&tf.text1"]
[elsif exp="tf.row == 5"][filter layer="2" name="&tf.name" brightness ="&tf.text1"]
[elsif exp="tf.row == 6"][filter layer="2" name="&tf.name" contrast   ="&tf.text1"]
[elsif exp="tf.row == 7"][filter layer="2" name="&tf.name" saturate   ="&tf.text1"]
[endif]
[jump target="*NextLoop" cond="++tf.i < tf.xn * tf.yn"]
[return]