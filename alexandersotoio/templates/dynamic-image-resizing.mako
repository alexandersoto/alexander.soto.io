###############################################################################
## Dynamic Image Resizing
###############################################################################

<%inherit file="/site.mako"/>

<%block name="css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css">

<style>
#resizeContainer {
    border: 4px solid red;
    border-right-style: dashed;
    position: absolute;
}
#imageCanvas {
    margin: 4px;
}
#resizeRow {
    margin-bottom: 20px;
    margin-top: 10px;
}
</style>
</%block>

<%block name="content">
<div class="container project-container">
  <div class="row">
    <div class="col-md-12">
      <h2> Header </h2>
      <p> Explain project. </p>

      <div class="row">
        <div class="col-md-12" id="resizeRow">
          <div id="resizeContainer"></div>
          <canvas id="imageCanvas"></canvas>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <input type="file" id="imageLoader" name="imageLoader" />
        </div>
      </div>

    </div>
  </div>
</div>
</%block>

<%block name="scripts">

<script src="${request.static_url('alexandersotoio:assets/js/jquery-1.11.1.js')}"></script>
<script src="${request.static_url('alexandersotoio:assets/js/jquery-ui-1.10.4.js')}"></script>
<script src="${request.static_url('alexandersotoio:assets/js/seam.js')}"></script>

</%block>
