###############################################################################
## The most general template for the site
###############################################################################

<!DOCTYPE html>
<html lang="en">
  <head>
  <!-- The source for this site can be found at https://github.com/alexandersoto/alexander.soto.io -->

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
  <link rel="shortcut icon" href="${request.static_url('alexandersotoio:static/images/favicon.ico')}"/>

  ## Styles    
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400|Montserrat:400">
  <link rel="stylesheet" href="${request.static_url('alexandersotoio:static/css/bootstrap.css')}">

  ## Other needed css files / blocks
  <%block name="css"></%block>

  ## Load analytics
  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-51169357-1', 'soto.io');ga('send', 'pageview');
  </script>
  </head>

  <body>
    <div class="site-header text-center">
      <div class="container">
          <div class="row">
            <div class="col-xs-12">
              <h1 id="site-heading"><a href="${request.route_url('home')}">Alexander Soto</a></h1>
            </div>
          </div>
        </div>
    </div>
      
    <%block name="content"></%block>  
    <%block name="scripts"></%block>
  </body>
</html>
