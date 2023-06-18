$('#replyModal').on('hidden.bs.modal', function () {
    $('#replyModal form')[0].reset();
});

function sendReply(id) {
    $.ajax({
        type: "GET",
        url: "sendReply/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#subject').val(result.subject)
            $('#reason').val(result.reason)
            $('#description').val(result.description)
            document.getElementById("abc").innerHTML = `<div class="form-group">
        <label for="reason">Reason</label>
        <input id="reason"
                    class="form-control"
                    name="reason"
                    type="text"/>
                    
    </div>
    <input type="hidden" id="requestStatus" value="DECLINED" name="requestStatus"/>
`
        }
    })
}

function sendReward(id) {
    $.ajax({
        type: "GET",
        url: "sendReward/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#subject').val(result.subject)
            $('#rewards').val(result.rewards)
            $('#description').val(result.description)
            document.getElementById("abc").innerHTML = `<div class="form-group">
        <label for="rewards">Rewards</label>
        <input id="rewards"
                 class="form-control"
                 name="rewards" type="text"/>
    </div> 
    <div class="form-group">
        <label for="title">Title</label>
        <input id="title"
                 class="form-control"
                 name="title" type="text"/>
    </div> 
    <input type="hidden" id="requestStatus" value="APPROVED" name="requestStatus"/>
    
`
        }
    })
}

