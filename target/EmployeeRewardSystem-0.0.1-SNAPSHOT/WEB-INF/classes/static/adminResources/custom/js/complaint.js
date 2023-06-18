$('#complaintDetailsModal').on('hidden.bs.modal', function () {
    $('#complaintDetailsModal form')[0].reset();
    resetValidation();
});

function getComplaintById(id) {
    $.ajax({
        type: "GET",
        url: "getComplaintById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#subject').val(result.subject)
            $('#reply').val(result.reply)
            $('#replyDate').val(result.replyDate)
            $('#description').val(result.description)
            $('#status').val(result.status)
            $('#complaintDate').val(result.complaintDate)
            $('#complaintDetailsModal').modal('show');
        }
    })
}


function resetValidation() {
    $("#event_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

$(function () {
    var $registerForm = $("#complaint_form");

    $registerForm.validate({
        rules: {
            subject: {
                required: true},
            description:{
                required:true
            }
        },
        messages: {
            subject: {
                required: 'Subject must be  required',

            },
            description:{
                required: 'Description must be  required',
            },
        },
    })
})