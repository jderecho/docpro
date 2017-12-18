$('.gear-profile').click(function(){
	$('#dropzoneChangeProfile').trigger('click');
});

Dropzone.options.dropzoneChangeProfile = {
      url: '/docpro/profile/upload',
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        console.log(file_name);

        $('#createDocumentModal #file_uploads_container').append('<input class="upload-input" type="hidden" name="file_uploads[]" value="' + file_name.replace(/\s/g,'') +'">');

        done(); 
      },
      addRemoveLinks: true,
      removedfile: function(file) {
          console.log([file, "delete"]);
           var filenames = [];
           var found = false;
            var file_name = file.name;

           $("#createDocumentModal #file_uploads_container input.upload-input").each(function(){
              if(file_name.replace(/\s/g,'') == $(this).val() && (!found) ){
                $(this).remove();
                found = true;
              }
          });

          var _ref;
          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
      },
      success : function(file, response){
      	console.log(response);

      	var _img = document.getElementById('profile_pic');
		var newImg = new Image;
		newImg.onload = function() {
		    _img.src = this.src;
		}
		$("#profilepic").val(response.profile_url);
		newImg.src = response.profile_url;
		console.log(newImg.src);
		
      }
    };



