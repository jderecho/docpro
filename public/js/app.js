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


