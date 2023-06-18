
$(function () {
    var $posts_form = $("#posts_form");

    $posts_form.validate({
        rules: {
            description: {
                required: true,
                minlength: 2,
            },
            file: {
                required: true,
            }
        },
        messages: {
            description: {
                required: 'Please write something',
            },
            file: {
                required: 'Please upload file',
            }
        },
    })
})