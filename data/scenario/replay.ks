;===========================================================
; 回想モード画面作成
;===========================================================



;-----------------------------------------------------------
*start
;-----------------------------------------------------------

@layopt layer=message0 visible=false
@clearfix
[hidemenubutton]
[cm]
[bg storage="../../tyrano/images/system/bg_base.png" time=100]
[layopt layer=1 visible=true]
[image name="label_replay" layer=1 left=0 top=0 storage="config/label_recollection.png" folder="image" ]
[iscript]
    tf.page = 0;
    tf.selected_replay_obj = {};
[endscript]



;-----------------------------------------------------------
*replaypage
;-----------------------------------------------------------

[cm]
[button graphic="config/menu_button_close.png" enterimg="config/menu_button_close2.png"  target="*backtitle" x=820 y=20 ]



;-------------------------------------------------------
*replayview
;-------------------------------------------------------

@jump target="& 'page_' + tf.page"



;-------------------------------------------------------
*page_0
;-------------------------------------------------------

[replay_image_button name="replay1" graphic="cat.jpg"   no_graphic="../../tyrano/images/system/noimage.png" x=140 y=130 width=300 height=200 folder="bgimage" ]
[replay_image_button name="replay2" graphic="toile.jpg" no_graphic="../../tyrano/images/system/noimage.png" x=520 y=130 width=300 height=200 folder="bgimage" ]
@jump target ="*common"



;-------------------------------------------------------
*page_1
;-------------------------------------------------------

@jump target ="*common"



;-------------------------------------------------------
*common
;-------------------------------------------------------

[s]



;-----------------------------------------------------------
*backtitle
;-----------------------------------------------------------

[cm]
[freeimage layer=1]
@jump storage=select.ks



;-----------------------------------------------------------
*nextpage
;-----------------------------------------------------------

[eval exp="tf.page++;"]
@jump target="*replaypage"



;-----------------------------------------------------------
*backpage
;-----------------------------------------------------------

[eval exp="tf.page--;"]
@jump target="*replaypage"



;-----------------------------------------------------------
*no_image
;-----------------------------------------------------------

@jump  target=*replaypage



;-----------------------------------------------------------
*clickcg
;-----------------------------------------------------------

[cm]
[eval exp=" tf.flag_replay = true "]
[free layer=1 name="label_replay"]
@jump storage=&tf.selected_replay_obj.storage target=&tf.selected_replay_obj.target