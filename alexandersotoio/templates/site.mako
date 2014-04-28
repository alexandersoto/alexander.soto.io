###############################################################################
## The most general template for the pages
###############################################################################

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- The source is unminified for readability, and can also be found at https://github.com/alexandersoto/alexander.soto.io -->

    <meta charset="utf-8">

    ## Always force latest IE rendering engine
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    ## For bootstrap / proper mobile rendering
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>
      <%block name="title">Alexander Soto</%block>
    </title>

    ## SEO descriptions can go here
    <%block name="seo"></%block>

    ## Icons
    <link rel="shortcut icon" href="">

    ## Styles    
    <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Open+Sans:400'>
    ##<link rel="stylesheet" href="${request.static_url('tunessence:assets/css/tunessence-bootstrap.css')}">


    ## Other needed css files
    <%block name="css"></%block>

    <%doc>
    ## Load analytics.js 
    <script>
      %  if (request.registry.settings['is_production']):
      var segmentioToken = '';
      %  else:
      var segmentioToken = '';
      % endif

      window.analytics||(window.analytics=[]),window.analytics.methods=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group","on","once","off"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var method=window.analytics.methods[i];window.analytics[method]=window.analytics.factory(method)}window.analytics.load=function(t){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)},window.analytics.SNIPPET_VERSION="2.0.8";
      window.analytics.load(segmentioToken);
    </script>
    </%doc>

  </head>

  <body>
    <%block name="content"></%block>  
  </body>
</html>
