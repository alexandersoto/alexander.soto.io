ConnectFourState = (function() {
    "use strict";

    // CONSTANTS
    var COLS = 7;
    var ROWS = 6;

    // Constructor
    function ConnectFourState() {
        this.newGame();
    }

    // Resets the state to a new game
    ConnectFourState.prototype.newGame = function() {

        // 2D array that reprsents the pieces.
        // 0 is empty, 1 is player 1, 2 is player 2
        this.board = makeBoard(ROWS, COLS);

        // Either 1 or 2, which is the player that will move next
        this.playerToMove = 1;

        // 0 to COLS-1, this is where the dropped piece will go
        // Start in the center position
        this.pieceToDropCol = Math.floor(COLS/2);

        this.winningPath = null;
    };

    // Return a rows x cols 2D array with zeros
    function makeBoard(rows, cols) {
        var board = [];
        for (var i = 0; i < rows; i++) {
            board.push([]);
            for (var j = 0; j < cols; j++) {
                board[i].push(0);
            }
        }

        return board;
    }


    // Returns null if no winner, if winner returns object with:
    // player: 1 or 2 (player that won)
    // winningPath: [] (array with the (x, y) points of the win)
    ConnectFourState.prototype.setWinningPath = function() {

        // Once we have a winning path, no need to update
        if (this.winningPath) {
            return;
        }

        var directions = [
            {x:1, y:0}, // Horizontal
            {x:0, y:1}, // Vertical
            {x:1, y:1}, // Diagonal, Bottom Left to Top Right
            {x:1, y:-1} // Diagonal, Top Left to Bottom Right
        ];

        // Check every direction for a winning path
        for (var i = 0; i < directions.length; i++) {
            var path = isConnectedBoard(this.board, directions[i].x, directions[i].y);
            if (path) {
                this.winningPath = path;
                return;
            }
        }

        // None found
    };
   
    // Given a direction, return the path if there are
    // four of the same piece in a row
    function isConnectedBoard(board, deltaX, deltaY) {
        var rows = board.length;
        var cols = board[0].length;

        // For every point, check if there are four in a row
        for (var row = 0; row < rows; row++) {
            for (var col = 0; col < cols; col++) {
                var path = checkFourInARow(board, col, row, deltaX, deltaY);
                if (path) {
                    return path;
                }
            }
        }

        // No path found
        return null;
    }

    // Check if four in a row exists in the given direction,
    // from the given x, y starting point, and return the path
    function checkFourInARow(board, x, y, deltaX, deltaY) {

        // Can't have four in a row if the first is empty
        var pieceToMatch = board[y][x];
        if (pieceToMatch === 0) {
            return null;
        }

        // Path begins at the given starting position
        var path = [{x:x, y:y}];

        // Check remaining 3 slots
        for (var k = 1; k <= 3; k++) {

            // Check the next slot in the given direction
            x += deltaX;
            y += deltaY;

            // If we're out of bounds, no connect four
            if (x >= board[0].length || y >= board.length || x < 0 || y < 0) {
                return null;
            }

            // Continue if the piece matches
            else if (board[y][x] === pieceToMatch) {
                path.push({x:x, y:y});
            }

            // No connect four if the pieces don't match
            else {
                return null;
            }
        }
        
        return path;
    }

    // Returns true if it's a draw
    ConnectFourState.prototype.isDraw = function() {
        return !this.winningPath && this.isFull();
    };

    // Returns true if the game is over
    ConnectFourState.prototype.isGameOver = function() {
        return this.winningPath || this.isDraw();
    };

    // Returns true if the board is filled
    ConnectFourState.prototype.isFull = function () {
        for (var i = 0; i < this.board.length; i++) {
            for (var j = 0; j < this.board[0].length; j++) {
                if (this.board[i][j] === 0) {
                    return false;
                }
            }
        }
        return true;
    };

    // Returns the winning player
    ConnectFourState.prototype.getWinner = function() {
        this.setWinningPath();
        if (this.winningPath) {
            var piece = this.winningPath[0];
            return this.board[piece.y][piece.x];
        }
        return null;
    };

    // Piece to drop moved left
    ConnectFourState.prototype.moveLeft = function() {
        this.pieceToDropCol = Math.max(0, this.pieceToDropCol - 1);
    };

    // Piece to drop moved right
    ConnectFourState.prototype.moveRight = function() {
        var cols = this.board[0].length;
        this.pieceToDropCol = Math.min(cols - 1, this.pieceToDropCol + 1);
    };

    // Piece dropped, update the board
    ConnectFourState.prototype.dropPiece = function() {
        
        // Don't drop a piece if the game is over
        if (this.isGameOver()) {
            return;
        }

        // Add the piece to the largest non empty row, at col pieceToDropCol        
        var col = this.pieceToDropCol;
        
        // Find the largest non empty row
        for (var i = this.board.length - 1; i >= 0; i--) {
            if (this.board[i][col] === 0) {
                break;
            }
        }

        // i is now the row to drop the piece to
        // Can only drop a new piece on a non-filled column
        if (i >= 0) {
            this.board[i][col] = this.playerToMove;
            this.switchPlayer();
            this.setWinningPath();
        }
    };

    ConnectFourState.prototype.switchPlayer = function() {
        this.playerToMove = this.playerToMove === 1 ? 2 : 1;
    };

    return ConnectFourState;
})();
