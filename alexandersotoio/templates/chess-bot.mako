###############################################################################
## Chess Bot
###############################################################################

<%inherit file="/site.mako"/>

<%block name="title"> Chess Bot </%block>

<%block name="content">

<div class="container project-container">
  <div class="row">
    <div class="col-md-12">
      <h2> Chess Bot </h2>
      <p> This is a full chess program with a chess engine to play against. It supports both human vs. computer and computer vs. computer matches. The source code can be found on <a href="https://github.com/alexandersoto/chess-bot">GitHub</a>.</p>

      <p><img class="img-responsive" src="${request.static_url('alexandersotoio:static/images/chess.png')}"></p>

      <h3> Installation Instructions </h3>
      <p> <a href="${request.static_url('alexandersotoio:static/chess.jar')}">Download chess.jar</a>. To run the chess program, double click on "chess.jar" and it should launch. It requires <a href="http://www.java.com/en/">Java</a> 6 or later installed. Most computers have a recent version of Java installed. 
      <h4> Issues on Windows </h4>
      <p> First, <a href="https://www.java.com/verify/">verify your Java installation</a>. If that works, right click on "chess.jar", click on "open with", and select Java Platform SE binary (or a similarly named Java program).</p>
      <h4> Issues on Mac </h4>
      <p> First, <a href="https://www.java.com/verify/">verify your Java installation</a>. If double clicking on "chess.jar" says: <code>"chess.jar" can't be opened because it is from an unidentifed developer.</code> You have to go to spotlight and search for "System Preferences". Click on "Security and Privacy". You'll see the following: <code>"chess.jar" was blocked from opening because it is not from an identified developer.</code> Click on "Open Anyway". Then click on "Open".</p>

      <p>If that doesn't work, go to spotlight and search for "Terminal". Navigate to where you saved "chess.jar" by changing directories using the <code>cd</code> command (<a href="http://computers.tutsplus.com/tutorials/navigating-the-terminal-a-gentle-introduction--mac-3855">quick guide to terminal</a>). Then run: <code>java -jar chess.jar</code>.</p>
      <h4> Issues on Linux </h4>
      <p> Make sure you have Java 6 or later installed. Run: <code>java -jar chess.jar</code>.</p>

      <h3> How It Works </h3>
      <p> This program is based on a project from one of my CS classes. The goal was to write a competitive chess bot. Most of the GUI code and chess logic was provided. My focus was on the search algorithm used. Modern chess programs use brute force to determine the optimal move, using a <a href="http://en.wikipedia.org/wiki/Game_tree">game tree</a>. Because chess has so many moves, it becomes increasingly difficult to look a move ahead. To combat this, <a href="http://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning">alpha-beta pruning</a> is used, which removes parts of the search tree that won't provide an optimal move. My bot uses <a href="http://en.wikipedia.org/wiki/Negamax">negamax</a> as the main search algorithm, combined with alpha-beta pruning.</p>

      <p> Alpha-beta pruning works best when there is good move ordering, e.g., you evaluate the best moves first. If you try the best move first, all subsequent moves will fail to be better and will be pruned away. Most enhancements to chess programs focus on improving the move ordering. Because the number of nodes at depth n-1 is substantially less than those at n, we can use the results from prior searches to improve move ordering. This process is called <a href="https://chessprogramming.wikispaces.com/Iterative+Deepening">iterative deepening</a> and is implemented in this bot.</p>

      <p> In addition, I cache the results of previous searches in a <a href="https://chessprogramming.wikispaces.com/Transposition+Table">transposition table</a>, which provide a substantial speed up. This bot also uses <a href="https://chessprogramming.wikispaces.com/Quiescence+Search">quiescence search</a>, <a href="https://chessprogramming.wikispaces.com/Killer+Heuristic">the killer heuristic</a>, and <a href="https://chessprogramming.wikispaces.com/Check+Extensions">check extensions</a> to improve its performance. Because chess openings are well studied, opening books are commonly used to allow programs to select moves from a pre-computed database of moves. This bot has an opening book, along with support for Polyglot books.<p>

      <p> The program knows how good a position is by giving every board a "score" through an <a href="https://chessprogramming.wikispaces.com/Evaluation">evaluation function</a>. The simplest functions calculate how many pieces are on the board and how valuable they are. If you have more points than your opponent, you're ahead. My evaluation is fairly simplistic, based mainly on the scores of pieces, positioning of pieces, and bonuses for certain piece combination (e.g., two bishops are more valuable than one, more so if there are few pawns on the board). I'd like to add <a href="https://chessprogramming.wikispaces.com/Pawn+Structure">pawn structure</a> and <a href="https://chessprogramming.wikispaces.com/King+Safety">king safety</a> to the evaluation function in the future.</p>

    </div>
  </div>
</div>
</%block>
