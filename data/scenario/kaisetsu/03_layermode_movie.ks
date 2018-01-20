
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

#akane:happy
レイヤーモード機能は、色や画像だけでなく[<y]映像[>]を合成することもできるよ。[p]
#akane:default
タグ名はちょっと変わって［layermode_movie］![p]
説明するより、まずは見てもらおうかなー！[p]
ちょっと場所を変えるよ。[p]

; [filter]
; 暗い背景に馴染ませるため、あかねを暗くします。
[filter layer="1" brightness="60"]

; [bg]
; 背景を駅の画像に切り替えます。
[bg time="1000" storage="eki_shinya.jpg"]

#akane
いやー、最近寒くなってきたね。

; [layermode_movie]
; 効果：白い息
[layermode_movie time="1000" video="breath.webm" mode="screen" opacity="70"]
[p]

#akane
だってほら、息が白いもの。はーっ。[p]

; [layermode_movie]
; 天候：雪
[layermode_movie time="2000" video="snow.webm" mode="screen"]

#akane
わっ！　雪まで降ってきた！[p]
こんな寒い日は…………。[p]

; [free_layermode]
; 映像も、画像や色のときと同様にこのタグでレイヤーを解放できます。
[free_layermode  time="1000" wait="false"]

; [layermode_movie]
; 効果：炎
[layermode_movie time="1000" video="fire.webm" mode="color-dodge"]

#akane:happy
やっぱりたき火だよねっ!![p]
#akane:doki
え？　危ない？[p]
じゃあ……。[p]

[free_layermode  time="1000" wait="false"]
; [layermode_movie]
; 天候：雨
[layermode_movie time="1000" video="rain.webm" mode="screen"]

#akane
雨に消火してもらおーっと。[p]
……と、まあ……。[p]

[free_layermode  time="1000" wait="false"]
[wait            time="1000"]

#akane:happy
これがレイヤーモードによる映像の合成だよ！[p]
#akane:default
すごいでしょー。[p]
#akane:default
映像の形式はogv、mp4、webmなどに対応できるけど、PCゲームの場合は[<y]webm[>]推奨です。[p]
webmってあんまり聞かない形式かもだけど……無料で使えるオンラインの変換器もあるから、[p]
チェックしてみてね。[p]
ちなみに画面サイズと異なるサイズの映像を使用すると、映像が画面サイズに[<y]リサイズ[>]されます。[p]
設定項目として、音量、ループするかしないか、再生速度、透明度などがあります……。[p]
#akane:sad
……ふーっ、一気に説明して、疲れた……。[p]
#akane:default
あなたも疲れた？[p]
あ、合成方法について説明してなかったね。[p]
合成方法は、色や画像のときと同じものが選べるよ。[p]
だから、同じ映像でも、合成方法を変えることで全然違う雰囲気にできるわ。[p]

[free_layermode  time="1000" wait="false"]
; [layermode_movie]
; 効果：炎
[layermode_movie time="1000" video="fire.webm" mode="color-dodge"]

#akane
たとえばさっきの炎。[p]
これは、[<y]color-dodge（覆い焼きカラー）[>]という方法で合成してるんだけど、[p]

[free_layermode  time="1000" wait="false"]
; [layermode_movie]
; 効果：炎＋差分合成
[layermode_movie time="1000" video="fire.webm" mode="difference"]

#akane
これを[<y]difference（差分）[>]で合成すると、だいぶ違った雰囲気になるよ！[p]

[free_layermode  time="1000" wait="false"]
; [layermode_movie]
; 効果：炎＋ハードライト合成
[layermode_movie time="1000" video="fire.webm" mode="hard-light"]

#akane
[<y]hard-light（ハードライト）[>]もまた違う。[p]

[free_layermode  time="1000" wait="false"]

#akane:happy
ね！[p]
#akane:default
それから、演出文字との組み合わせもアリだね。[p]

[free_layermode time="0" wait="false"]
; [layermode_movie]
; 効果：パーティクル
[layermode_movie video="particle.webm" mode="screen"]

#akane
こういうのを用意しておいて……。[p]

[free_layermode time="0" wait="false"]
; [mtext][wait]
; 左からぶわっと流れる文字を出します。
; [wait]で時間を調整して、映像と待ち合わせします。
[mtext layer="2" text="ティラノスクリプト　サンプルテクニック集２" x="60" y="300" color="0xffffff" size="40" time="1600" wait="false" in_effect="bounceInLeft" in_delay="12" out_sync="true" out_effect="fadeOut"]
[wait time="300"]
; [layermode_movie]
[layermode_movie video="particle.webm" loop="false" mode="color-dodge" wait="false"]
[wait time="4000"]
[free_layermode]

#akane
こうしてみるとかね。[p]
いろいろできそうでしょ？[p]
居合切りみたいな表現もできるわ。[p]

; [image]
; 黒色画像を画面いっぱいに引き伸ばして、それを1000ミリ秒かけて描画します。
[image time="1000" layer="2" storage="color/black.png" left="0" top="0" width="960" height="640"]
; [layermode_movie]
; 画面が暗く成りきったところでsword.webmを再生開始します。
[layermode_movie time=" 0" video="sword.webm"]
; [freeimage]
; 再生開始したら暗転用の画像はもういらないので、解放します。
[freeimage layer="2"]
[wait  time="4000"]

#akane
どうかな。[p]

[free_layermode time="1000" wait="false"]
[wait time="1000"]
; [layermode]
; 効果：セピア（これは色の合成。これで画面全体をセピア調にしている）
[layermode wait="false" time="2000" color="0x504000" mode="color"]
; [layermode_movie]
; 効果：フィルムノイズ
[layermode_movie        time="2000" video="sepianoise.webm" ]

#akane
こんな感じで古い映画みたいにもできるね。[p]
ティラノスクリプトは、［anim］や［kanim］でものを動かしたり……。[p]
GIF画像を使ったりLive2Dプラグインを使ったりすることで、アニメーション表現が可能だけど、[p]
複雑なアニメーションやエフェクトなんかは、[r]レイヤーモードで表現すると良いと思うよ。[p]
#akane:happy
じゃあ、みんなも映像合成、使ってみてね～。[p]
#akane:default
インターネット上では、映像素材がいっぱい配布されてるから、それを利用するといいよー!![p]
#akane:doki
ちなみに、このサンプルテクニック集に入ってる映像素材は全部私が作ったやつだから、[p]
使えそうなのがあったら使っていいからねっ。[p]

[jump storage="select.ks"]