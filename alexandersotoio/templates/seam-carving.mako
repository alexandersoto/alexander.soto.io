###############################################################################
## Seam Carving
###############################################################################

<%inherit file="/site.mako"/>

<%block name="title">Seam Carving - Alexander Soto</%block>

<%block name="content">
<div class="container project-container">
  <div class="row">
    <div class="col-xs-12">
      <h2> Seam Carving </h2>
      <p> This program resizes images dynamically, based on the content of the image using a <a href="http://en.wikipedia.org/wiki/Seam_carving">seam carving</a> algorithm. It removes the least important part of the picture first. It uses dynamic programming to calculate the seams, and <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays">javascript typed arrays</a> to speed up computation (which means it only works in modern browsers). Source can be found on <a href="https://github.com/alexandersoto/seamcarving">GitHub</a>.</p>
      <p> Resize the image by dragging the right edge of the picture. Toggle different views with the radio buttons. Below you can select or upload a different images. </p>

      <div class="row">
        <div class="col-xs-12">
          
          <label class="radio-inline">
            <input type="radio" name="display-options" value="seam" checked> Show Seams
          </label>
          <label class="radio-inline">
            <input type="radio" name="display-options" value="gradient"> Show Gradient
          </label>
          <label class="radio-inline">
            <input type="radio" name="display-options" value="gradient-seam"> Show Gradient and Seams
          </label>
          <label class="radio-inline">
            <input type="radio" name="display-options" value="no-seam"> Show Original
          </label>

        </div>
      </div>

      <div class="row">
        <div class="col-xs-12" id="resize-row">
          <div id="resize-container"></div>
          <canvas id="image-canvas"></canvas>
        </div>
      </div>
      <div class="row" id="images-to-load">
        <div class="col-md-2 col-xs-6">
          <img class="img-responsive image-to-carve" src="${request.static_url('alexandersotoio:static/images/seam-carving/landscape.jpg')}">
        </div>
        <div class="col-md-2 col-xs-6">
          <img class="img-responsive image-to-carve" src="${request.static_url('alexandersotoio:static/images/seam-carving/broadway-tower.jpg')}">
        </div>
        <div class="col-md-2 col-xs-6">
          <img class="img-responsive image-to-carve" src="${request.static_url('alexandersotoio:static/images/seam-carving/beach-village.jpg')}">
        </div>
        <div class="col-md-2 col-xs-6">
          <img class="img-responsive image-to-carve" src="${request.static_url('alexandersotoio:static/images/seam-carving/mountains.jpg')}">
        </div>
        <div class="col-md-2 col-xs-6">
          <img class="img-responsive image-to-carve" src="${request.static_url('alexandersotoio:static/images/seam-carving/eiffel-tower.jpg')}">
        </div>
        <div class="col-md-2 col-xs-6">
          <input type="file" id="image-loader">
        </div>
      </div>

    </div>
  </div>
</div>
</%block>

<%block name="scripts">
<script src="${request.static_url('alexandersotoio:static/js/vendor/jquery-1.11.1.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/vendor/jquery-ui-custom-1.10.4.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/vendor/jquery-ui-touch-punch-0.2.3.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/seam-carving/seam.js')}"></script>
<script src="${request.static_url('alexandersotoio:static/js/seam-carving/ui.js')}"></script>
<script>
App.init();
</script>
</%block>
