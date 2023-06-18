$('#rewardsModal').on('hidden.bs.modal', function () {
    $('#rewardsModal form')[0].reset();
    resetValidation();
});


function resetValidation() {
    $("#rewards_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getRewardsById(id) {
    $.ajax({
        type: "GET",
        url: "getRewardsById/" + id,
        success: function (result) {
            $('#rewardsPoint').val(result.rewardsPoint)
            $('#year').val(result.year)
            $('#id').val(result.id)
            $('#rewardsModal').modal('show');
        }
    })

}

$(function () {
    var $registerForm = $("#rewards_form");

    $registerForm.validate({
        rules: {
            rewardsPoint: {
                required: true,
                minlength: 2,
                numericonly: true,

            },
            year: {
                required: true,
                minlength: 1,
                maxlength: 4

            },
        },
        messages: {
            rewardsPoint: {
                required: 'Rewards Point must be  required',

            },
            year: {
                required: 'Year must be  required',

            },
        },
    })
})

