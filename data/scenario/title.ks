
; == title.ks ==============================================

; あいさつ画面を作成するシナリオファイルです。

; ==========================================================



; [jump]
; もうあいさつを見たなら、さっさと目次画面にジャンプしてしまいます。
; (condはconditionの略で、条件の意。この条件が満たされたときのみ、タグが発動します。
; この場合なら、システム変数 sf.title_moumita の中身が 1 に等しいときのみ、
; タグが実行されます。)
[jump cond=" sf.title_moumita == 1 " storage="select.ks"]



; ----------------------------------------------------------
*Start
; ----------------------------------------------------------




; == キーフレームの定義 ================================

; [keyframe][frame][endkeyframe]
; キーフレーム"walk"定義
[keyframe name="walk"]
  [frame p="  0%" y="0"]
  [frame p="100%" y="8"]
[endkeyframe]

; [keyframe][frame][endkeyframe]
; キーフレーム"jump"定義
[keyframe name="jump"]
  [frame p="  0%" y="  0"]
  [frame p="100%" y="-20"]
[endkeyframe]





; == 背景を表示 ========================================

; [bg]
; 緑色の背景を表示します。
; [bg]タグは通常｢bgimage｣フォルダの中にあるファイルを指定しますが、
; "../fgimage/"のように記述することで、他のフォルダの中にあるファイルも指定できます。
[bg        time="400" storage="../fgimage/color/white2.png"]



; == あかねを表示 ======================================

; [chara_show]
; あかねを表示しますが、この時点ではleft="960"として画面外に出しておきます。
[chara_show  name="akane" time="   0" face="default" left="960" top="60"]

; [anim]
; あかねを完全に透明にしたうえでleft="540"に引っ張り出します。
; この時点では見えていません。
[anim        name="akane" time="   0" opacity="0" left="510"]

; [kanim]
; キーフレームアニメーション"walk"、これは単発ではただ下に沈むだけのアニメーションですが、
; direction="alternate"を指定することで偶数回目は逆方向に、すなわち反復的に動くようになります。
; つまりこのタグによって、沈んで→浮かんで→沈んで→浮かんで、というアニメーションになります。
[kanim       name="akane" time=" 400" easing="ease-in-out" keyframe="walk" count="4" direction="alternate"]

; [anim]
; [kanim]によって浮き沈みのアニメーションがされているのと同時に、
; [anim]によってleft="540"→"490"の横移動アニメーションを行います。
; animとkanimのコンボです。
; 浮き沈み＋横移動によって、あかねが歩いているように見えます。
[anim        name="akane" time="1600" left="460" opacity="255"]

; [wait]
; アニメーションに指定した時間と同じ時間[wait]することで、
; アニメーションの完了を待ちます。
[wait                     time="1600"]





; == メッセージウィンドウを表示 ========================

; [layopt]
; メッセージレイヤ０を表示します。
[layopt layer="message0" visible="true"]

; [set_message_window]
; これは独自マクロです(→macro.ks)。
; メッセージウィンドウをセットします。
[set_message_window]




; == ここまででようやく画面の準備ができた！！ ==========
; == 以下アドベンチャーパート ==========================


; [chara_mod]
; あかねの表情をハッピーにします。
[chara_mod name="akane" face="happy" time="0"]

; [kanim]
; あかねをハッピーにさせたあと[kanim]でぴょんと１回ジャンプします。
; キーフレームアニメーション"jump"は単発だと上に上がるだけのアニメーションですが、
; direction="alternate"を指定することで反復的にアニメーション。
[kanim     name="akane" time="200" keyframe="jump" count="2" direction="alternate"]

; 発言者欄に「？？？」と出します。
; これは、[chara_ptext name="？？？"]を省略した書き方です。
#？？？

こんにちは![wait time="500"]

; [stop_kanim]
; キーフレームアニメーションを止めます。
; キーフレームアニメーションが不要になったら、こまめに[stop_kanim]しておくとよいでしょう。
; (残したままにしておくと、思わぬ動作につながることがあります。)
[stop_kanim name="akane]

[chara_mod name="akane" face="default"]
; 行の先頭の文字を _ にすると、
; メッセージウィンドウに挿入されるテキストの先頭に空白を含めることができます。
; (ふつうはカットされます。試しに _ を削除して結果を確認してみるとよいです。)
_　私は、あかね。[p]
#akane
なんと!![wait time="500"]　ついに満を持して……。[p]

; [image][trans]
; backレイヤーにロゴを出した後、[trans]で引っ張り出します。
; back(背面)レイヤーはfore(前面)レイヤーと対になるレイヤーで、基本的に見えませんが、
; [trans]タグで前面にアニメーション付きで引っ張り出すことができます。
[image layer="1" page="back" storage="logo.png" left="20" top="240"]
[trans layer="1" time="1000" method="zoomInLeft"]

; #akane:happy
; 発言者欄に「あかね」と入れ、顔をハッピーにします。
; これは、[chara_ptext name="akane"][chara_mod name="akane" face="happy"]を省略した書き方です。
#akane:happy
; [<y][>]
; これは独自マクロです(→macro.ks)。
; 囲まれた文章を黄色で表示します。
ノベルゲーム制作エンジン[<y]ティラノスクリプト[>]の

; [kanim]
; あかねを２回ジャンプさせます。
[kanim name="akane" time="100" keyframe="jump" count="4" direction="alternate"]

[<y]テクニックサンプル集２[>]が出たよっ!!![p]

[stop_kanim name="akane"]

最近のティラノスクリプトで[<y]新登場した演出[>]や、[<y]サンプル集１では扱わなかった演出[>]を扱うよー!![p]
ティラノスクリプトに興味あるけどなにができるのかわからないという方、ぜひチェックしてね。[p]
#akane:default
もちろんこのサンプル集もティラノスクリプトでできていて、プロジェクトを公開してるから……[p]
#akane:happy
興味がある方はダウンロードして、なかを読んでみてくださいっ!![p]
#akane:default
シナリオファイルにはコメントが入れてあるから１行１行ゆっくり読めば大丈夫！……[wait time="500"]
#akane:doki
きっとね。[p]
#akane:happy
内容は｢解説編｣と｢資料編｣の２種類があるよ。[p]
#akane:default
｢解説編｣は機能を実演しながら説明するもので、[r]｢資料編｣はコピペ用の資料として編纂したもの。[p]
まずは、｢解説編｣から見て……。[p]
興味を持った機能があれば、その｢資料編｣のスクリプトコードを見てみるといいんじゃないかな。[p]
#akane:doki
｢解説編｣は解説のためのコードでちょっと複雑になってるんだけど……。[p]
｢資料編｣はエッセンスだけ抜き出してあるからね。[p]
#akane:default

長々と説明してごめんね!　目次に移ります。[p]

; [eval]
; あいさつをもう見たということで、
; システム変数 sf.title_moumita に 1 をぶち込みます。
[eval exp=" sf.title_moumita = 1 "]

; [jump]
; 目次画面に移ります。
[jump storage="select.ks"]