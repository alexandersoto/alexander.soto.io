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
      <p> I founded and built <a href="https://tunessence.com">Tunessence</a> with <a href="http://mattbauch.com">Matthew Bauch</a>, with the vision of building the Rosetta Stone of music. We created interactive and entertaining ways of teaching music through software. It was <a href="http://www.halleonard.com/viewpressreleasedetail.do?releaseid=7961&subsiteid=1">acquired by Hal Leonard</a>. We went through the <a href="http://alphalab.org">AlphaLab</a> program and raised a couple rounds of additional financing. Our investors include <a href="https://www.innovationworks.org/">Innovation Works</a> and <a href="http://www.cmu.edu/open-field/our-companies/Fall%202012%20Cycle/index.html">CMU</a>. I wrote code, worked on product design and direction, fundraised, recruited employees, managed financials, and lead business development and marketing. </p>

      <p>Here's our <a href="${request.static_url('alexandersotoio:static/tunessence-executive-summary.pdf')}">executive summary</a>. And here's our AlphaLab demo day presentation and an example lesson:</p>

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
      <iframe src="https://halleonard.tunessence.com/tabs?id=a7f4cc19bcbff19de6174cc4" id="tunessence-iframe"></iframe>  
    </div>
  </div>

</div>
</%block>
