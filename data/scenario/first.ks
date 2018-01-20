
; == first.ks ==============================================

; ゲームを起動したとき、一番最初に読み込まれるシナリオファイルです。
; このシナリオファイルは、プラグインの読み込みやマクロの定義などの
;《ゲーム全体で必要な初期設定》を行うために使います。
; 初期設定が終わったら、[jump]タグでタイトル画面などに移行しましょう。
; (なお、このシナリオファイルのファイル名を変えてはいけません。)
;
; ==========================================================

; [title]
; タイトルバーに表示されるテキストを変更します。
[title name="ティラノスクリプト｜サンプルテクニック集２"]

; [call]×3
; [call]タグは、別のラベルにいったんジャンプして、
; ジャンプ先で[return]タグにぶつかった時点で戻ってくる、という機能を持ったタグです。
; そのタグを、ここでは、いろんな設定を行うラベルにそれぞれジャンプして帰ってくるために使っています。
;
; ――[call]タグなんて使わずに、その『いろんな設定』を直接ここに書けばええやんけ!!
;
; と思われる方もおられるかもしれません。
; まったくその通りです。それでもいいです。
; が、処理を別のラベルに書いておいて、それを[call]タグで呼ぶ……
; という形にしておいたほうが、のちのち見やすいコードになりやすいです。
[call target="*Sub_SetLayer"        ]
[call target="*Sub_SetPlugin"       ]
[call target="*Sub_SetCharacter"    ]

; [jump]
; ジャンプします。
[jump storage="title.ks"]

[s]



















;　～以下設定用のラベル～



; ----------------------------------------------------------
*Sub_SetLayer
; ----------------------------------------------------------



; レイヤーの表示非表示などを設定するラベルです。
; このラベルは、[call]タグによってジャンプしてくるラベル
; (このようなラベルをサブルーチンと言います。また、サブルーチンにジャンプすることを
;「サブルーチンを呼ぶ」とか「サブルーチンをコールする」とか言います。）
; ですので、終わったら[return]タグでもとの場所に帰ります。



; [layopt][hidemenubutton]
; すべてのメッセージレイヤーとメニューボタンを隠します。
; (なお、メニューボタンについては、Config.tjsで設定を変更することで、
; first.ksで[hidemenubutton]を使わずとも、初期状態を非表示にすることができます。
; configVisible … 初期状態でメニューボタンを表示するか？)
[layopt layer="message" visible="false"]
[hidemenubutton]

; [layopt]
; 逆に通常レイヤー０,１,２は表示してあげます。
; (初期状態では非表示なので注意が必要。
; モノが映らない!!と思ったらレイヤー自体が非表示になっているケースは多いです。)
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[layopt layer="2" visible="true"]

; [return]
; [call]タグで呼ばれたところに帰ります。
[return]



; ----------------------------------------------------------
*Sub_SetPlugin
; ----------------------------------------------------------



; このラベルはプラグインやライブラリの読み込みを行うサブルーチンです。



; [call]
; ティラノスクリプト標準ライブラリをコールします。
; これをコールすることで【コンフィグ】【ＣＧ・回想モード】
; などを扱うことができるようになります。
;【ＣＧ・回想モード】については以下の公式解説ページを参照してください。
; http://tyrano.jp/usage/tech/cg
[call storage="tyrano.ks"]

; [call]
; このサンプルテクニック集で使うマクロを
; すべて定義するためのシナリオファイルを呼び出します。
; マクロについては以下の公式解説ページもご参照ください。
; http://tyrano.jp/usage/tech/macro
[call storage="macro.ks"]

; [plugin]
; オセロを遊ぶためのプラグインを読み込みます。
[plugin name="othello"]

; [loadcss]
; 独自フォントを使用するためのcssファイルを読み込みます。
[loadcss file="data/others/font.css"]

; [loadcss]
; 独自アニメーションを使用するためのcssファイルを読み込みます。
[loadcss file="data/others/animate.css"]

; [return]
; 帰ります。
[return]



; ----------------------------------------------------------
*Sub_SetCharacter
; ----------------------------------------------------------



; キャラクターの定義を行うサブルーチンラベルです。



; [chara_new][chara_face]
; あかねを定義しています。
[chara_new  name="akane"  jname="あかね" storage="./chara/akane/normal.png"]
[chara_face name="akane"   face="angry"  storage="chara/akane/angry.png"   ]
[chara_face name="akane"   face="doki"   storage="chara/akane/doki.png"    ]
[chara_face name="akane"   face="happy"  storage="chara/akane/happy.png"   ]
[chara_face name="akane"   face="sad"    storage="chara/akane/sad.png"     ]

; [chara_new][chara_face]
; やまとを定義しています。
[chara_new  name="yamato" jname="やまと" storage="chara/yamato/normal.png" ]
[chara_face name="yamato"  face="angry"  storage="chara/yamato/angry.png"  ]
[chara_face name="yamato"  face="happy"  storage="chara/yamato/happy.png"  ]
[chara_face name="yamato"  face="sad"    storage="chara/yamato/sad.png"    ]
[chara_face name="yamato"  face="tohoho" storage="chara/yamato/tohoho.png" ]

; [chara_new][chara_face]
; メッセージウィンドウにキャラクターの顔を出すために、
; 全キャラクターの全フェイスをキャラクターネーム「pickup」にぶち込みます。
; その際、フェイス名を「（キャラクターの名前）/（そのキャラクターのフェイス）」というふうに指定します。
; こう指定することで、通常立ち絵との連動フェイス変更が可能になります。
[chara_new  name="pickup" jname=""               storage="color/empty.png"         ]
[chara_face name="pickup"  face="akane/default"  storage="chara/akane/normal.png"  ]
[chara_face name="pickup"  face="akane/angry"    storage="chara/akane/angry.png"   ]
[chara_face name="pickup"  face="akane/doki"     storage="chara/akane/doki.png"    ]
[chara_face name="pickup"  face="akane/happy"    storage="chara/akane/happy.png"   ]
[chara_face name="pickup"  face="akane/sad"      storage="chara/akane/sad.png"     ]
[chara_face name="pickup"  face="yamato/default" storage="chara/yamato/normal.png" ]
[chara_face name="pickup"  face="yamato/angry"   storage="chara/yamato/angry.png"  ]
[chara_face name="pickup"  face="yamato/happy"   storage="chara/yamato/happy.png"  ]
[chara_face name="pickup"  face="yamato/sad"     storage="chara/yamato/sad.png"    ]
[chara_face name="pickup"  face="yamato/tohoho"  storage="chara/yamato/tohoho.png" ]

; [chara_config]
; 表情の切り替え時間を500ミリ秒にします。
[chara_config time="500"]

; [return]
; 帰ります。
[return]