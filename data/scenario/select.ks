
; == select.ks =============================================

; タイトル画面を作成するシナリオファイルです。

; 技術的にやや高度なことをしています。
; ノベルゲーム作りにはほとんど関係ない技術ですので、
; いちおうコメントは記しておきますが、無理して読解に挑む必要はないです。

; ==========================================================






; ----------------------------------------------------------
*Start
; ----------------------------------------------------------


; [layopt]
; メッセージレイヤーは消します。
[layopt layer="message" visible="false"]

; [eval]
; 二つのゲーム変数、
;
;     f.current_page_index … 現在のページ番号は何か？（数値。1, 2, 3, …）
;     f.current_page_label … 現在のページのラベル名は何か？（文字列。'*Sub_Page1', '*Sub_Page2', …）
;
; を、それぞれ[eval]によって定義します。
; ここで、cond="f.current_page_index == undefined"に注目してください！
; これは、｢f.current_page_indexがなんにも定義されていなかったらこのタグを実行してね｣という合図です。
; もし一度でもここのシナリオを通ってf.current_page_indexに1が代入される処理が実行されていれば、
; もう次回以降このタグの処理が行われることはない、ということになります。
; こうすることによって、前回のページ番号の引継ぎができます。
[eval exp="f.current_page_index = 1" cond="f.current_page_index == undefined"]
[eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index" ]

; [mask]
; マスクをかけて画面再構築の準備をします。
[mask graphic="mask_logo.png" time="800" effect="rotateInDownRight"]

; [destroy]
; これは独自マクロです(→macro.ks)。
; ゲーム画面を破壊してまっさらな状態にします。
[destroy]

; [bg]
; 背景を表示します。
; [bg]のstorageには通常｢bgimage｣フォルダに入っているファイルを
; 指定しますが、｢../fgimage/｣のように記述することで、
; ｢fgimage｣など他のフォルダにあるファイルも指定できます。
; ここでは白1ドットのPNG画像を読み込み、それをゲーム画面いっぱいに引き伸ばすことで、
; 結果として背景が真っ白になります。
[bg time="0" storage="../fgimage/color/white.png"]

; [wait]
; マスク画像（アイキャッチ画像）を見せたいので、ちょっと待ちます。
; あまり長いとストレスになりますので、ちょっとだけ。
[wait time="400"]

; [button]
; ｢前ページへ｣｢次ページへ｣ボタンを表示します。
; このボタンは常に表示したいので、fix="true"としています。
; (fix="true"とした場合、ジャンプ先はサブルーチンとしてコールされ、コールスタックが溜まります。)
; ここで、x座標に着目してください。-400, 960です。
; この時点では画面内に映っていないのです！
; あとから[anim]を使って画面内に表示させます。
[button name="prev" graphic="button_prev.png" x="-400" y="575" fix="true" target="*Sub_Prev"]
[button name="next" graphic="button_next.png" x=" 960" y="575" fix="true" target="*Sub_Next"]

; [call]
; 選択肢表示サブルーチンを呼びます。
[call target="& f.current_page_label"]

; [mask_off]
; ここまでで、ゲーム画面の構築が終わりました。
; かけていたマスクを外します。
[mask_off time="400"]

; ゲームを停止させます。
; 原則として、選択肢を表示した後はゲームを停止させなければいけません。
[s]



; ----------------------------------------------------------
*Sub_Page1
; ----------------------------------------------------------

; 選択肢表示サブルーチン１ページ目。

; [index_reset]
; これは独自マクロです(→macro.ks)。
; リストアイテム番号(一時変数)をリセットします。
[index_reset]

; [list_item]
; これは独自マクロです(→macro.ks)。
; リストアイテムを表示していきます。
[list_item text1="01…カメラを動かす！　　　　　　　" text2="[camera][reset_camera][wait_camera]" storage="01_camera.ks         " shiryou="yes"]
[list_item text1="02…レイヤーを合成する～色と画像～" text2="[layermode][free_layermode]        " storage="02_layermode.ks      " shiryou="yes"]
[list_item text1="03…レイヤーを合成する～映像～　　" text2="[layermode_movie]                  " storage="03_layermode_movie.ks" shiryou="yes"]
[list_item text1="04…フィルター効果をかける　　　　" text2="[filter][free_filter]              " storage="04_filter.ks         " shiryou="yes"]
[list_item text1="05…ゲーム画面を覆い隠す　　　　　" text2="[mask][mask_off]                   " storage="05_mask.ks           " shiryou="yes"]
[list_item text1="06…プラグインを読み込む　　　　　" text2="[plugin]                           " storage="06_plugin.ks         " shiryou="yes"]

; [anim]
; ｢前ページへ｣ボタンは画面〈外〉に、｢次ページへ｣ボタンは画面〈内〉に。
[anim name="prev" left="-400" time="0"]
[anim name="next" left=" 660" time="0"]

; [button]
; あいさつ画面にいくボタンを出します。
; これはfixボタンではありませんので、[cm]で消えます。
[button graphic="button_title.png" x="-100" y="575" target="*BackTitle"]

; [return]
; このラベルはサブルーチンとして呼ばれるので[return]が必須です。
[return]



; ----------------------------------------------------------
*Sub_Page2
; ----------------------------------------------------------

; 選択肢表示サブルーチン２ページ目。

[index_reset]
[list_item text1="07…バックログに追加する？　しない？" text2="[pushlog][nolog][endnolog] " storage="07_pushlog.ks    " shiryou="yes"]
[list_item text1="08…制限時間付きの選択肢とか　　　　" text2="[wait][wait_cancel]        " storage="08_wait_cancel.ks" shiryou="yes"]
[list_item text1="09…一時的に別の画面に遷移する　　　" text2="[sleepgame][awakegame]     " storage="09_sleepgame.ks  " shiryou="yes"]
[list_item text1="10…セーブのサムネイルを変更する　　" text2="[save_img]                 " storage="10_save_img.ks   " shiryou="yes"]
[list_item text1="11…HTMLを挿入したりリンクを張ったり" text2="[html][endhtml][web]       " storage="11_html.ks       " shiryou="yes"]
[list_item text1="12…V450から加わった背景の切り替え　" text2="[bg][mask][mask_off][trans]" storage="12_bg.ks         " shiryou="yes"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 660" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Page3
; ----------------------------------------------------------

; 選択肢表示サブルーチン３ページ目。

[index_reset]
[list_item text1="13…条件分岐の基礎　　　　　　　　　" text2="[if][ignore]            " storage="13_if.ks     " shiryou="yes"]
[list_item text1="14…ランダム分岐　　　　　　　　　　" text2="[getrand][getrandname]  " storage="14_rand.ks   " shiryou="yes"]
[list_item text1="15…[kanim]と[anim]の違い　　　　 　" text2="[kanim][anim]           " storage="15_kanim.ks  " shiryou="yes"]
[list_item text1="16…メッセージウィンドウのテクニック" text2="[er][current][position] " storage="16_message.ks" shiryou="yes"]
[list_item text1="17…立ち絵をパーツごとに分割する　　" text2="[macro][chara_new]      " storage="17_part.ks   " shiryou="yes"]
[list_item text1="18…GIF画像のススメ　　　　　　　　 " text2="[image][mask][chara_new]" storage="18_gif.ks    " shiryou="yes"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 660" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Page4
; ----------------------------------------------------------

; 選択肢表示サブルーチン４ページ目。

[index_reset]
[list_item text1="19…ボイスを連番で管理する"      text2="[voconfig][vostart][vostop]" storage="19_voconfig.ks"  shiryou="no"]
[list_item text1="20…キャラ透け現象への対策"      text2="[chara_mod]                " storage="20_chara_mod.ks" shiryou="no"]
[list_item text1="21…ティラノスクリプトの可能性"  text2="[eval][iscript][loadjs]    " storage="21_othello.ks"   shiryou="no"]
;[list_item text1="22…" text2="[]" storage="22_.ks" shiryou="yes"]
;[list_item text1="23…" text2="[]" storage="23_.ks" shiryou="yes"]
;[list_item text1="24…" text2="[]" storage="24_.ks" shiryou="yes"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 960" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Next
; ----------------------------------------------------------

; 次ページに向かうサブルーチンです。

; [ignore]～[endignore]
; [ignore]タグは、exp属性の中身(条件)をチェックして、
; 条件を満たしているならば[endignore]までの記述を無視する、という機能を持ったタグです。
;
; もし現在のページ番号が4以上なら、[ignore]～[endignore]の記述、
; すなわち次ページに向かう処理をまるっと無視します。
;
; これ以上ページはないのに次に進もうとしたらバグりますから、
; [ignore]で対策をしているということですね。
[ignore exp="f.current_page_index >= 4"]

  ; [eval]
  ; 現在のページ番号を１増加させ、現在のページラベルを更新します。
  [eval exp="f.current_page_index++"]
  [eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index"]

  ; [cm]
  ; フリーレイヤーを解放します。
  ; (このタグで、クリッカブルボタンや非fixなグラフィカルボタンなどが消えます。)
  [cm]

  ; [freeimage]
  ; レイヤー０を開放します。
  ; (このタグで、リストアイテムを形作っていた画像・文字がすべて消えます。)
  [freeimage layer="0"]

  ; [call]
  ; 次のページの目次表示サブルーチンをコールします。
  [call target="&f.current_page_label"]

; [endignore]
; 無視する場合はここまで無視。
[endignore]

; [return]
; このラベルはfixボタンによって呼ばれています。
; つまりサブルーチンとしてコールされているので、[return]必須です。
[return]



; ----------------------------------------------------------
*Sub_Prev
; ----------------------------------------------------------

; 前ページに向かうサブルーチンです。

[ignore exp="f.current_page_index <= 1"]
[eval exp="f.current_page_index--"]
[eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index"]
[cm]
[freeimage layer="0"]
[call target="&f.current_page_label"]
[endignore]
[return]



; ----------------------------------------------------------
*BackTitle
; ----------------------------------------------------------

[dialog type="confirm" text="初起動時に表示されたあいさつを見ますか？" target="*BackTitleYes" target_cancel="*BackTitleNo" label_ok="はい" label_cancel="いいえ"]
[s]

; ------------------------------------------------------
*BackTitleNo
; ------------------------------------------------------

[cm]
[freeimage layer="0"]
[call target="*Sub_Page1"]
[s]

; ------------------------------------------------------
*BackTitleYes
; ------------------------------------------------------

[eval exp=" sf.title_moumita = 0 "]
[mask time="700"]
[destroy]
[mask_off time="0"]
[jump storage="title.ks"]