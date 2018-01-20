
; == 05_mask.ks ============================================

; スクリーンマスクの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
暗転中に背景などをセット[p]

; [mask]～[mask_off]
; マスクしている間に画面を書き換え、
; 1秒待った後にマスクを外します。
[mask     time=" 700"]
#akane:happy
[bg   time="   0" storage="mori.jpg"]
[wait time=" 300"]
[mask_off time=" 700" wait="true"]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

#akane
黒色以外にも好きな色を指定可能[p]

; [mask]～[mask_off]
; color属性に好きな色を指定することができます。
[mask     time="700" color="0xffffff"]
[bg   time="  0" storage="umi.jpg"]
[wait time="300"]
[mask_off time="700" wait="true"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

; [preload]
; 画像を事前に読み込んでおくタグです。
; 事前に読み込んでおくことで、いざ画像系のタグで画像を用いるとき、
; 表示がスムーズになります。
[preload  storage="data/image/mask_akane.png"]
[preload  storage="data/image/mask_noise.gif"]

#akane
画像も指定可能[p]
なお、使用する画像はどこかのタイミングでプリロードしておくことを推奨[p]

; [mask]～[mask_off]
; Akane's View (あかね視点)
; という画像を使ってマスクしてみるテスト。
[mask     time=" 700" graphic="mask_akane.png"]
[bg   time="   0" storage="mori.jpg"]
[wait time=" 300"]
[mask_off time=" 700" wait="true"]

#akane
GIF画像も指定可能[p]
なお、使用した画像は画面サイズに引き伸ばされる[p]

; [mask]～[mask_off]
; ノイズのGIF動画を用いてマスクしてみる。
; ホラー作品はもちろん、通常のアドベンチャーゲームでも、
; 何か過去の悲惨な事故を回想する瞬間なんかにノイズマスクは有用かもしれませんね。
[mask     time=" 700" graphic="mask_noise.gif"]
[bg   time="   0" storage="umi.jpg"]
[wait time=" 300"]
[mask_off time=" 700" wait="true"]



;-----------------------------------------------------------
*Part4
;-----------------------------------------------------------


#akane
［bg］［trans］などと同様のアニメーションが指定可能[l]

; [mask]～[mask_off]
; effect属性(注:method属性ではないです)にいろいろ指定することで、
; いろんなアニメーションをさせることができます。
; [mask]タグには「In」の字のついたアニメーション、
; [mask_off]タグには「Out」の字のついたアニメーションを指定しましょう。
; 指定できるアニメーションの一覧は data/video/effects.webm 動画でご覧になれます。
[mask     time="700" effect="flipInY"      color="0x662211"]
[bg   time="  0" storage="umi.jpg"]
[wait time="700"]
[mask_off time="700" effect="flipOutY"     wait="true"     ]

[mask     time="700" effect="rotateIn"     color="0x00eeaa"]
[bg   time="   0" storage="rouka.jpg"]
[wait time="700"]
[mask_off time="700" effect="rotateOut"    wait="true"     ]

[mask     time="700" effect="fadeInUpBig"  color="0xeeaa00"]
[bg   time="   0" storage="room.jpg"]
[wait time="700"]
[mask_off time="700" effect="fadeOutUpBig" wait="true"     ]

[cm]

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
以上です[p]

[jump storage="select.ks"]