let skillList = [];

$('#employeeDetailsModal').on('hidden.bs.modal', function () {
    $('#employeeDetailsModal form')[0].reset();
    resetValidation();
    skillList = [];
    $('#skillDetails').html('')
});
$(document).ready(function () {

    $.ajax({
        type: "GET", url: "getAllEmployeeName",
        context: document.body,
        success: function (result) {
            let finalResult = '';
            for (const index in result) {
                finalResult = finalResult + `<tr>
                                    <td>${result[index].employeeName}</td>
                                       <td>${result[index].jobRoleId.jobRoleName}</td>
                                       <td><i title="Send Wish" class="mdi mdi-gift primary" style="color:purple;cursor:pointer"></i></td>
                                  </tr>`
            }
            $('#data').html(finalResult);
        }
    });
});


function getEmployeeById(id) {

    $.ajax({
        type: "GET",
        url: "getEmployeeById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#employeeName').val(result.employeeName)
            $('#address').val(result.address)
            $('#dob').val(result.dob)
            $('#email').val(result.email)
            $('#phoneNo').val(result.phoneNo)
            $('#employeeId').val(result.employeeId)
            $('#gender').val(result.gender)
            $('#jobRoleId').val(result.jobRoleId.id)
            $('#pinCode').val(result.pinCode)
            $('#stateId').val(result.stateId.id)
            getCity(result.cityId.id, result.stateId.id);
            $('#cityId').val(result.cityId.id)
            $('#fileName').val(result.employeeFileName)
        }
    })


    $.ajax({
        type: "GET",
        url: "getEmployeeSkillById/" + id,
        success: function (result) {
            $('#skillDetails').html('')
            if (result && result.length > 0) {
                for (const index in result) {
                    skillList.push(result[index].skillName);
                }
                createSkillBadges();
            }
        }
    })


}

$(function () {
    $("#employee_form").validate({
        rules: {
            employeeName: {required: true},
            email: {required: true, email: true},
            phoneNo: {
                required: true,
                digit: true,
                minlength: 10,
                maxLength: 10
            },
            pinCode: {
                required: true,
                digit: true,
            },
            cityId: {
                required: true
            },
            stateId: {
                required: true
            },
            jobRoleId: {
                required: true
            },
        },

        messages: {
            employeeName: {required: 'Employee Name must be required',},
            email: {
                required: 'Email must be required',
                email: 'email invalid'
            },
            phoneNo: {
                required: 'Phone No must be required',
                numericonly: 'Phone No invalid',
                minlength: 'min 10 digit',
                maxlength: 'mx 12 digit'

            },
            pinCode: {
                required: 'PinCode must be required'
            },
            stateId: {
                required: 'state must be required',
            },

            cityId: {
                required: 'city must be required',
            },
            dob: {
                required: 'Date of Birth must be required'
            }, jobRoleId: {
                required: 'Job Role must be required'
            },
        },
    })
})

function resetValidation() {
    $("#employee_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();
}

function getCity(getId, stateCode) {
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "getSelectedCity/" + stateCode,
            async: false
        }).done(
            function (response) {
                var cityList = "";
                for (var i = 0; i < response.length; i++) {
                    var data = response[i];
                    if (getId !== 0 && data.id === getId) {
                        cityList = cityList + '<option selected value="' + data.id
                            + '">';
                        cityList = cityList + data.cityName;
                        cityList = cityList + '</option>';
                    } else if (getId === 0 || (data !== 0 && data.id !== getId)) {
                        cityList = cityList + '<option value="' + data.id
                            + '">';
                        cityList = cityList + data.cityName;
                        cityList = cityList + '</option>';
                    }
                }
                $('#cityId').html(cityList);
            }
        )
    });
}

function getEmployeeInfo(id) {
    $.ajax({
        type: "GET",
        url: "getEmployeeInfo/" + id,
        success: function (result) {
            $('#employeeBody').html()
            let employeeBody = "";
            if (result) {
                employeeBody = employeeBody + `<tr> <th>Employee Name</th><td>${result.employeeName}</td></tr>
                                <tr><th>Gender</th><td>${result.gender}</td></tr>
                                <tr><th>Email</th><td>${result.email}</td></tr>
                                <tr><th>DOB</th><td>${result.dob}</td></tr>
                                <tr><th>Address</th><td>${result.address}</td></tr>
                                <tr><th>Phone No</th><td>${result.phoneNo}</td></tr>
                                <tr><th>Pincode</th><td>${result.pinCode}</td></tr>
                                <tr><th>State Name</th><td>${result.stateId.stateName}</td></tr>
                                <tr><th>City Name</th><td>${result.cityId.cityName}</td></tr>`
                $('#employeeBody').html(employeeBody)
            }
            $('#EmpDetails').modal('show');
        }
    })
}

function isInputNumber(event) {
    var ch = String.fromCharCode(event.which);
    if (!(/[0-9]/.test(ch))) {
        event.preventDefault();
    }
}


$('#skills').keyup(function (e) {
    const skill = $('#skills').val();

    if (skill.includes(",")) {
        const skillData = skill.split(",")[0]
        if (!skillList.some(x => x === skillData)) {
            skillList.push(skillData);
        }
        $('#skills').val('');
    }
    createSkillBadges();
});

function createSkillBadges() {

    var skillData = '';

    for (const skill in skillList) {
        skillData = skillData + `<input type="hidden" name="skillName" value="${skillList[skill]}">` +
            `<div class="badge badge-primary mr-2" >` + skillList[skill] + `</div>`;
    }
    $('#skillDetails').html(skillData)
}

