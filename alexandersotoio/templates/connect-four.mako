###############################################################################
## Connect Four
###############################################################################

<%inherit file="/site.mako"/>

<%block name="content">
<div class="container project-container">
  <div class="row">
    <div class="col-md-12">
      <h2> Connect Four</h2>
      <p> I wrote a <a href="https://en.wikipedia.org/wiki/Connect_Four">Connect Four</a> game using <a href="https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API">HTML5 Canvas</a>. Use the left and right arrow keys to move your piece. Space bar drops your piece. To start a new game, press "New Game". Enjoy! Source can be found on <a href="https://github.com/alexandersoto/connect-four">GitHub</a>.</p>

      ## Connect Four HTML
      <div id="connect-four-container">
        <h3 id="message"></h3>

        <canvas width="500" height="500" id="connectFourBoard"></canvas>

        <button id="newGame"> New Game </button>
      </div>
    </div>
  </div>
</div>
</%block>

<%block name="scripts">
<script src="${request.static_url('alexandersotoio:static/js/connect-four/ConnectFourState.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/connect-four/ConnectFourView.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/connect-four/ConnectFourMain.js')}"></script>
</%block>
