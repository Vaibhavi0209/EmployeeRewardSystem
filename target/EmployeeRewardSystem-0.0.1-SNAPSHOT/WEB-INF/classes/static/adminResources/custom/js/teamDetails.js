$(document).ready(function () {

    $.ajax({
        type: "GET", url: "teamDetailsInfo",
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
                       <div id="team-details-${index}" class="d-flex align-items-center mx-4 border-bottom" style="cursor:pointer;" title="${result[index].teamName}" onclick="getTeamById(${result[index].id},${index},${result.length})">
                            <div class="profileImage">${name1}</div>
                                <div class="ml-3">
                                    <h6 class="mb-1">${result[index].teamName}</h6>
                                    <small class="text-muted mb-0">${result[index].employees.length} Members</small>
                                </div>
                            </div>`
            }
            $('#finalResult').html(finalResult);

            if (result?.length > 0) {
                getTeamById(result[0].id)
                $('#team-details-0').css('background', '#e6e9ed')
            }

        }
    });
});

function getTeamById(id, index, size) {

    for (let i = 0; i < size; i++) {
        if (i === index) {
            $(`#team-details-${i}`).css('background', '#e6e9ed')
        } else {
            $(`#team-details-${i}`).css('background', '')
        }
    }

    var loader = `<div class="loader-demo-box">
        <div class="dot-opacity-loader">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>`

    $("#member-details").html(loader)

    setTimeout(() => {
        $.ajax({
            type: "GET",
            url: "getTeamById/" + id,
            success: function (result) {
                console.log("result :::::::", result);
                var employees = "";

                if (result?.employees?.length > 0) {

                    const employeeList = result.employees;

                    for (const index in employeeList) {

                        employees = employees + `<div class="sender-details row mb-2 team-member" onclick="getEmployeeProfile('${employeeList[index].employeeId}')">`

                        if (employeeList[index].employeeFileName) {
                            employees = employees + `<img class="img-sm rounded-circle mr-3" src="/employee-images/${employeeList[index].employeeFileName}" alt="">`
                        } else {
                            if (employeeList[index].gender === 'male') {
                                employees = employees + `<img class="img-sm rounded-circle mr-3" src="/adminResources/image/face7.jpg" alt="">`
                            } else if (employeeList[index].gender === 'female') {
                                employees = employees + `<img class="img-sm rounded-circle mr-3" src="/adminResources/image/female.png" alt="">`
                            }
                        }
                        employees = employees + `
                            <div class="mt-1">
                                <h6 class="mb-1"><a>${employeeList[index].employeeName}</a></h6>
                                    <small class="text-muted mb-0">
                                        ${employeeList[index].jobRoleId.jobRoleName}
                                    </small>
                            </div>
                        </div>`
                    }
                } else {
                    employees = ""
                }
                $("#member-details").html(employees)
            }
        });
    }, 1000)
}

function getEmployeeProfile(userId) {
    window.open(`profile?id=${userId}`, '_blank')
}

