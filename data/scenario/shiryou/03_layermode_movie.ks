
; == 04_layermode_movie.ks =================================

; レイヤーモードによるムービー合成の解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; [filter][bg]
; 深い理由はないのですが、
; 画面を暗くしておいたほうが映像が映えるような気がしたので、
; フィルター効果をレイヤー１（あかねがいるところ）に当てて暗くして、
; 背景も「深夜の駅」の画像にしておきます。
[filter layer="1" brightness="60"]
[bg time="1000" storage="eki_shinya.jpg"]

#akane
映像のレイヤー合成いろいろ[p]

; [layermode_movie]
; タグの名前は異なりますが、基本的な使い方は[layermode]に同じです。
; 追加で指定できるようになった属性としては、
; 
; speed   動画の再生速度。デフォルトは1
; volume  動画の音量。0～100。デフォルトは0
; loop    ループするか。true/false。デフォルトはtrue
;
; の３つ。
;
; 以下では、screen合成、color-dodge合成、multiply合成を基本として、
; いろんな映像を合成していきます。
; スクリプト側での工夫はあんまりありません。
; (基本的な使い方がほとんど。むしろ動画素材の制作に工夫が求められるところです、、、。）

[layermode_movie time="0" video="intensive.webm" mode="screen"]
;↑
コミカルな集中線[p][free_layermode time="0"]

[layermode_movie time="0" video="kirakira.webm" mode="screen"]
;↑
きらきら[p][free_layermode time="0"]

[layermode_movie time="0" video="heart.webm" mode="color-dodge" loop="false"]
;↑
心拍（ループなし）[p][free_layermode time="0"]

[layermode_movie time="0" video="heart.webm" mode="color-dodge"]
;↑
心拍（ループ）[p][free_layermode time="0"]

[layermode_movie time="0" video="heart.webm" mode="color-dodge" speed="2"]
;↑
心拍（２倍速Ver.）[p][free_layermode time="0"]

[layermode_movie time="0" video="feather.webm" mode="color-dodge" opacity="180"]
;↑
羽[p][free_layermode time="0"]

[layermode_movie time="0" video="feather.webm" mode="exclusion"]
;↑
羽＋除外合成[p][free_layermode time="0"]

[layermode_movie time="0" video="breath.webm" mode="screen" opacity="70"]
;↑
吐息[p][free_layermode time="0"]

[layermode_movie time="0" video="fire.webm" mode="color-dodge"]
;↑
火[p][free_layermode time="0"]

[layermode_movie time="0" video="fire.webm" mode="difference"]
;↑
火＋差分合成[p][free_layermode time="0"]

[layermode_movie time="0" video="snow.webm" mode="screen"]
;↑
天候：雪[p][free_layermode time="0"]

[layermode_movie time="0" video="rain.webm" mode="screen"]
;↑
天候：雨[p][free_layermode time="0"]

[layermode_movie video="particle.webm" mode="screen"]
;↑
パーティクル[p][free_layermode time="0"]

; [mtext][wait][layermode_movie]
; 演出文字を出します。
; 出した後、[wait]で軽く待ち合わせをした後、映像を合成します。
[mtext layer="2" text="ティラノスクリプト　サンプルテクニック集２" x="60" y="300" color="0xffffff" size="40" time="1600" wait="false" in_effect="bounceInLeft" in_delay="12" out_sync="true" out_effect="fadeOut"]
[wait time="300"]
[layermode_movie video="particle.webm" loop="false" mode="color-dodge" wait="false"]
[wait time="4000"]
;↑
パーティクル＋演出文字[p][free_layermode time="0"]

; [image]
; まずこの黒画像を画面いっぱいにだして、暗転させます。
[image time="1000" layer="2" storage="color/black.png" left="0" top="0" width="960" height="640"]

; [layermode_movie]
; 居合切り的な映像を合成。
[layermode_movie time=" 0" video="sword.webm" loop="false"]
; [freeimage]
; この時点で暗転用の画像は不要なので解放してあげます。
[freeimage layer="2"]
; [wait]
; ちょっと待つ。
[wait  time="4000"]
;↑
居合切り[p][free_layermode time="0"]

; [layermode][layermode_movie]
; これは色合成との組み合わせです。
; 全体をセピア調にしているのは色合成、
; ノイズを走らせているのは映像合成の効果です。
[layermode       time="0" color="0x504000" mode="color"]
[layermode_movie time="0" video="sepianoise.webm" ]
;↑
セピアノイズ[p][free_layermode time="0"]

#akane
以上です[p]

[jump storage="select.ks"]