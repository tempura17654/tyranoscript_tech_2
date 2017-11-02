
; == main.ks ===============================================

; オセロを遊ぶシナリオファイルです。

; ==========================================================
	
	

; ----------------------------------------------------------
*Start
; ----------------------------------------------------------
	
	; このシナリオファイルに来て最初に一度だけ行う処理です。
	; 画面の再構築を行います。
	
	; [mask]～[mask_off]
	; マスクして画面をいったん破壊し、再構築したあと、マスクを外します。。
	[mask time="500"]
	
		; [cm][layopt][freeimage]
		; 破壊。
		[cm]
		[layopt layer="message" visible="false"]
		[freeimage layer="0"]
		[freeimage layer="1"]
		[freeimage layer="2"]
		[clearfix]
		[skipstop]
		
		; [bg][chara_show]
		; 背景とキャラの表示。
		[bg time="0" storage="../others/plugin/othello/image/bg.png" layer="0" x="0" y="0"]
		[chara_show layer="0" time="0" name="othello_face" left="693" top="18"]
		
		; [kadomaru]
		; これは独自マクロです。
		; キャラを丸く切り取ります。
		[kadomaru name="othello_face" radius="50%"]
		
	[mask_off time="500"]
	
	
	
; ----------------------------------------------------------
*InitGame
; ----------------------------------------------------------
	
	; ゲームを始めるための処理です。
	
	; [cm][freeimage][layopt]
	; 繰り返しゲームを遊んだとき用。画面を破壊します。
	[cm]
	[freeimage layer="1"]
	[layopt visible="false" layer="message0"]
	
	; [iscript]～[endscript]
	; プログラミング的な部分の初期化を行います。
	[iscript]
		OTHELLO.initBoard();    // 仮想ボードの初期化
		f.pre_face = 'default'; // プレフェイスの初期化
		f.step_num = 1;         // 手数の初期化
		f.current_color = 2;    // 最初は黒(2)の番
		f.board = OTHELLO.board.concat();
	[endscript]
	
	; [chara_mod]
	; 表情を初期化します。。
	[chara_mod name="othello_face" face="default" cross="false" time="0"]
	
	; [ptext]
	; ゲーム情報を示すテキストを出します。レイヤー1。
	[ptext layer="1" name="white_num" text="白：2枚" size="56" edge="0x000000" color="0xffffff" x="694" y="280"]
	[ptext layer="1" name="black_num" text="黒：2枚" size="56"                 color="0x000000" x="694" y="350"]
	[ptext layer="1" name="step_num"  text="1手目"   size="46" edge="0x000000" color="0x009999" x="694" y="420" width="246" align="center"]
	
	; [image]
	; 石を4つ置きます。石はすべてレイヤー1に置いていきます。
	[image layer="1" name="stn,stn44" storage="../others/plugin/othello/image/stone_1.png" left="&(44%10)*70+22" top="&Math.floor(43/10)*70-30" width="70" height="70"]
	[image layer="1" name="stn,stn45" storage="../others/plugin/othello/image/stone_2.png" left="&(45%10)*70+22" top="&Math.floor(44/10)*70-30" width="70" height="70"]
	[image layer="1" name="stn,stn54" storage="../others/plugin/othello/image/stone_2.png" left="&(54%10)*70+22" top="&Math.floor(53/10)*70-30" width="70" height="70"]
	[image layer="1" name="stn,stn55" storage="../others/plugin/othello/image/stone_1.png" left="&(55%10)*70+22" top="&Math.floor(54/10)*70-30" width="70" height="70"]
	
	
	
	; [glink]
	; 選択肢を出します。
	[glink color="blue"  text="あかねLv1"      x="310" y="100" target="*BlackOrWhite" width="240" exp="f.level = 1"]
	[glink color="green" text="あかねLv2"      x="310" y="200" target="*BlackOrWhite" width="240" exp="f.level = 2"]
	[glink color="red"   text="あかねLv3"      x="310" y="300" target="*BlackOrWhite" width="240" exp="f.level = 3"]
	[glink color="black" text="ゲームをやめる" x="310" y="400" target="*Return"       width="240"]
	[s]
	

; ----------------------------------------------------------
*BlackOrWhite
; ----------------------------------------------------------	
	
	; [glink]
	; 選択肢を出します。
	[glink color="black" text="黒(先手)を持つ" x="310" y="200" target="*GoGame" width="240" exp="f.computers = [1, 0]"]
	[glink color="white" text="白(後手)を持つ" x="310" y="300" target="*GoGame" width="240" exp="f.computers = [0, 1]"]
	[s]



