$('#teamModal').on('hidden.bs.modal', function () {
    $('#teamModal form')[0].reset();
    resetValidation();
    dataReset('data');

});

function resetValidation() {
    $("#team_form").validate().resetForm();
    $(".error").removeClass("error");
    $("label.error").hide();


}

function dataReset(clearId){
  document.getElementById(clearId).innerHTML="";

}

function getTeamMember(id) {
    getTeamName(id);
    $.ajax({
        type: "GET",
        url: "getTeamMembersById/" + id,

        success: function (result) {
            let indexNo = 1;
            let finalResult = '';
            for (const index in result) {
                finalResult = finalResult + `<tr>
            <td>${indexNo}</td>
            <td>
           ${result[index].employeeFileName == null && result[index].gender === "female" ?

                    ' <img src="/adminResources/image/female.png" alt="/adminResources/image/female.png"/>'
                    : result[index].employeeFileName == null && result[index].gender === "male" ? ' <img src="/adminResources/image/face7.jpg"   alt="/adminResources/image/face7.jpg"/>' :
                        `<img src="/employee-images/${result[index].employeeFileName}"   alt="/employee-images/${result[index].employeeFileName}"/>`
                }
   
            </td>
            <td>${result[index].employeeName}</td>
             <td>${result[index].jobRoleId.jobRoleName}</td>
            </tr>`
                indexNo++;
            }
            $('#teamBody').html(finalResult);
        }
    })
}


function getTeamById(id) {
    $.ajax({
        type: "GET",
        url: "getTeamById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#teamName').val(result.teamName)
            $('#teamDescription').val(result.teamDescription)
            let teamMembers = '';
            if (result) {
                for (const index in result.employees) {
                    teamMembers = teamMembers + `<div class="badge badge-primary badge-pill  m-1"  id="${result.employees[index].id}">${result.employees[index].employeeName} <i class="mdi mdi-close" onclick="deleteMember(${result.employees[index].id},${result.id})"></i></div>`
                    $('#data').html(teamMembers);
                }

            }

        }
    });
}

function deleteMember(id, teamId) {
    var member = document.getElementById(id);
    $.ajax({
        type: "POST",
        url: "deleteMember/" + id + "/" + teamId,
        success: function (result) {
            member.remove();
        },
    })
}


$(document).ready(function () {

    $.ajax({
        type: "GET", url: "getAllTeamsName",
        context: document.body,
        success: function (result) {
            let finalResult = '';

            for (const index in result) {
                let nameparts = result[index].teamName.split(" ");
                if (nameparts.length > 1) {
                    var name1 = (nameparts[0].toUpperCase().charAt(0)) + (nameparts[1].toUpperCase().charAt(0))
                } else if (nameparts.length == 1) {
                    var name1 = (nameparts[0].toUpperCase().charAt(0))
                }


                finalResult = finalResult + `
                <div class="d-flex align-items-center mx-3 my-2 pb-3">
                
                
                            <div class="profileImage">${name1}</div>
                                <div class="ml-3">
                                    <h6 class="mb-1">${result[index].teamName}</h6>
                                    <small class="text-muted mb-0">${result[index].employees.length} Members</small>
                                </div>     
                                <i class="mdi mdi-telegram font-weight-bold ml-auto px-1 py-1 mdi-24px" style="color:#5e2572;cursor: pointer"></i>
                          
                            </div>`

            }
            $('#finalResult').html(finalResult);
        }
    });
});
$(function () {
    var $teamForm = $("#team_form");
    $teamForm.validate({
        rules: {teamName: {required: true,}},
        messages: {
            teamName: {required: 'Team Name must be required'},
        }
    })
})

function getTeamName(id) {
    $.ajax({
        type: "GET",
        url: "getTeamById/" + id,
        success: function (result) {
            $('#id').val(result.id)
            $('#teamName').val(result.teamName)
            let employeeTeam = result.teamName;
            $('#employeeTeam').html(employeeTeam);
        }
    });
}