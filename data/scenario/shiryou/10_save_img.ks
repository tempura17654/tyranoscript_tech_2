
; == 10_save_img.ks ========================================

; セーブサムネイルの変更を行います。

; ==========================================================
	
	
	
	; [set_default_view]
	; これは独自マクロです(→macro.ks)。
	; 解説画面を作成します。
	[set_default_view]
	
	
	
;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------
	
	#akane
		ここでセーブすると通常通りゲーム画面のキャプチャがサムネイルとなる[p]
	
	; [save_img]
	; フォルダの基準は bgimage フォルダ。
	; ここでは ../fgimage/ とすることで fgimage フォルダの画像を指定しています。
	[save_img storage="../fgimage/nobekore_x1.jpg"]
	
	#akane
		ここでセーブすると指定画像がサムネイルとなる[p]
	
	
	
;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------
	
	; [save_img]
	; storage="default"で元に戻せます。
	[save_img storage="default"]
	
	#akane
		ここでセーブすると通常通りゲーム画面のキャプチャがサムネイルとなる[p]
	
	#akane
		以上です[p]
	
	[jump storage="select.ks"]