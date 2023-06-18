$('#exampleModal').on('hidden.bs.modal', function () {
    $('#exampleModal form')[0].reset();
    resetValidation();
});

function resetValidation() {
    $("#exampleModal").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getJobRoleById(id) {
    $.ajax({
        type: "GET",
        url: "getJobRoleById/" + id,
        success: function (result) {
            $('#jobRoleDescription').val(result.jobRoleDescription)
            $('#jobRoleName').val(result.jobRoleName)
            $('#id').val(result.id)
            $('#exampleModal').modal('show');
        }
    })

}

$(function () {
    var $registerForm = $("#jobRole_form");
    $registerForm.validate({
        rules: {jobRoleName: {required: true,},},
        messages: {
            jobRoleName: {required: 'JobRole Name must be required',},
        },
    })
})