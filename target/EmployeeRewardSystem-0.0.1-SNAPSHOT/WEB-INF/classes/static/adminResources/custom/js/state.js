$('#stateModal').on('hidden.bs.modal', function () {
    $('#stateModal form')[0].reset();
    resetValidation();
});


function resetValidation() {
    $("#state_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getStateById(id) {
    $.ajax({
        type: "GET",
        url: "getStateById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#stateName').val(result.stateName)
            $('#stateDescription').val(result.stateDescription)
            $('#stateModal').modal('show');
        }
    })
}

$(function () {
    var $stateForm = $("#state_form");
    $stateForm.validate({
        rules: {stateName: {required: true,},},
        messages: {
            stateName: {required: 'State Name must be required',},
        },
    })
})