; ----------------------------------------------------------
*GoGame
; ----------------------------------------------------------
	
	; ゲーム開始処理。
	
	[layopt layer="message0" visible="true"]
	
	#akane
	[if exp="f.level == 1"]
		じゃあ、かるーく一回やろっか。[p]
	[elsif exp="f.level == 2"]
		何も考えずに置いてると負けちゃうよっ！[p]
	[else]
		ふふ……私、オセロはちょっと自信あるんだ。[p]
		いざ、尋常に勝負！[p]
	[endif]
	
	#
	[layopt layer="message0" visible="false"]
	
	
	; [jump]
	; ターン開始ラベルに飛びます。
	[jump target="*StartTurn"]
	
	
	
; ----------------------------------------------------------
*StartTurn
; ----------------------------------------------------------
	
	; ターン開始処理。
	
	; [jump]
	; もしコンピュータのターンなら、専用のラベルにジャンプします。
	[jump target="*ThinkComputer" cond="f.computers[f.current_color - 1]"]
	
	
	; [call][s]
	; もしコンピュータのターンでないなら、
	; プレイヤーが押す用のボタンを描画するサブルーチンを呼んだあと、
	; ゲームを止めます。
	[call target="*Sub_SetButtons"]
	[s]
	
	
	
	
; ----------------------------------------------------------
*ThinkComputer
; ----------------------------------------------------------
	
	; コンピュータが考えるとき専用のラベル。
	
	; [iscript]～[endscript]
	; コンピュータに考えさせて、
	; 置く場所が決定されたらそれをtf.put_posに格納して
	; *PutStoneラベルに飛びます。
	[iscript]
		var ret;
		switch (f.level) {
		case 1:
			ret = OTHELLO.minMaxWithNumber(OTHELLO, 3, f.current_color, f.current_color);
			break;
		case 2:
			ret = OTHELLO.minMaxWithPosition(OTHELLO, 3, f.current_color, f.current_color);
			break;
		case 3:
			ret = OTHELLO.minMax(OTHELLO, 3, f.current_color, f.current_color);
			break;
		};
		tf.put_pos = ret.pos;
		TYRANO.kag.ftag.startTag("jump", {
			target: "*PutStone"
		});
		//console.log(ret);
	[endscript stop="true"]
	; ↑ stop="true"を指定することで、
	;    ここでゲームを停止させることができます。



; ----------------------------------------------------------
*PutStone
; ----------------------------------------------------------
	
	; 石を置くラベル。
	; tf.put_posに格納されている場所に石を置きます。
	
	; [cm]
	; まずボタンを消す。
	[cm]
	
	; [image]
	; 押した場所に石を設置する。
	[image layer="1" name="&'stn,stn'+tf.put_pos" storage="&'../others/plugin/othello/image/stone_'+f.current_color+'.png'" left="&(tf.put_pos%10)*70+22" top="&Math.floor(tf.put_pos/10)*70-30" width="70" height="70"]
	
	; [call]
	; 石をひっくり返すサブルーチンを呼ぶ。
	[call target="*Sub_FlipStones"]
	
	; [call]
	; 上の処理だけでは見かけが変わるだけであり、
	; プログラム的には何も変わっていない。
	; よって、そこを更新するサブルーチンを呼ぶ。
	[call target="*Sub_UpdateGame"]
	
	; [wait][stop_kanim]
	; アニメーションの終了を確実に待ったあと、
	; キーフレームアニメーションを切る。
	[wait time="800"]
	[stop_kanim name="stn"]
	
	; [iscript]
	; ひっくり返された後の不要な石を削除
	[iscript]
		for (var i = 0; i < tf.flip_pos.length; i++) {
			var name = '.stn' + tf.flip_pos[tf.i];
			$(name).remove();
		};
	[endscript]
	
	
	; [jump]×3
	; もしゲームの終了条件を満たしていれば終了ラベルに飛ぶ。
	; もし置ける場所がなければパスラベルに飛ぶ。
	; それ以外ならターン開始ラベルに飛ぶ。
	[jump target="*EndGame" cond="OTHELLO.isEnd()"]
	[jump target="*Pass"    cond="!OTHELLO.canPut(f.current_color)"]
	[jump target="*StartTurn"]
	


; ----------------------------------------------------------
*Pass
; ----------------------------------------------------------
	
	; パスするラベル。
	
	; [iscript]～[endscript]
	; ターンを入れ替えます。
	[iscript]
		f.current_color = (f.current_color == 1) ? 2 : 1;
	[endscript]
	
	; [jump]
	; ターン開始ラベルに飛びます。
	[jump target="*StartTurn"]
	
	
	
