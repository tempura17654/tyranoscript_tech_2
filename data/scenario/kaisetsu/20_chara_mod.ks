
; == 20_chara_mod.ks =======================================

; キャラクターの立ち絵切り替え時に
; 背景がチラっと透ける問題に対する解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane:sad
立ち絵の表情を切り替えるときに、[<y]一瞬、背景が透ける[>]のが気になっている人……いるかな？[p]

; [layopt][chara_mod][layopt]
; メッセージウィンドウを非表示→一通り表情を切り替え→再表示します。
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="happy"  ] [wait time="100"]
[chara_mod name="akane" face="doki"   ] [wait time="100"]
[chara_mod name="akane" face="default"] [wait time="100"]
[layopt layer="message0" visible="true"]

#akane
ふむ。[p]
これは、[<y]クロスフェード[>]という技術――[p]
元の表情をフェードアウトさせつつ、新しい表情をフェードインさせる技術――[p]
を、使っていることに原因があるわ。[p]
そこで、ティラノスクリプトV450以降では、そのクロスフェード機能を切ることができるの。[p]
すると、[wait time="500"][cm]

; [layopt][chara_mod][layopt]
; 同上。ただしcross属性にfalseを指定します。
; クロスフェードすんなという意味です。
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="sad"     cross="false"] [wait time="100"]
[chara_mod name="akane" face="doki"    cross="false"] [wait time="100"]
[chara_mod name="akane" face="default" cross="false"] [wait time="100"]
[layopt layer="message0" visible="true"]

#akane
こんな風に、背景が透けずに済むわ。[p]
しかし、これだと……。[p]

; [layopt][chara_mod][layopt]
; 同上。
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="angry"   cross="false"] [wait time="100"]
[chara_mod name="akane" face="sad"     cross="false"] [wait time="100"]
[chara_mod name="akane" face="happy"   cross="false"] [wait time="100"]
[chara_mod name="akane" face="default" cross="false"] [wait time="100"]
[layopt layer="message0" visible="true"]

#akane
変更する表情に[<y]全体像の違い[>]がある場合、こんなふうになるの。[p]
#akane:doki
どうかな……？[p]
気になる？[p]
気になるなら、クロスフェード機能を使わざるを得ないね……。[p]
でもそれだと背景が透ける……。[p]
どうにかならんか!![p]
#akane:happy
そこでひとつ、テクニカルな手法を紹介するよ。[p]
#akane:default
クロスフェードと非クロスフェードの折衷案……みたいな手法があるの。[p]
素材側での工夫が必要なのと、スクリプトの記述がちょっと複雑になるって欠点はあるけど。[p]
これを使えば、全体像に違いがある場合でも、[r]比較的……違和感なく切り替えができるよ。[p]

; [image]
; あかねとまったく同じ位置に、ある加工を施したあかねの画像を出します。
; →「いずれの表情においても色が乗っている領域」であかねのデフォルトの立ち絵をくり抜いた画像。
[image storage="chara/akane/_base.png" name="back" layer="1" time="0" left="280" top="40" zindex="-1"]

; [layopt][chara_mod][layopt]
; 同上。
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="happy"  ] [wait time="100"]
[chara_mod name="akane" face="doki"   ] [wait time="100"]
[chara_mod name="akane" face="angry"  ] [wait time="100"]
[chara_mod name="akane" face="sad"    ] [wait time="100"]
[chara_mod name="akane" face="default" cross="false"]
[layopt layer="message0" visible="true"]

あくまで比較的、だけどね。[p]
これはどういうことをしているかというと、[wait time="500"]

; [anim][wa]
; アニメーションさせて加工画像を見せ、その完了を待ちます。
[anim name="back" left="-=300"]
[wa]

こういう画像を裏に敷いてるの。[p]
これはどういう画像かというと、[p]

; [filter]
; 加工画像をフィルター効果で真っ黒に。
[filter layer="1" name="back" brightness="0"]

いずれの表情においても、透明にならない領域――[p]

; [filter]
; 加工画像の明るさを元に戻す。
[filter layer="1" name="back" brightness="100"]

そういう領域で、デフォルトの表情を切り抜いているわ。[p]

; [anim]
; 加工画像の位置を元に戻す。
[anim name="back" left="+=300"]

これを裏に敷くことで、[wait time="500"][cm]

; [wa]
; アニメーションの完了を待つ。
[wa]
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="happy"  ] [wait time="100"]
[chara_mod name="akane" face="doki"   ] [wait time="100"]
[chara_mod name="akane" face="angry"  ] [wait time="100"]
[chara_mod name="akane" face="sad"    ] [wait time="100"]
[chara_mod name="akane" face="default" cross="false"]
[layopt layer="message0" visible="true"]

違和感を軽減してるってわけ。[p]
#akane:happy
万能ではないけど、背景が透ける現象への対策のアイディアのひとつとして提供しておくね。[p]
#akane:default
あとは、いっそ[<y]切り替え時間をゼロ[>]にするって手もある。[p]

; [chara_config]
; キャラクターの表情変更アニメーションに要する時間を変更する。
; →0ミリ秒
[chara_config time="0"]

; [layopt][chara_mod][layopt]
; 同上。
[layopt layer="message0" visible="false"]
[chara_mod name="akane" face="happy"  ] [wait time="500"]
[chara_mod name="akane" face="doki"   ] [wait time="500"]
[chara_mod name="akane" face="angry"  ] [wait time="500"]
[chara_mod name="akane" face="sad"    ] [wait time="500"]
[chara_mod name="akane" face="default"] [wait time="500"]
[layopt layer="message0" visible="true"]

; [chara_config]
; 時間を元に戻す。
[chara_config time="500"]

#akane
これなら透けないね。[p]
#akane:doki
……透ける時間がないからね。[p]
#akane:default
他に、キャラクターを[<y]パーツ分け[>]してしまうという手もあるわ。[p]
腕なら腕、体なら体、目なら目、眉なら眉……と、全部分けちゃうの。[p]
そうすれば、ほら、眉や目をクロスフェードで[r]切り替えても顔は透けないし……。[p]
腕を切り替えても体は透けないでしょ？[p]
#akane:doki
キャラ透け対策はこんなところかな～。[p]
どうしても気になるって人は自分なりに対策してみてねっ。[p]

[jump storage="select.ks"]