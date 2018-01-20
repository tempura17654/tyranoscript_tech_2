
; == 19_voconfig.ks ========================================

; ボイスを連番ファイルで扱うタグに関する解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:default
V450までのティラノスクリプトで、ボイス付きのゲームを作る場合……。[p]
その都度「効果音の再生タグ」を記述する必要があったんだけど……。[p]
#akane:happy
V450から、キャラクターのボイスを[<y]連番ファイル[>]で管理できるタグが登場したよ!![p]
［voconfig］［vostart］［vostop］の３つ。[p]
#akane:default
これを使うと、[<y]［chara_ptext］に連動して自動でボイスを再生[>]してくれる上に、[p]
オートモード時にボイスの再生完了を待つようになるの。[p]
じゃあ、さっそく使ってみよう![p]
#akane:doki
あ!　私はしゃべらないけどねっ!![p]
#akane:default
あと、音量には注意してね。[p]

; [keyframe]～[endkeyframe]
; ラジカセの画像をみょーんとさせるキーフレームを定義します。
[keyframe name="pop"]
  ; [frame]×３
  ; 縦拡大率増加＋若干上に移動。
  [frame p="  0%" scaleY="1.0" y="  0"]
  [frame p=" 50%" scaleY="1.1" y="-10"]
  [frame p="100%" scaleY="1.0" y="  0"]
[endkeyframe]

; [macro]～[endmacro]
; 上記キーフレームアニメーションをラジカセの画像に適用するだけの
; マクロを定義しておきます。
[macro name="!"]
  ; [stop_kanim][kanim]
  ; アニメーションを切ってから適用しなおす。
  [stop_kanim name="cassette"]
  [kanim name="cassette" keyframe="pop" time="400"]
[endmacro]


; [chara_move]
; あかねを動かします。
[chara_move name="akane" left="+=280" time="700" anim="true"]

; [image][kadomaru][trans][wt]
; ラジカセの画像をbackレイヤーに描画して、[trans]で引っ張り出し、
; その完了を[wt]で待ちます。
; なお、[kadomaru]は独自マクロです(→macro.ks)。
; name要素の角を削ります。
[image    name="cassette" storage="cassette.gif" layer="2" x="370" y="190" time="0" page="back"]
[kadomaru name="cassette" radius="50%" layer="2" page="back"]
[trans layer="2" time="700" method="fadeInUp"]
[wt]

; [seopt]
; ボリュームを10（0～100のうちの）に設定します。
; あまり大きいとびっくりしてしまうので、、、。
[seopt volume="10"]


; ==== ここが連番ファイルを扱えるようにしている部分 ====


; [voconfig]×２
; #ねこ、#カラス、に反応して音声の連番ファイルを再生する〈設定〉を行います。
; この時点では〈設定〉だけです。
[voconfig sebuf="0" name="ねこ"   vostorage="cat_{number}.ogg"  number="1"]
[voconfig sebuf="0" name="カラス" vostorage="crow_{number}.ogg" number="9"]

; [vostart]
; 上記の〈設定〉をもとに、連番ファイルの再生を開始します。
[vostart]

#ねこ
[!](cat_1.ogg)[p]

#akane
これは猫の鳴き声だー![p]

#カラス
[!](crow_9.ogg)[p]

#akane
こっちはカラスだ![p]
順次再生していくね。[p]

#ねこ
[!](cat_2.ogg)[p]

#ねこ
[!](cat_3.ogg)[p]

#カラス
[!](crow_10.ogg)[p]

#カラス
[!](crow_11.ogg)[p]

#ねこ
[!](cat_4.ogg)[p]

#ねこ
[!](cat_5.ogg)[p]

; [vostop]
; 連番ファイルの再生を停止します。
[vostop]

; [freeimage][chara_move]
; ラジカセ画像を消し、あかねを中央に戻します。
[freeimage layer="2" time="700"]
[chara_move name="akane" left="-=280" time="700" anim="true"]

#akane
実際のスクリプトと照らし合わせて見ないと、[r]なにがすごいのか伝わらないと思うけど、[p]
見てみたら、わかると思う。「これで勝手に再生してくれるんだ！」ってね。[p]
#akane:happy
ボイス付きのゲームを作るときには、この機能の活用を検討してみてくださいっ!![p]



[jump storage="select.ks"]