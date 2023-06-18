$('#supplierModal').on('hidden.bs.modal', function () {
    $('#supplierModal form')[0].reset();
    resetValidation();
});


function resetValidation() {
    $("#supplier_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getSupplierById(id) {
    $.ajax({
        type: "GET",
        url: "getSupplierById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#email').val(result.email)
            $('#phoneNo').val(result.phoneNo)
            $('#supplierName').val(result.supplierName)
            $('#supplierDescription').val(result.supplierDescription)
            $('#supplierModal').modal('show');
        }
    })

}

$(function () {
    $("#supplier_form").validate({
        rules: {
            supplierName: {required: true,}, email: {required: true, email: true}, phoneNo: {
                required: true,
                numericonly: true,
                minlength: 10,
                maxlength: 10
            },
        },
        messages: {
            supplierName: {required: 'Supplier Name must be required'},
            email: {
                required: 'email must be required'
            },
            phoneNo: {
                required: 'Phone No must be required',
                numericonly: 'Phone No invalid',
                minlength: 'min 10 digit',
                maxlength: 'mx 12 digit'

            },
        },
    })
})