In order to get the latest version of bootstrap, we'll have to update manually from:
https://github.com/twitter/bootstrap

Current workflow taken from jstam's answer -
http://stackoverflow.com/questions/10451317/twitter-bootstrap-customization-best-practices

We have a personal.less that is placed inside of bootstrap.less

To install bootstrap - git clone it
npm install
Then copy over the less/personal folder
Update bootstrap.less to include personal.less
make


We also changed our icons to use font awesome. Following these instructions:
Copy the Font Awesome font directory into your project.
Copy font-awesome.less into your bootstrap/less directory.
Open bootstrap.less and replace @import "sprites.less"; with @import "font-awesome.less";
Open your project's font-awesome.less and edit the font url to ensure it points to the right place.
@font-face {
  font-family: 'FontAwesome';
  src: url('../font/fontawesome-webfont.eot');
  src: url('../font/fontawesome-webfont.eot?#iefix') format('embedded-opentype'),
     url('../font/fontawesome-webfont.woff') format('woff'),
     url('../font/fontawesome-webfont.ttf') format('truetype'),
     url('../font/fontawesome-webfont.svg#FontAwesome') format('svg');
  font-weight: normal;
  font-style: normal;
}
Re-compile your LESS if using a static compiler.
