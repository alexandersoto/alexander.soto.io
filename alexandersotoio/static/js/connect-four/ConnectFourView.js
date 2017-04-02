ConnectFourView = (function() {
    "use strict";
    
    // Constants
    var BOARD_COLOR = "#2b53ff";
    var OUTLINE_COLOR = "black";
    var EMPTY_COLOR = "white";
    var PLAYER_ONE_COLOR = "yellow";
    var PLAYER_TWO_COLOR = "red";

    function ConnectFourView(boardEl, messageEl, state) {
        this.context = boardEl.getContext("2d");
        this.width = boardEl.width;
        this.height = boardEl.height;
        this.messageEl = messageEl;
        this.state = state;

        // Add an extra row since we're need space for the piece we're dropping
        this.rows = state.board.length + 1;
        this.cols = state.board[0].length;
        
        this.rowHeight = this.height / this.rows;
        this.colWidth = this.width / this.cols;
        this.pieceRadius = this.colWidth / 3;

        this.animating = false;
    }

    ConnectFourView.prototype.draw = function () {
        this.drawMessage();

        // Clear the canvas and redraw
        this.context.clearRect(0, 0, this.width, this.height);
        this.drawBoard();
        this.drawPieceToDrop();
    };

    // Display a message so users know the state of the game
    ConnectFourView.prototype.drawMessage = function() {

        var message = "Player " + this.state.playerToMove + "'s turn";
        if (this.state.isGameOver()) {
            var winner = this.state.getWinner();
            if (winner) {
                message = "Player " + winner + " wins!";
            }
            else {
                message = "Game is a draw!";
            }
        }
        
        this.messageEl.innerText = message;
    };

    // Draws the board and the pieces
    ConnectFourView.prototype.drawBoard = function () {
        var boardHeight = this.height - this.rowHeight;

        // Draw board background
        this.context.beginPath();
        this.context.rect(0, this.rowHeight, this.width, boardHeight);
        this.context.fillStyle = BOARD_COLOR;
        this.context.fill();
        this.context.lineWidth = 3;
        this.context.strokeStyle = OUTLINE_COLOR;
        this.context.stroke();
 
        // Draw all the pieces
        // Because we leave a row for the piece we're dropping, start at row 1
        for (var row = 1; row < this.rows; row++) {
            for (var col = 0; col < this.cols; col++) {
                var color = EMPTY_COLOR;
                if (this.state.board[row - 1][col] === 1) {
                    color = PLAYER_ONE_COLOR;
                }
                else if (this.state.board[row - 1][col] === 2) {
                    color = PLAYER_TWO_COLOR;
                }
                this.drawPiece(row, col, color);
            }
        }

        if (this.state.getWinner()) {
            this.drawWinningPath(this.state.winningPath);
        }
    };

    // Draws a piece at the given row, col in the given color
    ConnectFourView.prototype.drawPiece = function(row, col, color) {
        var coordinates = this.getCoordinates(row, col);

        this.context.fillStyle = color;
        this.context.beginPath();
        this.context.arc(coordinates.x, coordinates.y, this.pieceRadius, 0, 2*Math.PI);
        this.context.fill();

        this.context.lineWidth = 2;
        this.context.strokeStyle = OUTLINE_COLOR;
        this.context.stroke();
    };

    // Translates from board row,col to canvas x,y
    ConnectFourView.prototype.getCoordinates = function(row, col) {
        var x = col * this.colWidth  + (3/2)*this.pieceRadius;
        var y = row * this.rowHeight + (3/2)*this.pieceRadius;

        return {
            x : x,
            y : y
        };
    };

    // Animates a line between the winning connect four pieces
    ConnectFourView.prototype.drawWinningPath = function(path) {

        // Only animate if we're not already doing so
        if (this.animating) {
            return;
        }
        this.animating = true;

        // y is the row and x is the col, have to add one to the row because of
        // the extra row used to draw the piece to move
        var fromCoordinates = this.getCoordinates(path[0].y + 1, path[0].x);
        var toCoordiantes = this.getCoordinates(path[3].y + 1, path[3].x);

        var startX = fromCoordinates.x;
        var startY = fromCoordinates.y;
        var endX = toCoordiantes.x;
        var endY = toCoordiantes.y;
        var percentComplete = 0;

        // These determine the length of the animation
        var percentPerInterval = 0.03;
        var intervalMs = 5;

        // Use set interval to animate the winning line
        var animation = window.setInterval(function() {
            if (percentComplete > 1) {
                window.clearInterval(animation);
                this.animating = false;
                return;
            }

            percentComplete += percentPerInterval;

            this.draw();
            this.context.beginPath();
            this.context.lineWidth = 4;
            this.context.strokeStyle = OUTLINE_COLOR;
            this.context.moveTo(startX, startY);

            // linear interpolation
            this.context.lineTo(startX + (endX - startX) * percentComplete,
                                startY + (endY - startY) * percentComplete);
            this.context.stroke();
        }.bind(this), intervalMs);
    };

    // Draws the piece the player is about to drop onto the board
    ConnectFourView.prototype.drawPieceToDrop = function() {
        var color = this.state.playerToMove === 1 ? PLAYER_ONE_COLOR : PLAYER_TWO_COLOR;
        this.drawPiece(0, this.state.pieceToDropCol, color);
    };

    return ConnectFourView;
})();
