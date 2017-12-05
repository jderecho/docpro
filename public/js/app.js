var root_URL = "";
$(document).ready(function(){

	root_URL = $('input[name=root_url]').val();
	
    $('#document-table').DataTable();


    $('[data-toggle="tooltip"]').tooltip({
        html: true
    }); 

	function checkTime(i) {
	  if (i < 10) {
	    i = "0" + i;
	  }
	  return i;
	}

	function startTime() {
	  var time = new Date();

	  time = time.toLocaleString('en-US', { hour: 'numeric',minute:'numeric', second: 'numeric' , hour12: true });
	  document.getElementById('time').innerHTML = time;
	  t = setTimeout(function() {
	    startTime()
	  }, 500);
	}
	startTime();

});

function getExtension(filename){
	return filename.split('.').pop();
}

function getFileName(fullPath){
	if (fullPath) {
    var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
    var filename = fullPath.substring(startIndex);
    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
        filename = filename.substring(1);
    }
    return filename;
	}
	return "";
}


function showMessage(type, message){

	if(type == "error"){
		$('#messageDocumentModal #modal-header').addClass("modal-error");
		$("#messageDocumentModal").removeClass('modal-success');
	}else if(type == "success"){
		$('#messageDocumentModal #modal-header').addClass("modal-success");
		$("#messageDocumentModal").removeClass('modal-error');
	}
	$('#messageDocumentModal #messagebody').html(message);
	$("#messageDocumentModal").modal('show');
}


$(".btn_edit_document").click(function(){
		$("#EditDocumentModal select").val('').trigger('chosen:updated');
     	var editDocumentDropzone = Dropzone.forElement("#edit_document_dropzone");
     	editDocumentDropzone.removeAllFiles(true);
		// $("#EditDocumentModal input[name]").
      //   $('.file_holder').html('');
      //   $('#approver-list-container').html('');

      // GET Document
       $.ajax({url:  "document/" + $(this).attr('data-value'), 
        method: 'GET', 
        success: function(result){
          $("#EditDocumentModal input[name=document_name]").val(result.document_name);
          $("#EditDocumentModal input[name=revision_number]").val(result.revision_number);
          console.log(result);
          var list_approvers = [];
          var list_departments = [];
          result.approvers.forEach(function(approver, index){
          	list_approvers.push(approver.employee_details.id);
          });

          result.departments.forEach(function(department, index){
          	list_departments.push(department.employee_dept.dept_ID);
          });


          console.log(list_approvers);
          $("#EditDocumentModal #select_reviewers").val(list_approvers).trigger('chosen:updated');
          $("#EditDocumentModal #select_departments").val(list_departments).trigger('chosen:updated');


          // display mock file of uploaded file in dropzonejs
          // console.log(Dropzone);
		 // var myDropzone = $("#edit_document_dropzone").dropzone();
          result.attachments.forEach(function(file, index){
          	console.log(file);

          	// Create the mock file:
			var mockFile = { name: getFileName(file.file_location), size: 12345 };

			// Call the default addedfile event handler
			editDocumentDropzone.emit("addedfile", mockFile);

			// And optionally show the thumbnail of the file:
			editDocumentDropzone.emit("thumbnail", mockFile, "http://localhost/docpro/public/img/doctype/word.jpg");
			
			// Or if the file on your server is not yet in the right
			// size, you can let Dropzone download and resize it
			// callback and crossOrigin are optional.
			editDocumentDropzone.createThumbnailFromUrl(file, "http://localhost/docpro/" + file.file_location);

			// Make sure that there is no progress bar, etc...
			editDocumentDropzone.emit("complete", mockFile);

			// If you use the maxFiles option, make sure you adjust it to the
			// correct amount:
			var existingFileCount = 1; // The number of files already uploaded
			editDocumentDropzone.options.maxFiles = editDocumentDropzone.options.maxFiles - existingFileCount;

      //       var mockFile = { name: "banner2.jpg", size: 12345, thumbnail: "http://localhost/docpro/img/doctype/word.jpg" };
    		// editDocumentDropzone.options.addedfile.call(editDocumentDropzone, mockFile);
    		// editDocumentDropzone.options.thumbnail.call(editDocumentDropzone, mockFile, "http://localhost/docpro/public/img/doctype/word.jpg");
          	
          });
          console.log(result);

        }});
    });

Dropzone.options.edit_document_dropzone = {
      url: "document/upload",
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        // console.log(file_name);

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
      }
    };


