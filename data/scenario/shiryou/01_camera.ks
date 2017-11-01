
; == 01_camera.ks ==========================================

; カメラ演出の解説を行います。

; ==========================================================
	
	
	
	; [set_default_view]
	; これは独自マクロです(→macro.ks)。
	; 解説画面を作成します。
	[set_default_view]
	
	
	; 補足：あかねはレイヤー１にいます。
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	#akane:default
		１枚絵×カメラ[p]
	
	; [image]
	; ノベコレの画像を出します。
	[image  layer="2" time="700" storage="nobekore_x2.jpg" width="960" height="640" left="0" top="0"]
	
		１．５倍ズームで一周[p]
	
	; [camera]×５
	; zoom="1.5"のまま、左上から順にぐるりと回ります。
	; また、２回目以降の[camera]タグでzoom属性を省略していることに着目してください。
	; 属性を省略した場合は、そのときの状態を引き継ぐことになります。
	[camera zoom="1.5" x="-160" y=" 106" time="700"]
	[camera            x=" 160" y=" 106" time="700"]
	[camera            x=" 160" y="-106" time="700"]
	[camera            x="-160" y="-106" time="700"]
	[camera            x="-160" y=" 106" time="700"]
	
	; [reset_camera]
	; カメラを元の場所に戻します。
	[reset_camera]
		
		２倍ズームで一周[p]
	
	; [camera]×５→[reset_camera]
	[camera zoom="2.0" x="-240" y=" 160" time="700"]
	[camera zoom="2.0" x=" 240" y=" 160" time="700"]
	[camera zoom="2.0" x=" 240" y="-160" time="700"]
	[camera zoom="2.0" x="-240" y="-160" time="700"]
	[camera zoom="2.0" x="-240" y=" 160" time="700"]
	[reset_camera]
		
		; ※ 補足 ※
		; カメラのzoom属性の値がzのとき、
		; 画面が見切れないぎりぎりの移動量x、yは、
		; wを画面幅、hを画面高さとして、次のように計算できる。
		; 
		;    x = w * (1 - 1/z) / 2
		;    y = h * (1 - 1/z) / 2
	
		特定部分に注目[p]
	
	; [camera]×３→[reset_camera]
	; rotate属性で角度をつけることができます。
	[camera zoom="1.7" x="-150" y="  20" rotate=" 15"]
	[camera zoom="4.0" x="-150" y="-190" rotate="-10"]
	[camera zoom="2.0" x=" 240" y="  60" rotate="  0"]
	[reset_camera]
	
	; [freeimage]
	; レイヤー２を解放します。
	[freeimage layer="2" time="700"]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	#akane
		画面サイズより大きい背景×カメラ[p]
		
		; [image]
		; 画面サイズ(960x640)の倍の大きさ(1920x1280)の海の背景画像をレイヤー１に出します。
		; (背景レイヤーには出せません。なぜかというと、ティラノスクリプトの仕様上、
		; 背景レイヤーに出した画像は自動的に画面サイズにフィットするようにリサイズされるからです。
		; したがって、画面サイズより大きい画像を扱う場合、レイヤー０以上で扱います。)
		[image time="700" storage="../bgimage/umi_big.jpg" x="-480" y="-640" width="1920" height="1280" layer="0"]
		
		; [camera]×５→[reset_camera]
		; この状態でカメラを動かす。
		; 背景がレイヤー０、あかねがレイヤー１にいる状態です。
		; layer属性を指定しなかった場合、すべてのレイヤーが同じ移動量で移動します。
		[camera x="   0" y="640" time="700"]
		[camera x="-480" y="640" time="700"]
		[camera x="-480" y="  0" time="700"]
		[camera x=" 480" y="  0" time="700"]
		[camera x=" 480" y="640" time="700"]
		[reset_camera]
		
		; [freeimage]
		; レイヤー０を解放します。
		[freeimage layer="0" time="700"]
	
	
	
