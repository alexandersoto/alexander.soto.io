(function($, SeamCarverImage) {
    'use strict';

    // Contains the canvas with the image
    var ResizableImage = {
        canvas: null,
        context: null,
        seamCarverImage: null,
        $resizeContainer: $('#resize-container'),
        displayOption: null,

        init: function (canvas) {
            this.canvas = canvas;
            this.context = this.canvas.getContext('2d');
            this.$resizeContainer.resizable({
                handles: 'e',
                stop: this.stopResize.bind(this)
            });
            
            // Change the display option based on the radio button
            this.displayOption = $('input[name="display-options"]:checked').val();
            $('input[name="display-options"]').change(function(e) {
                this.displayOption = e.target.value;
                this.paint();
            }.bind(this));
        },

        // A new image is loaded - reset everything
        load: function (image) {
            this.image = image;
            this.canvas.width = image.width;
            this.canvas.height = image.height;

            // Init the resize container
            this.$resizeContainer.resizable('option', 'maxHeight', image.height);
            this.$resizeContainer.resizable('option', 'maxWidth', image.width);
            this.$resizeContainer.height(image.height);
            this.$resizeContainer.width(image.width);

            // This image contains the logic to find seams
            this.seamCarverImage = new SeamCarverImage(this.getPixelsFromImage(image));
            this.paint();
        },

        // Get the pixels from a given image with an in-memory canvas
        getPixelsFromImage: function (image) {
            var canvas = document.createElement('canvas');
            canvas.height = image.height;
            canvas.width = image.width;

            var context = canvas.getContext('2d');
            context.drawImage(image, 0, 0);
            return context.getImageData(0, 0, image.width, image.height);
        },

        // Draws the pixels onto the cavnas
        paint: function () {

            // Choose pixels based on which view user wants to see
            var pixels;
            switch(this.displayOption) {
                case 'seam':
                    pixels = this.seamCarverImage.seamPixels;
                    break;
                case 'gradient':
                    pixels = this.seamCarverImage.gradientPixels;
                    break;
                case 'gradient-seam':
                    pixels = this.seamCarverImage.seamGradientPixels;
                    break;
                case 'no-seam':
                    pixels = this.seamCarverImage.pixels;
                    break;
            }

            this.context.putImageData(pixels, 0, 0);
        },

        stopResize: function (e, ui) {
            var difference = ui.originalSize.width - ui.size.width;

            // Set the resize box to what will be its final value
            this.$resizeContainer.width(this.seamCarverImage.pixels.width - difference);

            // We're increasing the size, so reset to original image and shrink that
            if (difference < 0) {
                this.seamCarverImage = new SeamCarverImage(this.getPixelsFromImage(this.image));
                this.canvas.width = this.image.width;
                this.paint();
                difference = this.image.width - ui.size.width;
            }

            var removeSeam = function () {
                this.seamCarverImage.removeSeam();
                this.canvas.width = this.seamCarverImage.pixels.width;
                this.paint();
            }.bind(this);

            // Don't allow resizing while we're animating
            this.$resizeContainer.resizable('option', 'disabled', true);
            for (var i = difference; i > 0; i--) {

                // use setTimeout to show updates to user       
                window.setTimeout(removeSeam);
            }

            // Set width of resize box once everything is complete and renable resizing
            window.setTimeout(function() {
                this.$resizeContainer.width(this.seamCarverImage.pixels.width);
                this.$resizeContainer.resizable('option', 'disabled', false);
            }.bind(this));
        }
    };


    // Handles changes of the image file, either through upload or user selection
    var ImageLoader = {
        $upload: $('#image-loader'),
        $images: $('.image-to-carve'),

        init: function () {
            this.$upload.on('change', this.uploadImage.bind(this));

            // Load image when clicked on. Load first by default
            this.$images.click(function(e) {
                this.loadImage(e.target.src);
            }.bind(this));
            this.$images[0].click();
        },

        // Load a new image from a source url or data
        loadImage: function(src) {
            var img = new Image();
            img.onload = function() {
                ResizableImage.load(img);
            };
            img.src = src;
        },

        // Get an image from the user
        uploadImage: function (e) {
            var reader = new FileReader();
            reader.onload = function (e) {
                this.loadImage(e.target.result);
            }.bind(this);
            reader.readAsDataURL(e.target.files[0]);
        }
    };

    // main()
    ResizableImage.init(document.getElementById('image-canvas'));
    ImageLoader.init();

})(window.jQuery, window.SeamCarverImage);
