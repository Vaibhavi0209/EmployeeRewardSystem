$('#productCategoryModal').on('hidden.bs.modal', function () {
    $('#productCategoryModal form')[0].reset();
    resetValidation();

});


function getCategoryById(id) {
    $.ajax({
        type: "GET",
        url: "getCategoryById/" + id,
        success: function (result) {
            $('#category').val(result.category)
            $('#categoryDescription').val(result.categoryDescription)
            $('#id').val(result.id)
            $('#productCategoryModal').modal('show');
        }
    })

}

function resetValidation() {
    $("#category_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

$(function () {
    var $registerForm = $("#category_form");

    $registerForm.validate({
        rules: {
            category: {
                required: true,
                minlength: 2,

            }
        },
        messages: {
            category: {
                required: 'Category Name must be  required',

            },
        },
    })
})