;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------
	
	#akane
		レイヤーごとに別々に動かす[p]
	
	; [layopt]
	; メッセージレイヤを非表示にします。
	[layopt visible="false" layer="message0"]
	
	; [mask]～[mask_off]
	; 画面を白色で覆い、その間に海画像のセットとカメラの位置調整を行います。
	[mask color="white" time="400"]
		[image  storage="../bgimage/umi_big.jpg" x="-660" y="-600" width="1920" height="1280" layer="0"]
		; [camera]×２
		; ０カメラと１カメラの移動量に若干差をつけておきます。
		[camera y="400" time="0" layer="0"]
		[camera y="600" time="0" layer="1"]
	[mask_off time="400"]
	
	; [reset_camera]×２
	; ０カメラと１カメラを同時にリセットします。
	; 先に使うほうのカメラタグにwait="false"を指定することで、
	; 二つのカメラタグが同時に動作します。
	[reset_camera layer="1" wait="false" time="2000" ease_type="ease-out"]
	[reset_camera layer="0"              time="2000" ease_type="ease-out"]
	
	;-------------------------------------------------------
	*Part3.1
	;-------------------------------------------------------
			
			; ★IE, Edge用。カメラの準備運動をしてやらないと一部挙動がおかしくなる、、、。
			[camera layer="1" x="0" time="0"]
			[camera layer="0" x="0" time="0"]
			
	; [camera]×２
	; あかねは海よりも手前にいるわけですから、海よりもあかねのほうが
	; ダイナミックに動くのが自然です。
	; そこで、あかねを映している１カメラのほうを気持ち多めに動かします。(比は適当)
	[camera time="700" x="-90" y="0" layer="1" wait="false"]
	[camera time="700" x="-60" y="0" layer="0"]
	
	; 以下、同上。
	[camera time="700" x="90" y="0" layer="1" wait="false"]
	[camera time="700" x="60" y="0" layer="0"]
	
	[camera time="700" x="-180" y="90" zoom="0.6" layer="1" wait="false"]
	[camera time="700" x="-120" y="60" zoom="0.9" layer="0"]
	
	[camera time="700" x="150" y="-150" zoom="2  " layer="1" wait="false"]
	[camera time="700" x="100" y="-100" zoom="1.6" layer="0"]
	
	[reset_camera time="700" layer="1" wait="false"]
	[reset_camera time="700" layer="0"]
	
	;-------------------------------------------------------
	*Part3.2
	;-------------------------------------------------------
	
	; [layopt]
	; メッセージレイヤを表示します。
	[layopt visible="true" layer="message0"]
	#akane
		さらにまったく動かないレイヤーを追加してみる[p]
	
	; [layopt]
	; メッセージレイヤを非表示にします。
	[layopt visible="false" layer="message0"]
	
	; [image]
	; スマホの枠を表示します。
	[image time="700" storage="sumaho_room.png" layer="2"]
	
	
	;-------------------------------------------------------
	*Part3.3
	;-------------------------------------------------------
	
	; ここの内容は*Part3.1と完全に同一です。
	
	[camera time="700" x="-90" y="0" layer="1" wait="false"][camera time="700" x="-60" y="0" layer="0"]
	[camera time="700" x="90" y="0" layer="1" wait="false"][camera time="700" x="60" y="0" layer="0"]
	[camera time="700" x="-180" y="90" zoom="0.6" layer="1" wait="false"][camera time="700" x="-120" y="60" zoom="0.9" layer="0"]
	[camera time="700" x="150" y="-150" zoom="2  " layer="1" wait="false"][camera time="700" x="100" y="-100" zoom="1.6" layer="0"]
	[reset_camera time="700" layer="1" wait="false"][reset_camera time="700" layer="0"]
	
	
	
	;-------------------------------------------------------
	*Part3.4
	;-------------------------------------------------------
	
	; [freeimage][layopt]
	; レイヤー０，２を解放してメッセージレイヤを表示します。
	[freeimage layer="0" time="700"]
	[freeimage layer="2" time="700"]
	[layopt visible="true" layer="message0"]
	
	
	
