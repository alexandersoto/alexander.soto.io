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
      <p> I founded and built <a href="https://tunessence.com">Tunessence</a> with <a href="http://mattbauch.com">Matthew Bauch</a>, with the vision of building the Rosetta Stone of music. We're creating new interactive and entertaining ways of teaching music through software. We went through the <a href="http://alphalab.org">AlphaLab</a> program and raised a couple rounds of additional financing. Our investors include <a href="https://www.innovationworks.org/">Innovation Works</a> and <a href="http://www.cmu.edu/open-field/our-companies/Fall%202012%20Cycle/index.html">CMU</a>. Here's our <a href="${request.static_url('alexandersotoio:static/tunessence-executive-summary.pdf')}">executive summary</a>. And here's our AlphaLab demo day presentation:</p>
      
      <div class="text-center">
        <iframe src="//player.vimeo.com/video/52266702" width="500" height="375" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
      </div>

    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      I write code, work on product design and vision, fundraise, recruit employees, manage financials, and lead business development and marketing. I encourage you to <a href="https://tunessence.com">check out the entire site</a>! Below is one of my favorite lessons:    
    </div>
  </div>

  <div class="row" >
    <div class="col-md-12">
      <iframe src="https://tunessence.com/tabs?id=5220360e5bb7c5bdc2d9fbbf" frameborder="0" height="700" width="100%" id="tunessence-iframe"></iframe>  
    </div>
  </div>

</div>
</%block>
