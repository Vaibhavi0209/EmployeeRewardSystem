$('#rewardProgramModal').on('hidden.bs.modal', function () {
    $('#rewardProgramModal form')[0].reset();
    resetValidation();
});


function resetValidation() {
    $("#eventReward_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}


function getRewardProgramById(id) {
    $.ajax({
        type: "GET",
        url: "getRewardProgramById/" + id,
        success: function (result) {
            $('#eventId').val(result.eventId.id)
            $('#eventDate').val(result.eventDate)

            $('#totalRewards').val(result.totalRewards)
            $('#rewardWinner').val(result.rewardWinner)
            $('#rewardRunnerUp').val(result.rewardRunnerUp)
            $('#id').val(result.id)
            $('#rewardProgramModal').modal('show');
        }
    })
}

$(function () {
    var $registerForm = $("#eventReward_form");

    $registerForm.validate({
        rules: {
            eventId: {
                required: true,
            },
            eventName: {
                required: true
            },
            eventDate: {
                required: true,
            },
            totalRewards: {
                required: true,
                minlength: 2,
            },
            rewardWinner: {
                required: true,
                minlength: 2,
            },
            rewardRunnerUp: {
                required: true,
                minlength: 2,
            },
        },
        messages: {
            eventName: {
                required: 'Event name must be required'
            },
            eventDate: {
                required: 'Event Date must be required',
            },
            totalRewards: {
                required: 'Reward must be required',
            },
            rewardWinner: {
                required: 'Reward Winner must be required',
            },
            rewardRunnerUp: {
                required: 'Reward Runner Up must be required',
            },
        }
    })
})