;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------
	
	#akane
		不連続なカメラ[p]
		
			; ★IE, Edge用。カメラの準備運動をしてやらないと一部挙動がおかしくなる、、、。
			[camera time="0" x="0"]
	
	; [camera]
	; カメラタグには from_x, from_y, from_rotate 属性があり、
	; カメラ演出開始時のx, y, rotateを指定できます。
	; (指定しなければ、現在のカメラ位置が基準になります。)
	[camera y="80" zoom="1.5" from_y="-100" from_zoom="1.5" ease_type="cubic-bezier(0.075, 0.82, 0.165, 1)"]
	[camera y="80" zoom="2.2" from_y="-160" from_zoom="2.2" ease_type="cubic-bezier(0.075, 0.82, 0.165, 1)"]
	[camera x="10" y="100" zoom="3" rotate="0" from_y="80" from_zoom="5" from_rotate="270"]
	[reset_camera]
	
	
	
;-----------------------------------------------------------
*Part5
;-----------------------------------------------------------
	
	#akane
		カメラタグは、動作しはじめる前に若干のウェイトが勝手に挟まれるため……[p]
		カメラタグを連続で並べても、完全に繋がった動きにならない[p]
	
	[camera x="300" time="700" ease_type="linear"]
	[camera x="  0" time="700" ease_type="linear"]
	[camera zoom="1.2" time="700" ease_type="linear"]
	[camera zoom="0.7" time="700" ease_type="linear"]
	
	#akane
		これをwait="false"と［wait］タグの組み合わせで強引に回避する[p]
	
	; [camera wait="false"] + [wait]
	; この組み合わせによって、上記現象を回避することができる。
	; ただし、動作はやや不安定になります。
	[camera time=" 500" zoom="1.2" rotate="20" ease_type="linear" wait="false"]
	[wait   time=" 500"]
	[camera time="2500" zoom="1  " rotate=" 0" ease_type="linear" wait="false"]
	[wait   time="2500"]
	[camera time=" 500" x="-150" y="-80" zoom="1.5" ease_type="linear" wait="false"]
	[wait   time=" 500"]
	[camera time="2500" zoom="1.5" x="150" ease_type="linear" wait="false"]
	[wait   time="2500"]
	[reset_camera]
	
	
	
;-----------------------------------------------------------
*Part6
;-----------------------------------------------------------
	
	#akane
		カメラの移動完了待ちも可能[p]
	
	; [camera]
	; wait="false"にして、先に進みます。
	[camera x="-300" wait="false" time="3200"]
		
		カメラの移動が終わるのを待機中…
	
	; [wait_camera]
	; ここでカメラの完了を待てます。
	[wait_camera]
	
		終わった[p]
	
	
	
;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------
	
	#akane
		［kanim］と同じイージングが使用可能[p]
	
	; [camera]
	; カメラタグにはease_type属性があり、これをいろいろ指定することで、
	; カメラの移動の仕方（直線的に動く、ふわっと動く、など）を変えることができます。
	; [kanim]のeasing属性に指定できるものと同じ。
	[camera x=" 300" time="700" ease_type="linear"]
	[camera x="-300" time="700" ease_type="ease"]
	[camera x=" 300" time="700" ease_type="ease-in"]
	[camera x="-300" time="700" ease_type="ease-out"]
	[camera x=" 300" time="700" ease_type="ease-in-out"]
	[reset_camera    time="700" ease_type="cubic-bezier(0.68, -0.55, 0.265, 1.55)"]
	
	
	
;-----------------------------------------------------------
*Part7
;-----------------------------------------------------------
	
	#akane
		以上です[p]
	
	[jump storage="select.ks"]