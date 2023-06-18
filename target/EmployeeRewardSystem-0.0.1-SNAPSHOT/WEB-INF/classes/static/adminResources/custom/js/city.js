$('#cityModal').on('hidden.bs.modal', function () {
    $('#cityModal form')[0].reset();
    resetValidation();
});


function getCityById(id) {
    $.ajax({
        type: "GET",
        url: "getCityById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#cityName').val(result.cityName)
            $('#cityDescription').val(result.cityDescription)
            $('#stateId').val(result.stateId.id)
            $('#cityModal').modal('show');
        }
    })
}


function resetValidation() {
    $("#city_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

$(function () {
    $("#city_form").validate({
        rules: {stateId: {required: true}, cityName: {required: true,}},
        messages: {
            stateId: {required: 'State Name must be required'},
            cityName: {required: 'City Name must be required',},
        },
    })
})