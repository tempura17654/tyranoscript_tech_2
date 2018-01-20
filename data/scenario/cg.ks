;===========================================================
; CGモード画面作成
;===========================================================



;-----------------------------------------------------------
*start
;-----------------------------------------------------------


; CGモード画面に飛んできたときに行う初期化処理。


; [layopt][hidemenubutton]
; レイヤー設定。
; メッセージレイヤーとメニューボタン→非表示、
; レイヤー０・１→表示にします。
[layopt layer="message0" visible="false"]
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[hidemenubutton]

; [clearfix][cm]
; レイヤーの解放。
; fixレイヤーとフリーレイヤー(=ボタンやHTML等が挿入されるレイヤー)を解放します。
[clearfix]
[cm]

; [bg][image]
; 背景と左上のラベルを表示します。
[bg storage="../../tyrano/images/system/bg_base.png" time="700"]
[image layer="0" left="0" top="0" storage="config/label_cg.png" folder="image"]

; [iscript]～[endscript]
; 一時変数の設定。
[iscript]
tf.page              = 0;        // CG閲覧ページの番号
tf.selected_cg_image = [];       // 選択されたCGの差分配列
tf.cg_index          = 0;        // 選択されたCGの差分配列の要素番号
[endscript]

[jump target="*cgpage"]



;-----------------------------------------------------------
*cgpage
;-----------------------------------------------------------


; CG画面のボタンを作成します。


; [cm]
; フリーレイヤーの解放。
[cm]

; [button]
; クローズボタンを設置します。
[button graphic="config/menu_button_close.png" enterimg="config/menu_button_close2.png"  target="*backtitle" x="820" y="20"]

; [jump]
; tf.page変数を利用して個別閲覧ボタン作成ラベルにジャンプします。
[jump target="& 'page_' + tf.page "]



;-------------------------------------------------------
*page_0
;-------------------------------------------------------

; [cg_image_button]
; これは独自マクロです(→tyrano.ks)。
; CGを閲覧するボタンを、解放/未開放を判断しながら表示します。
;   graphic    ... 閲覧させたいCGのstorage。bgimageフォルダが基準。
;   thumb      ... 解放時のサムネイル。省略した場合はgraphicが使われる。
;   no_graphic ... 未解放時のサムネイル。
;   他         ... [button]と同じ要素。
; graphic属性をカンマ区切りで複数指定することで、差分画像をクリックで見せていくことができます。
; (カンマ区切りで複数指定した場合、解放/未開放の判定は先頭の要素で行われます。)
[cg_image_button graphic="room.jpg"                no_graphic="../../tyrano/images/system/noimage.png" x="140" y="130" width="300" height="200"]
[cg_image_button graphic="rouka.jpg"               no_graphic="../../tyrano/images/system/noimage.png" x="520" y="130" width="300" height="200"]
[cg_image_button graphic="eki.jpg, eki_shinya.jpg" no_graphic="../../tyrano/images/system/noimage.png" x="140" y="380" width="300" height="200"]
[cg_image_button graphic="mori.jpg"                no_graphic="../../tyrano/images/system/noimage.png" x="520" y="380" width="300" height="200"]

/*解放コマンド
[cg storage="room.jpg"]
[cg storage="rouka.jpg"]
[cg storage="eki.jpg"]
[cg storage="mori.jpg"]
*/

[button graphic="config/arrow_next.png" target="*nextpage" x="850" y="320"]

[jump target="*common"]



;-------------------------------------------------------
*page_1
;-------------------------------------------------------

[cg_image_button graphic="umi.jpg"                 no_graphic="../../tyrano/images/system/noimage.png" x="140" y="130" width="300" height="200"]
[cg_image_button graphic="../fgimage/nobekore_x2.jpg" no_graphic="../../tyrano/images/system/noimage.png" x="520" y="130" width="300" height="200"]

/*解放コマンド
[cg storage="umi.jpg"]
[cg storage="../fgimage/nobekore_x2.jpg"]
*/

[button graphic="config/arrow_prev.png" target="*backpage" x="30" y="320"]

[jump target="*common"]



;-------------------------------------------------------
*common
;-------------------------------------------------------

; 停止します。

[s]



;-----------------------------------------------------------
*backtitle
;-----------------------------------------------------------


; タイトルに戻る処理です。


; [cm][freeimage]
; フリーレイヤーとレイヤー０・１を解放して、
[cm]
[freeimage layer="0"]
[freeimage layer="1"]

; [jump]
; タイトル画面にジャンプします。
[jump storage="select.ks"]



;-----------------------------------------------------------
*nextpage
;-----------------------------------------------------------


; 次のページに移る処理です。

; [eval][jump]
; 一時変数 tf.page を増加させたうえで *cgpage へ。
[eval exp="tf.page++"]
[jump target="*cgpage"]



;-----------------------------------------------------------
*backpage
;-----------------------------------------------------------


; 前のページに移る処理です。


; [eval][jump]
; 一時変数 tf.page を増加させたうえで *cgpage へ。
[eval exp="tf.page--"]
[jump target="*cgpage"]



;-----------------------------------------------------------
*no_image
;-----------------------------------------------------------


; 未解放のCGをクリックしたときの処理です。


; [jump]
; 単に *cgpage へ。
[jump  target="*cgpage"]



;-----------------------------------------------------------
*clickcg
;-----------------------------------------------------------


; 解放済みのCGをクリックしたときの処理です。


; [cm][layopt]
; フリーレイヤーとレイヤー１(back)を解放します。
[cm]
[freeimage layer="1" page="back"]

; [eval]
; 一時変数 tf.cg_index に 0 をぶち込みます。
[eval exp="tf.cg_index = 0"]



;-------------------------------------------------------
*cg_next_image
;-------------------------------------------------------


; CGを見ていきます。
; ひとつしかない場合は、ひとつだけ見たあと *cgpage に戻ります。
; 見るべきCGが複数ある場合(差分がある場合)は、
; 再帰的にこのラベルに飛び直して次のCGを見ていきます。


; [freeimage][image][trans][wt][l]
; CGを表示してクリックを待ちます。
[freeimage layer="1" page="back"]
[image     layer="1" page="back" storage="& tf.selected_cg_image[ tf.cg_index ] " folder="bgimage" width="960" height="640"]
[trans     layer="1" time="700"]
[wt]
[l]


; クリックされたら。


; [eval]
; 一時変数 tf.cg_index (差分画像がある場合の画像番号)を1増加させます。
[eval exp=" tf.cg_index++ "]

; [if][jump]
; まだ表示すべき差分画像が残っているなら、このラベルに飛びなおします。
[if exp=" tf.selected_cg_image.length > tf.cg_index "]
  [jump target="cg_next_image"]

; [else][freeimage][jump]
; もう表示すべき差分画像が残っていないなら、
; レイヤー１を解放して *cgpage に戻ります。
[else]
  [freeimage layer="1" page="back"]
  [freeimage layer="1" page="fore" time="700"]
  [jump target="*cgpage"]

[endif]