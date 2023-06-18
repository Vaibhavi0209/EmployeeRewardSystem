$('#productImageModal').on('hidden.bs.modal', function () {
    $('#productImageModal form')[0].reset();
    resetValidation();
});

function resetValidation() {
    $("#product_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getProductImage(id) {
    $.ajax({
        type: "GET",
        url: "getProductImageById/" + id,
        success: function (result) {

            let imageData = '';

            if (result) {
                for (const index in result) {
                    imageData = imageData + `<a target="_blank" href="/product-images/${result[index].productFileName}" className="${result[index].productFileName}">`
                    imageData = imageData + `<img src="/product-images/${result[index].productFileName}" style="height: 250px; width: 250px; margin-left: 30px; margin-bottom: 30px;" alt="${result[index].productFileName}"></a>`
                }
            }

            $('#lightgallery').html(imageData);
            $('#productImageModal').modal('show');
        }
    })
}