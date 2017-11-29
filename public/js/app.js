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
		$("#EditDocumentModal select").val('').trigger('chosen:updated');;

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

          result.approvers.forEach(function(approver, index){
          	list_approvers.push(approver.employee_details.id);
          });
          console.log(list_approvers);
          $("#EditDocumentModal select").val(list_approvers).trigger('chosen:updated');;

          // $("#viewDocumentModal input[name=document_name]").val(result.document_name);
          // $("#viewDocumentModal input[name=created_by]").val(result.creator.emp_firstname + " " + result.creator.emp_lastname);
          // var checked = "";

          // if(result.approvers != null){
          //   result.approvers.forEach(function(approver, index) {
          //       if( approver.status == 1){
          //         checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/check.png"></span>';
          //       }else{
          //         checked = "";
          //       }
          //       $('#approver-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')
          //   });
          // }

          //  if(result.attachments != null){
          //     console.log('nisud');
          //   // result.attachments.forEach(function(file, index){
          //   //   console.log('nisud');
          //   //   var attachment_view = '<a target="_blank" href=" {{asset('/')}}' +  file.file_location+'">';
          //   //       attachment_view += '<div style="float: left; margin-left: 10px;">';
          //   //       attachment_view += '<div class="card" style="width:100px">';
          //   //       attachment_view += '<img class="card-img-top" src="{{asset('public/img/doctype/word.jpg')}}" alt="Card image" style="width:100%">';
          //   //       attachment_view += '<div class="card-body">';
          //   //       attachment_view += '<center>';
          //   //       attachment_view += '<span class="card-text">'+ getFileName(file.file_location) +'</span>';
          //   //       attachment_view += '</center>';
          //   //       attachment_view += '</div>';
          //   //       attachment_view += '</div>';
          //   //       attachment_view += '</div>';
          //   //       attachment_view += '</a>';

          //   //   $('.file_holder').append(attachment_view);
          //   // });
          // }

        }});
    });

