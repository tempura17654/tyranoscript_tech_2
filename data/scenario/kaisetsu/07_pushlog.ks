
; == 07_pushlog.ks =========================================

; プッシュログ・ノーログの解説を行います。

; ==========================================================
	
	
	
	; [set_default_view]
	; これは独自マクロです(→macro.ks)。
	; 解説画面を作成します。
	[set_default_view]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	#akane
		ノベルゲームの必需品と言えば、[<y]バックログ[>]!![p]
		バックログというのは、メッセージウィンドウに表示されたテキストを記録しておいて……。[p]
		それをあとから見返せる機能のこと。[p]
		基本、あったほうがプレイヤーには喜ばれるわ。[p]
	#akane:default
		さて。[p]
	#akane:doki
		そのバックログに、[<y]あえてテキストを追加しない[>]ようにしたり、[p]
		逆に[<y]メッセージウィンドウには表示されなかったテキストを追加[>]したり、ということができるの！[p]
		たとえば……
	
	; [nolog]～[endnolog]
	; ここはバックログに追加しない代わりに、
	[nolog]
	
	#akane
		[<y]272358399[>]!!!
	
	[endnolog]
	
	; [pushlog]
	; こちらをバックログに追加します。
	; join="true"を指定することで、前のテキストの続きとしてログを追加できます。
	[pushlog text="※※※見せてあげないよーーー!!※※※" join="true"]
	
	; [wait][cm]
	; ここでは、[p]タグを使わずに[wait][cm]で勝手にメッセージを送ってしまいます。
	[wait time="500"]
	[cm]
	
	#akane:doki
		さて、いまわたしが言った数字がわかるかな？[p]
	#akane:happy
		バックログを確認したってダメなんだからね！[l]
	
	[glink target="*Part1.1" text="イ．272358399" y="110" color="blue" size="24" x="220" width="440"]
	[glink target="*Part1.2" text="ロ．272358899" y="190" color="blue" size="24" x="220" width="440"]
	[glink target="*Part1.3" text="ハ．272853399" y="270" color="blue" size="24" x="220" width="440"]
	[s]
	
	
	
;-----------------------------------------------------------
*Part1.1
;-----------------------------------------------------------
	
	; [pushlog]
	; 選んだ選択肢をログに追加してやります。
	; text中に<br>を入れることで、改行することができます。
	[pushlog text="<br>➤　イ．272358399<br>"]
	
	#akane:doki
		…………………………………。[p]
	
	; [mtext][pushlog]
	; 演出文字を出します。
	; 演出文字はバックログには追加されませんので、[pushlog]で手動追加してやります。
	[mtext layer="1" text="正解!"    x="270" y="180" color="0xee6688" edge="0xffffff" size="180" time="700" wait="false" in_effect="flip" in_delay="200" out_effect="fadeOutUp"  ]
	[pushlog text="<br>➤　正解！<br>"]
	
	#akane:happy
		せ、正解！　すごーい……。[p]
	
	[jump target="*Part2"]
;-----------------------------------------------------------
*Part1.2
;-----------------------------------------------------------
	[pushlog text="<br>➤　ロ．272358899<br>"]
	#akane:doki
		…………………………………。[p]
	[mtext layer="1" text="不正解…" x="210" y="180" color="0x884422" edge="0x000000" size="150" time="700" wait="false" in_effect="tada" in_delay=" 50" out_effect="fadeOutDown"]
	[pushlog text="<br>➤　不正解…<br>"]
	#akane:sad
		惜しい！　ちょっと違うわね。[p]
	[jump target="*Part2"]
;-----------------------------------------------------------
*Part1.3
;-----------------------------------------------------------
	[pushlog text="<br>➤　ハ．272853399<br>"]
	#akane:doki
		…………………………………。[p]
	[mtext layer="1" text="不正解…" x="210" y="180" color="0x884422" edge="0x000000" size="150" time="700" wait="false" in_effect="tada" in_delay=" 50" out_effect="fadeOutDown"]
	[pushlog text="<br>➤　不正解…<br>"]
	#akane:sad
		惜しい！　ちょっと違うわね。[p]
	[jump target="*Part2"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	#akane:default
		……なーんてことに使えるかな。無茶ぶりして、ごめんね？[p]
		あとは……メッセージウィンドウに表示されないテキスト、たとえば[<y]選択肢文字[>]や[<y]演出文字[>]など、[p]
		そういうのをバックログに出すこともできるわ。[p]
	#akane:happy
		というか出してみたから、バックログを確認してみてね。[p]
	#akane:default
		他の使い道だと、何があるかな……。[p]
		難しい単語の注釈をバックログにだけ入れてみるとかはできるかも。[p]
		あとは……。[p]
		キャラクターの心情をこっそりバックログに追加してみるとか？……見たことないけど。[p]
		たとえば……。[p]
	#akane:angry
		べ、べつにあなたのことなんて好きでもなんでもないんだからねっ！
	
	[pushlog join="true" text="(好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き好き)"]
	[p]
	
	#akane:default
		……とかね。[p]
	#akane:doki
		え？　ちょっと怖いって？[p]
		そんなことないよー!![p]
	
	[jump storage="select.ks"]