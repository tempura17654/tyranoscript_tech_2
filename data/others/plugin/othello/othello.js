(function () {
	// 定数定義
	var EMPTY = 0; // 何もない
	var WHITE = 1; // 白石がある
	var BLACK = 2; // 黒石がある
	var WALL  = 3; // 壁がある
	var INFINITE = 9999; // 無限
	// ↖↑↗←→↙↓↘の8方向の定数（上の一次元配列におけるインデックスの移動量）
	var DIR   = [-11, -10, -9, -1, 1, 9, 10, 11];
	// 重みづけ
	var WEIGHT = [
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		 0, 30,-12,  0, -1, -1,  0,-12, 30,  0,
		 0,-12,-15, -3, -3, -3, -3,-15,-12,  0,
		 0,  0, -3,  0, -1, -1,  0, -3,  0,  0,
		 0, -1, -3, -1, -1, -1, -1, -3, -1,  0,
		 0, -1, -3, -1, -1, -1, -1, -3, -1,  0,
		 0,  0, -3,  0, -1, -1,  0, -3,  0,  0,
		 0,-12,-15, -3, -3, -3, -3,-15,-12,  0,
		 0, 30,-12,  0, -1, -1,  0,-12, 30,  0,
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	];
	// 依存性
	var DEPEND = [
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		 0,  0, 11,  0,  0,  0,  0, 18,  0,  0,
		 0, 11, 11, 11,  0,  0, 18, 18, 18,  0,
		 0,  0, 11,  0,  0,  0,  0, 18,  0,  0,
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
		 0,  0, 81,  0,  0,  0,  0, 88,  0,  0,
		 0, 81, 81, 81,  0,  0, 88, 88, 88,  0,
		 0,  0, 81,  0,  0,  0,  0, 88,  0,  0,
		 0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	];
	// OthelloBoardコンストラクタ
	window.OthelloBoard = function (board, pos, col) {
		// ボードの状態（一次元配列）
		this.board = board;
		if (typeof pos !== "undefined" && typeof col !== "undefined") {
			this.putStone(pos, col);
		};
		return this;
	};
	// OthelloBoardプロトタイプ
	var OthelloBoardProto = {
		initBoard: function () {
			this.board = [
				3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 0, 0, 0, 1, 2, 0, 0, 0, 3,
				3, 0, 0, 0, 2, 1, 0, 0, 0, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
				3, 3, 3, 3, 3, 3, 3, 3, 3, 3
			];
		},
		// ゲームは終わった？T/F
		isEnd: function () {
			// 白も黒も置けないならゲーム終了
			return !this.canPutWhite() && !this.canPutBlack();
		},
		getWinner: function () {
			var white_num = OTHELLO.getPieceNumWhite();
			var black_num = OTHELLO.getPieceNumBlack();
			if (white_num == black_num) return 'draw';
			else if (white_num > black_num) return 'white';
			else return 'black';
		},
		// colは置ける？T/F
		canPut: function (col) {
			// colの合法手が1手以上あるか？
			var ret = this.getAcceptedPos(col);
			return ret.length > 0;
		},
		// 白はおける？T/F
		canPutWhite: function () {
			return this.canPut(WHITE);
		},
		// 黒はおける？T/F
		canPutBlack: function () {
			return this.canPut(BLACK);
		},
		// self_colが合法的に置ける場所を配列で取得する
		getAcceptedPos: function (self_col) {
			var pos, col, ret, flip_pos;
			ret = [];
			// すべての場所について
			for (pos = 0; pos < this.board.length; pos++) {
				col = this.board[pos];
				// そこが空のときだけチェックすればいい
				if (col == EMPTY) {
					// 挟める場所が1個以上あればretに放り込んでおく
					flip_pos = this.getFlipPos(pos, self_col);
					if (flip_pos.length > 0) {
						ret.push(pos);
					};
				};
			};
			return ret;
		},
		// colの石を数える
		getPieceNum: function (col) {
			var pos, ret;
			ret = 0;
			// すべての場所についてcolと一致すればインクリメント
			for (pos = 0; pos < this.board.length; pos++) {
				if (this.board[pos] == col) {
					ret++;
				};
			};
			return ret;
		},
		// 白の石を数える
		getPieceNumWhite: function () {
			return this.getPieceNum(WHITE);
		},
		// 黒の石を数える
		getPieceNumBlack: function () {
			return this.getPieceNum(BLACK);
		},
		// posにcolの石を置く
		putStone: function (pos, col) {
			var pos, i;
			// そこに置いたときに挟める場所を配列で取得
			poses = this.getFlipPos(pos, col);
			// その場所を全部colで上書き
			for (i = 0; i < poses.length; i++) {
				this.board[poses[i]] = col;
			};
			// 最後に、置いた場所そのものも上書き
			this.board[pos] = col;
		},
		// posにself_colの石を置いたときに挟める場所を配列で取得
		// そこに置いても挟めない、という場合は空の配列が返ってくる
		getFlipPos: function (pos, self_col) {
			var col, dir, pos, ret, flip_pos;
			// そこの状態を取得
			col = this.board[pos];
			// 空じゃなかったら置けないのだから挟める場所はない
			if (col != EMPTY) {
				return [];
			}
			// 空のときだけチェックしよう
			else {
				ret = [];
				// 8方向すべてについて
				for (var i = 0; i < DIR.length; i++) {
					// getFlipPosOneDirで場所を配列で取得してretに連結
					dir = DIR[i];
					flip_pos = this.getFlipPosOneDir(pos, self_col, dir);
					ret = ret.concat(flip_pos);
				};
				return ret;
			};
		},
		// posにself_colの石を置いたときに【dir方向に】挟める場所を配列で取得
		// そこに置いても挟めない、という場合は空の配列が返ってくる
		getFlipPosOneDir: function (pos, self_col, dir) {
			var ret, col, enemy_col;
			ret = [];
			// 敵の色を確定
			enemy_col = (self_col == WHITE) ? BLACK : WHITE;
			// その方向にひとつ進んでみる
			pos += dir;
			col = this.board[pos];
			// そこが敵の色でなければ挟めるわけはない
			if (col != enemy_col) {
				return [];
			}
			// 敵の石だったなら挟める可能性があるからチェックしよう
			else {
				// とりあえずret配列に今の場所をプッシュ
				ret.push(pos);
				// 結果がわかるまでwhileループ
				while (true) {
					// その方向にひとつ進んでみる
					pos += dir;
					col = this.board[pos];
					// 自分の色だったなら挟めることが確定
					if (col == self_col) {
						return ret;
					}
					// まだ敵の色が続いているなら結果は保留、ループしよう
					else if (col == enemy_col) {
						ret.push(pos);
					}
					// 空または壁ならば挟めないことが確定
					else {
						return [];
					};
				};
			};
		},
		
		
		
		evalPosition: function (self_col) {
			var enemy_col = (self_col == 2) ? 1 : 2;
			var enemy_num = 0;
			var self_num  = 0;
			for (var i = 0; i < this.board.length; i++) {
				switch (this.board[i]) {
				case enemy_col:
					enemy_num += WEIGHT[i];
					break;
				case self_col:
					self_num += WEIGHT[i];
					break;
				};
			};
			return {
				score: self_num - enemy_num + Math.random()
			};
		},
		
		
		
		
		
		eval: function (self_col) {
			var enemy_col = (self_col == 2) ? 1 : 2;
			var enemy_score = 0;
			var self_score  = 0;
			var enemy_num   = 0;
			var self_num    = 0;
			for (var i = 0; i < this.board.length; i++) {
				switch (this.board[i]) {
				case enemy_col:
					enemy_num++;
					if (!DEPEND[i] || this.board[DEPEND[i]] == EMPTY) enemy_score += WEIGHT[i];
					break;
				case self_col:
					self_num++;
					if (!DEPEND[i] || this.board[DEPEND[i]] == EMPTY)  self_score += WEIGHT[i];
					break;
				};
			};
			var score = self_score - enemy_score + Math.random();
			var num = enemy_num + self_num - 25;
			var dif = self_num - enemy_num;
			score += num / 14 * dif;
			return {
				score: score
			};
		},
		
		
		
		
		
		evalNumber: function (self_col) {
			var enemy_col = (self_col == 2) ? 1 : 2;
			var enemy_num = 0;
			var self_num  = 0;
			for (var i = 0; i < this.board.length; i++) {
				switch (this.board[i]) {
				case enemy_col:
					enemy_num++;
					break;
				case self_col:
					self_num++;
					break;
				};
			};
			return {
				score: self_num - enemy_num + Math.random()
			};
		},
		
		
		
		
		log: function () {
			console.log(this.board.slice( 0, 10));
			console.log(this.board.slice(10, 20));
			console.log(this.board.slice(20, 30));
			console.log(this.board.slice(30, 40));
			console.log(this.board.slice(40, 50));
			console.log(this.board.slice(50, 60));
			console.log(this.board.slice(60, 70));
			console.log(this.board.slice(70, 80));
			console.log(this.board.slice(80, 90));
			console.log(this.board.slice(90,100));
		},
		
		
		
		minMax: function (ob, depth, self_col, thinker_col) {
			
			// 末端深さに達したならば
			if (depth == 0) {
				var ret = ob.eval(thinker_col);
				ob = null;
				return ret;
			};
			
			// 敵の色を特定
			var enemy_col = (self_col == 2) ? 1 : 2;
			
			// 合法手の生成
			var self_pos  = ob.getAcceptedPos(self_col);
			
			// 合法手がなければ
			if (self_pos.length == 0) {
				
				// 敵の合法手を生成
				var enemy_pos = ob.getAcceptedPos(enemy_col);
				
				// 敵の合法手もなければそれが末端
				if (enemy_pos.length == 0) {
					var self_num  = ob.getPieceNum(self_col);
					var enemy_num = ob.getPieceNum(enemy_col);
					var win_col = (self_num > enemy_num) ? self_col : (self_num == enemy_num) ? 0 : enemy_col;
					var score = (win_col == 0) ? 0 : (win_col == thinker_col) ? INFINITE : -INFINITE;
					return { score : score };
				}
				// 敵には合法手があるなら
				else {
					// 深さはそのままに、手番だけ入れ替えて探索を続行
					return ob.minMax(ob, depth, (self_col == 2) ? 1 : 2, thinker_col);
				};
			};
			
			// ここで手番側に合法手があることが確定する
			
			// Thinkerの番ならbestを取る
			if (self_col == thinker_col) {
				var best = {
					pos: self_pos[0],
					score: -INFINITE
				};
				// すべての合法手について
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMax(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score > best.score) {
						best.pos = pos;
						best.score = score;
					};
				};
				return best;
			}
			
			// Thinkerの番でなければworstを取る
			else {
				var worst = {
					pos: self_pos[0],
					score: INFINITE
				};
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMax(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score < worst.score) {
						worst.pos = pos;
						worst.score = score;
					};
				};
				return worst;
			};
		},
		
		
		
		
		
		
		
		
		
		
		minMaxWithNumber: function (ob, depth, self_col, thinker_col) {
			
			// 末端深さに達したならば
			if (depth == 0) {
				var ret = ob.evalNumber(thinker_col);
				ob = null;
				return ret;
			};
			
			// 敵の色を特定
			var enemy_col = (self_col == 2) ? 1 : 2;
			
			// 合法手の生成
			var self_pos  = ob.getAcceptedPos(self_col);
			
			// 合法手がなければ
			if (self_pos.length == 0) {
				
				// 敵の合法手を生成
				var enemy_pos = ob.getAcceptedPos(enemy_col);
				
				// 敵の合法手もなければそれが末端
				if (enemy_pos.length == 0) {
					var self_num  = ob.getPieceNum(self_col);
					var enemy_num = ob.getPieceNum(enemy_col);
					var win_col = (self_num > enemy_num) ? self_col : (self_num == enemy_num) ? 0 : enemy_col;
					var score = (win_col == 0) ? 0 : (win_col == thinker_col) ? INFINITE : -INFINITE;
					return { score : score };
				}
				// 敵には合法手があるなら
				else {
					// 深さはそのままに、手番だけ入れ替えて探索を続行
					return ob.minMaxWithNumber(ob, depth, (self_col == 2) ? 1 : 2, thinker_col);
				};
			};
			
			// ここで手番側に合法手があることが確定する
			
			// Thinkerの番ならbestを取る
			if (self_col == thinker_col) {
				var best = {
					pos: self_pos[0],
					score: -INFINITE
				};
				// すべての合法手について
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMaxWithNumber(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score > best.score) {
						best.pos = pos;
						best.score = score;
					};
				};
				return best;
			}
			
			// Thinkerの番でなければworstを取る
			else {
				var worst = {
					pos: self_pos[0],
					score: INFINITE
				};
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMaxWithNumber(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score < worst.score) {
						worst.pos = pos;
						worst.score = score;
					};
				};
				return worst;
			};
		},
		
		
		
		
		minMaxWithPosition: function (ob, depth, self_col, thinker_col) {
			
			// 末端深さに達したならば
			if (depth == 0) {
				var ret = ob.evalPosition(thinker_col);
				ob = null;
				return ret;
			};
			
			// 敵の色を特定
			var enemy_col = (self_col == 2) ? 1 : 2;
			
			// 合法手の生成
			var self_pos  = ob.getAcceptedPos(self_col);
			
			// 合法手がなければ
			if (self_pos.length == 0) {
				
				// 敵の合法手を生成
				var enemy_pos = ob.getAcceptedPos(enemy_col);
				
				// 敵の合法手もなければそれが末端
				if (enemy_pos.length == 0) {
					var self_num  = ob.getPieceNum(self_col);
					var enemy_num = ob.getPieceNum(enemy_col);
					var win_col = (self_num > enemy_num) ? self_col : (self_num == enemy_num) ? 0 : enemy_col;
					var score = (win_col == 0) ? 0 : (win_col == thinker_col) ? INFINITE : -INFINITE;
					return { score : score };
				}
				// 敵には合法手があるなら
				else {
					// 深さはそのままに、手番だけ入れ替えて探索を続行
					return ob.minMaxWithPosition(ob, depth, (self_col == 2) ? 1 : 2, thinker_col);
				};
			};
			
			// ここで手番側に合法手があることが確定する
			
			// Thinkerの番ならbestを取る
			if (self_col == thinker_col) {
				var best = {
					pos: self_pos[0],
					score: -INFINITE
				};
				// すべての合法手について
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMaxWithPosition(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score > best.score) {
						best.pos = pos;
						best.score = score;
					};
				};
				return best;
			}
			
			// Thinkerの番でなければworstを取る
			else {
				var worst = {
					pos: self_pos[0],
					score: INFINITE
				};
				for (var i = 0; i < self_pos.length; i++) {
					var pos = self_pos[i];
					// その手を指した後のボードを作成する
					var _ob = new OthelloBoard(ob.board.concat(), pos, self_col);
					var score = ob.minMaxWithPosition(_ob, depth - 1, (self_col == 2) ? 1 : 2, thinker_col).score;
					if (score < worst.score) {
						worst.pos = pos;
						worst.score = score;
					};
				};
				return worst;
			};
		},
		
		
		
		
		
		
		test: {}
	};
	OthelloBoard.prototype = OthelloBoardProto;
	window.OTHELLO = new OthelloBoard();
	OTHELLO.initBoard();
	//OTHELLO.worker = new Worker("./data/others/plugin/othello/think.js");
}());