; ----------------------------------------------------------
*EndGame
; ----------------------------------------------------------
	
	; ゲームを終了するラベル。
	
	; [iscript]～[endscirpt]
	; プレイヤーから見て勝ちか？　負けか？　引き分けか？
	; を判定し、tf.resultに格納します。
	[iscript]
		tf.result;
		tf.winner = OTHELLO.getWinner();
		if (tf.winner == 'draw') tf.result = 'draw';
		else if (tf.winner == 'black') {
			if (f.computers[1]) tf.result = 'lose';
			else tf.result = 'win';
		}
		else {
			if (f.computers[0]) tf.result = 'lose';
			else tf.result = 'win';
		};
	[endscript]
	
	; [jump]×3
	; 条件別に違うラベルにジャンプします。
	[layopt visible="true" layer="message0"]
	[jump target="*ResultDraw" cond="tf.result == 'draw'"]
	[jump target="*ResultLose" cond="tf.result == 'lose'"]
	[jump target="*ResultWin"  cond="tf.result == 'win'" ]



; ----------------------------------------------------------
*ResultDraw
; ----------------------------------------------------------
	
	; 引き分けラベル。
	#akane
		ひ、引き分け！！[p]
		こんなこともあるんだね～。[p]
	[jump target="*InitGame"]



; ----------------------------------------------------------
*ResultWin
; ----------------------------------------------------------
	
	; プレイヤー勝利ラベル。
	[chara_mod time="0" cross="false" name="othello_face" face="bad"]
	#akane
		負けたー!![p]
		む～……。[p]
	[if exp="f.level == 3"]
		私、本気出したんだけどなあ……。[p]
		君には敵わないかも。[p]
		[chara_mod time="0" cross="false" name="othello_face" face="default"]
		ユーアーザチャンピオン!　だね!![p]
	[endif]
	[jump target="*InitGame"]



; ----------------------------------------------------------
*ResultLose
; ----------------------------------------------------------
	
	; プレイヤー敗北ラベル。
	
	#akane
		ふふふ……私に勝つのはまだ早いわね！[p]
	[jump target="*InitGame"]



; ----------------------------------------------------------
*Return
; ----------------------------------------------------------
	
	; オセロを終了するラベル。
	[layopt visible="true" layer="message0"]
	#akane
		どう？　楽しかった？[p]
		久しぶりにやると楽しいでしょ！[p]
	[jump target="&f.othello_end_target" storage="&f.othello_end_storage"]
	
	
	
	
; ～以下サブルーチン定義～
	
	
	
; ----------------------------------------------------------
*Sub_UpdateGame
; ----------------------------------------------------------
	
	; ゲーム情報更新用のサブルーチンラベル。
	
	[iscript]
		OTHELLO.board = f.board.concat();
		// 石を置く
		OTHELLO.putStone(tf.put_pos, f.current_color);
		f.board = OTHELLO.board.concat();
		// 手番の入れ替え
		f.current_color = (f.current_color == 1) ? 2 : 1;
		// 手数の増加
		if (f.step_num < 60) f.step_num++;
		// ptextの更新用の一時変数格納
		var white_num = OTHELLO.getPieceNumWhite();
		var black_num = OTHELLO.getPieceNumBlack();
		tf.text1 = '白：' + white_num + '枚';
		tf.text2 = '黒：' + black_num + '枚';
		tf.text3 = f.step_num + '手目';
		// コンピュータから見てどれだけ枚数が勝っているか？
		var com = (f.computers[0]) ? 'white' : 'black';
		var dif = white_num - black_num;
		var com_dif = (com == 'white') ? dif : -dif;
		// フェイスの変更
		tf.face = 'default';
		if (com_dif >= 8) tf.face = 'good';
		else if (com_dif <= -8) tf.face = 'bad';
		// プレフェイスをチェック
		//(プレフェイスと違っていたときだけ表情を変更すべき)
		if (f.pre_face != tf.face) {
			tf.should_mod = true;
			f.pre_face = tf.face;
		} else tf.should_mod = false;
	[endscript]
	[ptext layer="0" overwrite="true" name="white_num" text="&tf.text1" size="56" edge="0x000000" color="0xffffff" x="694" y="280"]
	[ptext layer="0" overwrite="true" name="black_num" text="&tf.text2" size="56"                 color="0x000000" x="694" y="350"]
	[ptext layer="0" overwrite="true" name="step_num"  text="&tf.text3" size="46" edge="0x000000" color="0x009999" x="694" y="420" width="246" align="center"]
	[chara_mod cond="tf.should_mod" time="0" cross="false" name="othello_face" face="&tf.face"]
	[return]
	
	
	
