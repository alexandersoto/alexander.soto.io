###############################################################################
## Tunessence
###############################################################################

<%inherit file="/site.mako"/>

<%block name="title">Tunessence - Alexander Soto</%block>

<%block name="content">
<div class="container project-container">
  <div class="row">
    <div class="col-md-12">

      <h2> Tunessence </h2>
      <p> I founded and built <a href="http://tunessence.com">Tunessence</a> with <a href="http://mattbauch.com">Matthew Bauch</a>, with the vision of building the Rosetta Stone of music. We created interactive and entertaining ways of teaching music through software. It was <a href="http://www.halleonard.com/viewpressreleasedetail.do?releaseid=7961&subsiteid=1">acquired by Hal Leonard</a>. We went through the <a href="http://alphalab.org">AlphaLab</a> program and raised a couple rounds of additional financing. Our investors include <a href="https://www.innovationworks.org/">Innovation Works</a> and <a href="http://www.cmu.edu/open-field/our-companies/Fall%202012%20Cycle/index.html">CMU</a>. I wrote code, worked on product design and direction, fundraised, recruited employees, managed financials, and lead business development and marketing. </p>

      <p>Here's our <a href="${request.static_url('alexandersotoio:static/tunessence-executive-summary.pdf')}">executive summary</a>. And here's our AlphaLab demo day presentation and some example lessons:</p>

      ## Demo Day Video
      <div class="row" id="demo-day-iframe">
        <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2">
          <div class="embed-responsive embed-responsive-16by9">
            <iframe src="//player.vimeo.com/video/52266702" class="embed-responsive-item" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
          </div>
        </div>
      </div>

    </div>
  </div>

  ## Tunessence embed
  <div class="row" >
    <div class="col-md-12">
      <ul class="nav nav-tabs">
        <li id="a5441405bcbff19b84ad299b"><a href="#">Learn to Fly</a></li>
        <li id="a5e96d90bcbff1fb4cebe153"><a href="#">Bohemian Rhapsody</a></li>
        <li id="a560726bbcbff18702b90462"><a href="#">Sultans of Swing</a></li>
        <li id="a7f4cc19bcbff19de6174cc4"><a href="#">Still Got the Blues</a></li>
        <li id="a412089cbcbff1a13a32987e"><a href="#">Hotel California</a></li>
        <li id="a556c651bcbff1d8795f38e0"><a href="#">Piano Man</a></li>
      </ul>
      <iframe id="tunessence-iframe"></iframe>
    </div>
  </div>

</div>
</%block>

<%block name="scripts">
<script>
  'use strict';

  // Iframe where we'll load the lessons
  var tunessenceIframe = document.getElementById('tunessence-iframe');
  var IFRAME_ROOT_URL = "https://halleonard.tunessence.com/tabs?id=";

  var songTabs = document.getElementsByTagName("li");

  // Load the song given the tab that was clicked
  var loadSongHandler = function(e) {
    var clickedSongTab = e.currentTarget;

    // Remove active class from all tabs
    for(var i = 0; i < songTabs.length; i++) {
      songTabs[i].className = "";
    }

    // Make clicked tab active
    clickedSongTab.className = "active";

    // Load the song for the tab we clicked on
    tunessenceIframe.src = IFRAME_ROOT_URL + clickedSongTab.id;
  }

  // Attach click handler to all tabs
  for(var i = 0; i < songTabs.length; i++) {
    songTabs[i].onclick = loadSongHandler;
  }

  // Click the first song to load it
  songTabs[0].click();
</script>
</%block>
