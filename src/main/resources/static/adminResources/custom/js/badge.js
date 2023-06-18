let index = 1;
$('#badgeDetailsModal').on('hidden.bs.modal', function () {
    $('#badgeDetailsModal form')[0].reset();
    resetValidation();
});

function addCriteria() {
    var table = document.getElementById("box");
    table.style.display = ""

    var cn = document.getElementById("cn");

    var row = table.insertRow(-1);
    var c1 = row.insertCell(0);
    var c2 = row.insertCell(1);
    var c3 = row.insertCell(2);

    c1.innerHTML = index;
    c2.innerHTML = `<input type="hidden" name="criteriadetail" value="${cn.value}">` + cn.value;
    c3.innerHTML = `<i value = "Edit" class="mdi mdi-pencil lead"  onclick="edit(this)" style="cursor:pointer" title="Edit Criteria"></i><i class="mdi mdi-delete lead text-danger ml-2"  value="Delete" style="cursor:pointer" title="Delete Criteria" onclick="tempDelete(this)"></i>`

    index++;
}

function tempDelete(d) {
    var table = document.getElementById("box");
    var l = d.parentNode.parentNode;
    table.deleteRow(l.rowIndex);
}

function del(d) {
    var criteria = document.getElementById(d);
    $.ajax({
        type: "POST",
        url: "deleteBadgeCriteria/" + d,
        success: function (result) {
            criteria.remove();
        }
    })
}

var l;

function edit(e) {

    var submit = document.getElementById("sub");
    submit.style.display = "none";

    var update = document.getElementById("upd");
    update.style.display = "";

    var cn = document.getElementById("cn");

    l = e.parentNode.parentNode;

    var c1 = l.cells[1];

    c1.innerHTML = cn.value;

}

function updteCriteria() {


    var sub = document.getElementById("sub");
    sub.style.display = "";

    var update = document.getElementById("upd");
    update.style.display = "none";

    var cn = document.getElementById("cn");

    var c1 = l.cells[1];

    c1.innerHTML = cn.value;

}

function getCritaria(id) {

    $.ajax({
        type: "GET",
        url: "getCriteriaById/" + id,
        success: function (result) {

            $('#tableBody').html()
            let tableBody = "";
            let indexNo = 1;
            if (result) {
                for (const index in result) {
                    tableBody = tableBody + `<tr>
                                    <td>${indexNo}</td>
                                    <td>${result[index].criteria}</td>
                                  </tr>`
                    indexNo++;

                }
                $('#tableBody').html(tableBody)
            }
            $('#criteriaDetailsModal').modal('show');
        }
    })
}

function getBadgeById(id) {
    $.ajax({
        type: "GET",
        url: "getBadgeById/" + id,
        success: function (result) {
            $('#badgeName').val(result.badge.badgeName)
            $('#badgeDescription').val(result.badge.badgeDescription)
            $('#badgeRewards').val(result.badge.badgeRewards)
            $('#fileName').val(result.badge.badgeImage)
            $('#id').val(result.badge.id)
            let editCriteria = '';
            $('#editCriteria').html()
            let indexNo = 1;
            if (result && result.criteriaList) {
                for (const index in result.criteriaList) {
                    editCriteria = editCriteria + `<tr id="${result.criteriaIdList[index]}">
                                    <td>${indexNo}</td> 
                                    <td>${result.criteriaList[index]}</td>
                                    <td><i value = "Edit" class="mdi mdi-pencil lead" style="cursor:pointer" title="Edit Criteria" onclick="edit(this)"></i>
                                    <i class="mdi mdi-delete lead text-danger ml-2" value="Delete" style="cursor:pointer" title="Delete Criteria" onclick="del(${result.criteriaIdList[index]})"></i></td>
                                  </tr>`
                    indexNo++;
                }
                $('#editCriteria').html(editCriteria)

            }
            $('#badgeDetailsModal').modal('show');
        }
    })
}


function resetValidation() {
    $("#badge_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

$(function () {
    var $registerForm = $("#badge_form");

    $registerForm.validate({
        rules: {
            badgeName: {
                required: true,
                minlength: 2,

            },
            // badgeDescription: {
            //     minlength: 5,
            //     maxlength: 1000
            //
            // },
            badgeRewards: {
                required: true,
                minlength: 3,
            },

        },
        messages: {
            badgeName: {
                required: 'BadgeName must be  required',

            },
            badgeRewards: {
                required: 'BadgeRewards must be  required',
            },


        },
    })
})