; ----------------------------------------------------------
*Sub_SetButtons
; ----------------------------------------------------------
	
	; プレイヤーが押す用のボタンをセットしていくサブルーチンラベル。
	; 疑似的にForループを再現しています。
	
	; [iscript]～[endscript]
	; ・ループカウンタをリセットしています。
	; ・関数を呼んで、置くことが可能な場所の配列を tf.clickable_pos にセットしています。
	[iscript]
		OTHELLO.board = f.board.concat();
		tf.i = 0;
		tf.clickable_pos = OTHELLO.getAcceptedPos(f.current_color);
	[endscript]
	
	; ------------------------------------------------------
	*SetButtonsLoop
	; ------------------------------------------------------
		
		; [return]
		; 継続条件をチェックします。
		; ここでいきなり継続条件をチェックしておくことで、
		;【ループ開始時点からすでに継続条件が不成立】な場合に
		; 処理を一度も行わないようにしています。
		[return cond="!(tf.i < tf.clickable_pos.length)"]
		
		; [iscript]～[endscript]
		; ボタンを表示するための x, y, exp, graphic の計算。
		[iscript]
			tf.pos     = tf.clickable_pos[tf.i];
			tf.x       = (tf.pos % 10) * 70 + 22;
			tf.y       = Math.floor(tf.pos / 10) * 70 - 30;
			tf.exp     = 'tf.put_pos=' + tf.pos;
			tf.graphic = '../others/plugin/othello/image/stone_' + f.current_color + '_s.png';
		[endscript]
		
		; [button]
		; ボタンを設置します。
		[button target="*PutStone" graphic="&tf.graphic" x="&tf.x" y="&tf.y" width="70" height="70" exp="&tf.exp"]
		
		; [eval]
		; ループカウンタを増やします。
		[eval   exp="tf.i++"]
	
	; [jump]
	; ループします。
	[jump   target="*SetButtonsLoop"]



; ----------------------------------------------------------
*Sub_FlipStones
; ----------------------------------------------------------
	
	; 石をひっくり返していくサブルーチンラベル。
	; 疑似的にForループを再現しています。
	
	; [iscript]～[endscript]
	; ・ループカウンタをリセットしています。
	; ・関数を呼んで、裏返すべき位置の配列を tf.flip_pos にセットしています。
	[iscript]
		OTHELLO.board = f.board.concat();
		tf.i = 0;
		tf.flip_pos = OTHELLO.getFlipPos(tf.put_pos, f.current_color);
	[endscript]
	
	; ------------------------------------------------------
	*FlipStonesLoop
	; ------------------------------------------------------
	
		; [return]
		; 継続条件チェック。
		[return cond="!(tf.i < tf.flip_pos.length)"]
		
		; [iscript]～[endscript]
		; いろいろ計算。
		[iscript]
			tf.pos     = tf.flip_pos[tf.i];
			tf.name    = 'stn' + tf.pos;
			tf.id      = 'id' + new Date().getTime(); // ここで日付に基づいた識別子を生成していることに着目してくだしあ。
			tf.storage = '../others/plugin/othello/image/stone_'+f.current_color+'.png';
			tf.x       = (tf.pos % 10) * 70 + 22;
			tf.y       = Math.floor(tf.pos / 10) * 70 - 30;
			tf.exp     = 'tf.put_pos=' + tf.pos;
		[endscript]
		
		; [kanim][iscript]
		; いまある石をキーフレームアニメーション付きで除去します。
		;[free   layer="1" wait="false"   name="&tf.name" time="444"]
		[kanim  keyframe="othello_close" name="&tf.name" time="444" easing="ease-out"]
		[iscript]
			var j_stn = $('.' + tf.name);
			setTimeout(function(){
				j_stn.remove();
			}, 444);
		[endscript]
		
		; [image][kanim]
		; 裏側の石をキーフレームアニメーション付きで描画します。
		[image  layer="1" wait="false"   name="&tf.name+',stn,'+tf.id" time="  0" storage="&tf.storage" left="&tf.x" top="&tf.y" width="70" height="70"]
		[kanim  keyframe="othello_open"  name="&tf.id"                 time="444" easing="ease-out"]
		
		; [wait]
		; ちょっと待ちます。
		[wait time="50"]
		
		; [eval]
		; ループカウンタを増加させます。
		[eval exp="tf.i++"]
	
	; [jump]
	; ループします。
	[jump   target="*FlipStonesLoop"]