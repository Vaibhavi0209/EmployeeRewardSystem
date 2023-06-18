$('#eventModal').on('hidden.bs.modal', function () {
    $('#eventModal form')[0].reset();
    resetValidation();
});


function getEventById(id) {
    $.ajax({
        type: "GET",
        url: "getEventById/" + id,
        success: function (result) {
            $('#eventName').val(result.eventName)
            $('#eventDescription').val(result.eventDescription)
            $('#id').val(result.id)
            $('#eventModal').modal('show');
        }
    })

}


function resetValidation() {
    $("#event_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

$(function () {
    var $registerForm = $("#event_form");

    $registerForm.validate({
        rules: {
            eventName: {
                required: true,
                minlength: 2,

            },
        },
        messages: {
            eventName: {
                required: 'Event Name must be  required',

            },
        },
    })
})