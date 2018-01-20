
; マクロ一覧
;
; ┌セーブ関係
; │├[saveinfo]            セーブ情報を取得して[ptext]で表示
; │├[setsave]             セーブ（[savesnap]とセット）
; │└[loading]             ロード
; │
; ├CG/リプレイモード関係
; │├[cg]                  CGを解放
; │├[cg_image_button]     CG閲覧用の[button]を表示
; │├[setreplay]           リプレイを解放
; │├[endreplay]           リプレイを終了
; │└[replay_image_button] リプレイ閲覧用の[button]を表示
; │
; └昔のなごり?
; 　├[back]                背景を表示
; 　├[charaset]            キャラクターを表示
; 　└[chararemove]         キャラクターを解放



; ----------------------------------------------------------
; セーブ関係
; ----------------------------------------------------------



; [saveinfo index="XXX"]
; index番目のセーブ情報を取得して、[ptext]タグを用いて表示します。
[macro name="saveinfo"]
; [iscript]～[endscript]
[iscript]
tf.savetext   = "";
tf.array_save = TG.menu.getSaveData().data;
tf.data       = tf.array_save[mp.index];
tf.title      = tf.data.title;
tf.save_date  = tf.data.save_date;
tf.savetext   = "<span style='font-size:10px'>" + tf.save_date + "</span><br />" + tf.title;
[endscript]
; [ptext]
[ptext * text="& tf.savetext"]
[endmacro]



; [setsave index="XXX"]
; index番目にセーブします。
[macro name="setsave"]
; [iscript]～[endscript]
[iscript]
TG.menu.doSave(mp.index);
[endscript]
[endmacro]



; [loading index="XXX"]
; index番目をロードします。
[macro name="loading"]
; [iscript]～[endscript]
[iscript]
TG.menu.loadGame(mp.index);
[endscript]
[endmacro]



; ----------------------------------------------------------
; CGモード・リプレイモード関連
; ----------------------------------------------------------



; ------------------------------------------------------
; 初期化
; ------------------------------------------------------



; [iscript]～[endscript]
; 初起動時の初期化処理を行います。
; システム変数 sf.cg_view, sf.replay_view が定義されていなければ
; それぞれに空のオブジェクト（ {} ）をぶちこみます。
[iscript]
if ( sf.cg_view ){
;
}
else {
sf.cg_view = {};
}
if ( sf.replay_view ) {
;
}
else {
sf.replay_view = {};
}
[endscript]



; ------------------------------------------------------
; CGモード
; ------------------------------------------------------



; [cg storage="XXX"]
; storage属性に指定したCGをCGモードで表示できるように(解放)します。
[macro name="cg" ]

; [iscript]～[endscript]
[iscript]
sf.cg_view[ mp.storage ] = "on";
[endscript]

[endmacro]



; [cg_image_button graphic="XXX, XXX, XXX, ..." no_graphic="XXX" thumb="XXX"]
; CGモードのボタンを表示するためのマクロです。
[macro name="cg_image_button"]

; [iscript]～[endscript]
; 配列変換、解放未開放のチェック、サムネイル有無のチェックなど。
[iscript]

; graphic属性の値を「,」で区切って配列にしたものを
; mp.graphicにぶち込む。
mp.graphic     = mp.graphic.split(',');

; そのCGはオープンか？　いったんfalseにしてから…
tf.is_cg_open  = false;

; 連想配列(＝オブジェクト)であるシステム変数 sf.cg_view から
; 配列 mp.graphic の先頭要素をキーにして値を取り出し
; それが真なら(というか'on'なら)そのCGはオープン扱いとする。
if( sf.cg_view[ mp.graphic[0] ] ) {
tf.is_cg_open = true;
}

; 配列 mp.graphic の写しを mp.tmp_graphic にとる。
; ※ 単に「 = mp.graphic 」とすると参照コピーとなるので、
;   「 .concat() 」をつけて値コピーとする。
mp.tmp_graphic = mp.graphic.concat();

; thumb属性がなんか指定されていれば、それを
; 配列 mp.tmp_graphic の先頭にぶち込む→この後の[button]のgraphic属性に利用。
if( typeof mp.thumb != "undefined" ) {
mp.tmp_graphic[0] = mp.thumb;
}

[endscript]

; [if]～[endif]
; 解放未開放でわけてボタンを表示します。
[if exp=" tf.is_cg_open == true "]
[button graphic="& mp.tmp_graphic[0]" name="%name" x="%x" y="%y" width="%width" height="%height" storage="cg.ks" target="*clickcg"  folder="bgimage" preexp="mp.graphic" exp="tf.selected_cg_image = preexp"]
[else]
[button graphic="& mp.no_graphic"     name="%name" x="%x" y="%y" width="%width" height="%height" storage="cg.ks" target="*no_image" folder="bgimage"]
[endif]

[endmacro]



; ------------------------------------------------------
; リプレイモード
; ------------------------------------------------------



; [setreplay name="XXX" storage="XXX" target="XXX"]
; リプレイを解放します。
[macro name="setreplay" ]
[iscript]
sf.replay_view[mp.name] = {storage:mp.storage, target:mp.target};
[endscript]
[endmacro]



; [endreplay]
; リプレイ中であるならばリプレイ選択画面に戻るマクロです。
[macro name="endreplay"]
[if exp="tf.flag_replay == true"]
[layopt page="fore" layer="message0" visible="false"]
[hidemenubutton]
[jump storage="replay.ks"]
[endif]
[endmacro]



; [replay_image_button name="XXX" graphic="XXX" no_graphic="XXX"]
; リプレイモードの開始ボタンを表示します。
[macro name="replay_image_button"]

; [iscript]～[endscript]
; 解放未開放の判定を行います。
[iscript]
tf.is_replay_open = false;
if( sf.replay_view[ mp.name ] ){
tf.is_replay_open = true;
}
[endscript]

; [if]～[endif]
; 解放未開放でわけてボタンを表示します。
[if exp=" tf.is_replay_open == true "]
[button graphic="%graphic"    name="%bname" x="%x" y="%y" width="%width" height="%height" storage="replay.ks" target="*clickcg"  folder="bgimage" preexp="sf.replay_view[mp.name]" exp="tf.selected_replay_obj = preexp"]
[else]
[button graphic="%no_graphic" name="%bname" x="%x" y="%y" width="%width" height="%height" storage="replay.ks" target="*no_image" folder="bgimage"]
[endif]

[endmacro]



; ----------------------------------------------------------
; 昔のなごり？
; ----------------------------------------------------------



; [back storage="XXX" time="XXX"]
; 背景を変更します。
[macro name="back"]

;[layopt layer="message0" visible="false"]
[backlay]
[image layer="base" page="back" storage="%storage"]
[trans layer="base" method="%method|crossfade" children="false" time="%time|2000"]
[wt]
;[layopt layer="message0" visible="true"]

[endmacro]



; [charaset storage="XXX" left="XXX" top="XXX" layer="XXX"]
; キャラクターを表示します。
[macro name="charaset"]

[backlay]
[image storage="%storage" left="%left|0" top="%top|0" layer="%layer" page="back" visible="true"]
[trans time="%time|1"]
[wt]

[endmacro]



; [chararemove layer="XXX"]
; キャラクターを削除します。
[macro name="chararemove"]
[freeimage layer="%layer"]
[endmacro]













[return]