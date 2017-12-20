   Dropzone.options.viewDocumentDropzoneComment  = {
      url: '/docpro/comment/upload',
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        // console.log(file_name);

        $('#comment_attachment_holder').append('<input class="comment-upload-input" type="hidden" name="comment_file_uploads[]" value="' + file_name.replace(/\s/g,'') +'">');

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

    $('#btn_send_comment').click(function(){
      var filenames = [];
       $("input.comment-upload-input").each(function(){
          filenames.push({filename : $(this).val()});
      });

      var message = $('#comment_area').val();
      var document_id = $('#viewDocumentModal input[name=document_id]').val();
      var comment_attachment = filenames;
      var employee_details_id = $('input[name=employee_details_id]').val();
      $.ajax({url:  "/docpro/document/comment" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "_code" : $("#viewDocumentModal input[name=_code]").val(),     
            "document_id" : document_id,   
            "comment_attachments" : comment_attachment,  
            "message" : message,     
            "employee_details_id" : employee_details_id,     
          }, 
          success: function(result){
            console.log(result);
            if(result.success){
                var comment = "";
                comment = '<div class="comment_holder">';
                comment += '<span>';
                comment += '<br>';
                comment += '<img height="30" src="' + root_URL + 'public/img/mopro_profile.png">&nbsp;&nbsp;<b>'+ result.comment.commentor.emp_firstname + ' ' + result.comment.commentor.emp_lastname +'</b>';
                comment += '<span>&nbsp;</span>';
                comment += '<span>commented at </span>';
                comment += '<span>'+ result.comment.created +'</span>';
                comment += '<br>';
                comment += '<br>';
                comment += '<pre class="comment_text_holder">';
                // comment += '<img src="{{asset('/public/img/status/check.png')}}">&nbsp;';
                comment +=  message;
                comment += '</pre>';
                comment += '</span>';
                comment += ' </div>';
                $('#comment_container').prepend(comment);
                $('#comment_area').val("");
                $('#comment_area').css('height','50px');
            }else{
              console.log(result);
            }
        }});

    });