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

  ## TODO - load analytics

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
