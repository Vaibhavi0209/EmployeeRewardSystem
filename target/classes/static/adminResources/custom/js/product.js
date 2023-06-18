$('#productModal').on('hidden.bs.modal', function () {
    $('#productModal form')[0].reset();
    resetValidation();
    dataReset('data');
});

function resetValidation() {
    $("#product_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}
function dataReset(clearId){
    document.getElementById(clearId).innerHTML="";

}
function getProductById(id) {
    $.ajax({
        type: "GET",
        url: "getProductById/" + id,
        success: function (result) {
            $('#productName').val(result.product.productName)
            $('#productDescription').val(result.product.productDescription)
            $('#productRewards').val(result.product.productRewards)
            $('#categoryId').val(result.product.categoryId.id)
            $('#supplierId').val(result.product.supplierId.id)
            $('#totalProduct').val(result.product.totalProduct)

            let imageName = '';

            if (result && result.productImageNameList) {
                for (const index in result.productImageNameList) {
                    imageName = imageName + `<div class="badge badge-primary badge-pill  m-1"  id="${result.productImageIdList[index]}">${result.productImageNameList[index]} <i class="mdi mdi-close" onclick="deleteImage(${result.productImageIdList[index]})" ></i></div>`
                    $('#data').html(imageName);
                }
            }
            $('#id').val(result.product.id)

            $('#productModal').modal('show');
        }
    })

}


function deleteImage(id) {
    var image = document.getElementById(id);
    $.ajax({
        type: "POST",
        url: "deleteImage/" + id,
        success: function (result) {
            image.remove();

        },
    })

}

$(function () {
    const $productForm = $("#product_form");
    $productForm.validate({
        rules: {
            categoryId: {required: true,},
            productName: {required: true,},
            productRewards: {required: true, minlength: 2,},
            supplierId: {required: true,},
            totalProduct: {required: true},
        },
        messages: {
            productName: {required: 'Product Name must be required',},
            productRewards: {required: 'Product Rewards must be required',},
            totalProduct: {required: 'Total Product must be required',},
        },
    })
})

// function chooseCategory() {
//     $.ajax({
//         type: "GET",
//         url: "chooseCategory/" + id,
//         success: function (result) {
//             console.log("result choose category::", result);
//         }
//     })
// }