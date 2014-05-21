###############################################################################
## Overclocking Class
###############################################################################

<%inherit file="/site.mako"/>

<%block name="title">Overclocking Class - Alexander Soto</%block>
  
<%block name="content">
<div class="container project-container">
  <div class="row">
    <div class="col-xs-12">
      <h1> Need for Speed: Computer Builds and Overclocking </h1>

      <p> I designed a curriculum and taught a computer building and overclocking class at CMU with my friend John Levidy. It was offered Fall 2010 under course number 98-154. Some of the material is out of date (hardware changes quickly!), but the general concepts are still valid. We went over the basics of building a computer from scratch and then dove into the art of overclocking. In addition to lectures, we brought in desktops and had students overclock them in class for hands on experience.</p>

      <h2> Course Description </h2>
      <p>This course will teach students how to build, maintain, and overclock a modern PC. We will also show students how to overclock a modern computer. By tweaking settings in a computer's BIOS (basic input output system), one can achieve much faster speeds than would be possible on stock settings. However, an increase in processor frequency does not come free; temperatures and stability must also be carefully monitored in order for an overclock to be considered successful. For example, rather than buying a $900 3.00 GHz quad-core processor from Intel, one could buy a $200 2.6 GHz processor and fairly easily overclock it to over 4.00 GHz. For any extreme PC user, overclocking is an invaluable skill to have.</p>
      <h2> Lectures </h2>

    </div>
  </div>

  ## Lectures
  <div class="row">
    <div class="col-md-2 col-sm-3">
      <ol id="scribd-lectures" class="nav nav-pills nav-stacked">
        <li><a data-scribd-id='221656982'>Overview</a></li>
        <li><a data-scribd-id='221659339'>Motherboards</a></li>
        <li><a data-scribd-id='221661733'>CPUs</a></li>
        <li><a data-scribd-id='221659345'>CPUs & Memory</a></li>
        <li><a data-scribd-id='221659353'>Power Supplies & Hard Drives</a></li>
        <li><a data-scribd-id='221659356'>Cases & GPUs</a></li>
        <li><a data-scribd-id='221659359'>GPUs</a></li>
        <li><a data-scribd-id='221659365'>Overclocking</a></li>
      </ol>
    </div>

    <div class="col-md-10 col-sm-9">
      <iframe class="scribd_iframe_embed" id="scribd-iframe" src="" data-auto-height="false" data-aspect-ratio="undefined" scrolling="no" width="100%" height="600" frameborder="0"></iframe>
    </div>
  </div>

</div>
</%block>

<%block name="scripts">
<script>
'use strict';

var scribdIframe = document.getElementById('scribd-iframe');
var lectures = document.querySelectorAll('#scribd-lectures a');
 
var onclickHandler = function(e) {
  
  // Load lecture
  scribdIframe.src = '//www.scribd.com/embeds/' + e.target.getAttribute('data-scribd-id') + '/content';

  // Remove all other active links and set current link to active
  for (var i = 0; i < lectures.length; i++) {
    lectures[i].parentNode.className = '';
  }
  e.target.parentNode.className = 'active';
}

// Set click handlers and init state with first click
for (var i = 0; i < lectures.length; i++) {
  lectures[i].onclick = onclickHandler;
}
lectures[0].click();

</script>
</%block>
