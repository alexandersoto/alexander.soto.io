###############################################################################
## Homepage
###############################################################################

<%inherit file="/site.mako"/>

<%block name="content">

  ## Tagline
  <div class="site-header">
    <div id="tag-line-container" class="container">
      <div class="row">
        <div class="col-xs-12 text-center">
          <p id="tag-line">Computer Engineer &bull; Product Designer &bull;  Business Strategist</p>
        </div>
      </div>
    </div>
  </div>

  ## About me
  <div class="container" id="about-me-container">
    <div class="row">

      <div class="col-md-3 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-6 col-xs-offset-3">
        <img src="${request.static_url('alexandersotoio:static/images/alexander-soto.jpg')}" class="img-circle img-responsive">
      </div>

      <div class="col-md-9 col-sm-8 col-xs-12">
        <p> I'm working on <a href="https://clever.com">Clever</a>, a startup that's making it easier for developers to create educational apps. Previously I founded <a href="https://tunessence.com">Tunessence</a>, which makes learning music easier with software. I've worked at Qualcomm, NVIDIA, and the U.S. Department of Defense. I studied Electrical and Computer Engineering at CMU. I enjoy solving highly technical problems and making useful products that people love.</p>
      </div>
    </div>
  </div>

  ## Resume and links
  <div id="resume-container">
    <div class="container">

      <%doc>
      ## Download resume
      <div class="row">
        <div class="col-xs-12 text-center">        
          <a id="resume-btn" 
             href="${request.static_url('alexandersotoio:static/alexander-soto-resume.pdf')}">
             <i class="fa fa-download"></i> Resume
          </a>
        </div>
      </div>
      </%doc>

      ## Links
      <div class="row">
        <div class="col-xs-12">
          <ul id="icon-link-list">
            <li> 

            ## GitHub
            <a href="https://github.com/alexandersoto">
              <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x" id="white-fa-circle"></i>
                <i class="fa fa-github fa-stack-2x"></i>
            </span></a>
            </li>
            <li>

            ## LinkedIn
            <a href="https://www.linkedin.com/in/alexandermsoto">
              <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-linkedin fa-stack-1x fa-inverse"></i>
            </span></a>
            </li>
            <li>

            ## Email
            <a id="email">
              <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
            </span></a></li>
            <li> 
            
            ## Phone
            <a id="phone">              
              <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-phone fa-stack-1x fa-inverse"></i>
            </span></a>
            </li>
          </ul>
        </div>
      </div>

      <div class="row">
        <div class="col-xs-12 text-center">        
          <p id="contact-text"></p>
        </div>
      </div>

      
    </div>
  </div>


  ## Project thumbnails/links
  <div id="projects-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <h2> Things I've Built </h2>
        </div>
      </div>

      <div class="row">

        <% from alexandersotoio import PROJECTS %>
        % for project in PROJECTS:
        <div class="col-md-3 col-sm-4 col-xs-6">
          <a href="${request.route_url(project)}">
            <div class="img-overlay-wrapper">
              <img src="${request.static_url('alexandersotoio:static/images/' + project + '.jpg')}" class="img-responsive" alt="${project}">
              <div class="img-overlay">
                  <div class="box-center-outer">
                    <div class="box-center-inner">
                      <h3> ${project.replace('-', ' ').title()} </h3>
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
        % endfor
        
      </div>
    </div>
  </div>
</%block>

<%block name="scripts">
<script>
  'use strict';

  // Replace the p tag with contact info when email or phone clicked
  var contactText = document.getElementById('contact-text');
  
  document.getElementById('email').onclick = function() {
    contactText.innerHTML = 'alexander@soto.io';
  }

  document.getElementById('phone').onclick = function() {
    contactText.innerHTML = '786-271-6301';
  }
</script>
</%block>
