var root_URL = "";
var base_URL = "localhost/docpro/";


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


function statusString(id){
    var str = "";
    switch (id) {
        case 0:
            str = "Draft";
            break;
        case 1:
            str = "For Approval";
            break;
        case 2:
            str = "Pre-Approved";
            break;
        case 3:
            str = "Approved";
            break;
        case 4:
            str = "Reviewed";
            break;
        default:
            break;
    }
    return str;
}
  function statusClass(id){
    var str = "";
    switch (id) {
        case 0:
            str = "status-draft";
            break;
        case 1:
            str = "status-for-approval";
            break;
        case 2:
            str = "status-pre-approved";
            break;
        case 3:
            str = "status-approved";
            break;
        case 4:
            str = "status-reviewed";
            break;
        default:
            break;
    }
    return str;
}
function alert_message(alert_message, alert_type){
    var alerttype = "danger";
    if(alert_type == true){
        alerttype = "success";
    }

    $.notifyDefaults({
        placement: {
            from: "top"
        },
        animate:{
            enter: "animated fadeInDown",
            exit: "animated fadeOutUp"
        }
    });

    $.notify({
      // options
      message: alert_message 
    },{
      // settings
      type: alerttype,
      allow_dismiss: true,
      newest_on_top: true
    });

    setTimeout(function() {
        $.notifyClose();
        if(alert_type){
            location.reload();
        }
    }, 3000);
}

$.ajaxSetup({
  beforeSend: function(jqXHR, settings) {
    // Show full page LoadingOverlay
    $.LoadingOverlay("show");
    
    return true;
  },
  complete: function(){
    $.LoadingOverlay("hide");
  }
});


function validate(field, type, required){
    var documentRegex = new RegExp('^[a-zA-Z -1234567890]*$'); 
    var revisionRegex = new RegExp('^[0-9]*$');

    if(required){
        if(field.val() == null || field.val() == "" || field.val().length === 0){
            if(field.is('select')){
                field.next('div').after("<p class='warning'>Field is required</p>");
                field.focus();
            }else{
                field.after("<p class='warning'>Field is required</p>");
                field.focus();
            }
            return false;
        }
    }

    switch(type){
        case 'document_name':
            $message = "";
            $success = false;
            if(documentRegex.test(field.val())){

            }else{
                field.after("<p class='warning'>Document Name can only contain text, number and dash</p>");
                field.focus();
                return false;
            }
            return true;

        break;
        case 'revision_number':
            if(revisionRegex.test(field.val())){

            }else{
                field.after("<p class='warning'>Revision Number only accepts numbers</p>");
                field.focus();
                return false;
            }
        break;
    }
    return "aw";
}

function registerValidation(field){
    if(field.is('select')){
         field.on('change', function(e) {
            // triggers when whole value changed
            $('p.warning').remove();
          });
    }else{
        field.click(function(){
            $('p.warning').remove();
        });
    }
}


