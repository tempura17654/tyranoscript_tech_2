
; == 06_plugin.ks ==========================================

; プラグインの解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
プラグインを読み込む[p]

; [clearfix]
; fixレイヤーの解放。
[clearfix]

; [plugin]
; プラグインを読み込んでいます。
; nameに指定しているのはプラグインのフォルダの名前です。
[plugin name="theme_tyrano_02"]

#akane
読み込みました[p]
プラグインを読み込むことで使えるようになったタグ・マクロを使ってみる[p]

; [add_theme_button]
; これは上のプラグインを読み込むことで新たに使えるようになったマクロです。
; ロールボタン一式を追加します。
[add_theme_button]

#akane
ロールボタンを追加しました[p]
追加属性をつけてプラグインを読み込む[p]

; [plugin]
; frame_opacity属性を追加指定しつつプラグインを読み込んでみます。
; ※ 追加して指定できる属性はプラグインによって異なりますので、
;    プラグインの説明書などを参考にしましょう。
[plugin name="theme_tyrano_02" frame_opacity="100"]

#akane
読み込んでみました[p]
以上です[p]

; [set_message_window]
; これは独自マクロです(→macro.ks)。
; メッセージウィンドウをいじくってしまったので元に戻します。
[set_message_window]
[jump storage="select.ks"]