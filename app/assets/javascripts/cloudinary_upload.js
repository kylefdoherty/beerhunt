$(function() {
  var fileupload = $(".cloudinary-fileupload");
  var progressBarDiv = $(".progress");
  var progressBar = $(".progress-bar");
  var uploadButton = $(".btn-image-upload");
  var previewImage = $(".preview-image");

  fileupload.cloudinary_fileupload();

  fileupload.bind("fileuploadsend", function(e) {
    progressBarDiv.removeClass("hide");
    uploadButton.addClass("hide");
  });

  fileupload.bind("cloudinarydone", function(e, data) {
    progressBarDiv.addClass("hide");

    previewImage.html(
        $.cloudinary.image(data.result.public_id,
          { format: data.result.format, version: data.result.version,
            crop: "fill", width: 250, height: 200 })
      );
  });

  fileupload.bind("fileuploadprogress", function(e, data) {
    progressBar.css("width", Math.round((data.loaded * 100.0) / data.total) + '%');
  });
});
