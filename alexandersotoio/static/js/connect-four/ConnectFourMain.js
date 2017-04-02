(function() {
    "use strict";

    // This is broken up into three files. This is the controller and deals
    // with initalizing the game and getting user input. The other files
    // are the game state information, and the view which draws the board
    // using a canvas element

    // Constants
    var BOARD_ID = "connectFourBoard";
    var MESSAGE_ID = "message";
    var NEW_GAME_ID = "newGame";

    // Get elements we'll be using (board, button)
    var boardEl = document.getElementById(BOARD_ID);
    var newGameEl = document.getElementById(NEW_GAME_ID);
    var messageEl = document.getElementById(MESSAGE_ID);

    // Create the state
    var state = new ConnectFourState();

    // Create the graphics
    var view = new ConnectFourView(boardEl, messageEl, state);

    /*
    // Kept for reference. This is what I used to test
    // if the controller / state worked together, before I started
    // working on the graphics aspect of the game. Looked decent in 
    // chrome's console.
    var view = {};
    view.draw = function() {
        var i;
        if (state.winningPath) {
            var winningPoint = state.winningPath[0];
            var winningPlayer = state.board[winningPoint.y][winningPoint.x];
            console.log("Player " + winningPlayer + " wins!");
        }
        else {
            console.log("No winner yet");
        }

        console.log("Player " + state.playerToMove + "'s turn");
        var drop = " ";
        
        var spaces = state.pieceToDropPos * 3;
        for (i = 0; i < spaces; i++) {
            drop += " ";
        }
        drop += state.playerToMove;
        console.log(drop);

        for (i = 0; i < state.board.length; i++) {
            console.log(state.board[i]);
        }
        console.log("*********************");
    };
    */

    // Controller is simple, just respond to keydowns and button press
    document.onkeydown = function(e) {
        
        // keycode <-> key mappings
        var SPACE = 32;
        var LEFT = 37;
        var RIGHT = 39;

        switch(e.keyCode) {
            case LEFT:
                state.moveLeft();
                view.draw();
                break;
            case RIGHT:
                state.moveRight();
                view.draw();
                break;
            case SPACE:
                state.dropPiece();
                view.draw();
                break;
        }
    };

    // Start a new game when pressed
    newGameEl.onclick = function() {

        // Confirm reset if game is still going
        var startNewGame = state.isGameOver() ? true : window.confirm("Game in progress, do you want to start a new one?");
        
        if (startNewGame) {
            state.newGame();
            view.draw();
        }
        this.blur();
    };

    // Init the game
    state.newGame();
    view.draw();
})();
