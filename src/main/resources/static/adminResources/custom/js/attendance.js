let employeeList = [];

let employeeAttendanceList = [];


function getEmployeeName(id) {
    $.ajax({
        type: "GET",
        url: "getEmployeeName/" + id,
    }).done(
        function (response) {
            var employeeList = "";

            employeeList = employeeList + '<option selected="selected" disabled="disabled">Select Employee</option>'

            for (var i = 0; i < response.length; i++) {
                var data = response[i];
                employeeList = employeeList + '<option value="' + data.id
                    + '">';
                employeeList = employeeList + data.emloyee_name;
                employeeList = employeeList + '</option>';
            }
            $('#employeeId').html(employeeList);
        }
    );
}


function handleOnChangeOfEmployee() {
    const employeeName = $('#employeeId').find(":selected").text()
    const employeeValue = $('#employeeId').find(":selected").val()

    const duplicateRecords = employeeList.filter(employee => Number(employee.value) === Number(employeeValue))

    if (duplicateRecords.length > 0) {
        return false
    }

    const employee = {
        name: employeeName,
        value: employeeValue
    }
    employeeList.push(employee)


    generateEmployeeBadges()
}

function generateEmployeeBadges() {

    let employeeBadgeData = '';

    employeeList.forEach(employee => {
        employeeBadgeData = employeeBadgeData + `<div class="badge badge-primary" style="margin-right: 5px;margin-top: 5px"">${employee.name}
            <i class="mdi mdi-close" onclick="removeEmployee(${employee.value})"/></div>`
    })
    $('#employeeBadges').html(employeeBadgeData)
}

function removeEmployee(id) {
    employeeList = employeeList.filter(employee => Number(employee.value) !== Number(id));
    generateEmployeeBadges();

}

function saveEmployeeAttendance() {
    const attendanceBody = []
    for (let index = 0; index < employeeList.length; index++) {
        attendanceBody.push({
            employeeId: employeeList[index].value,
            eventId: $('#eventIdForm').val()
        })
    }
    $.ajax({
        type: 'POST',
        url: 'saveAttendance',
        data: JSON.stringify(attendanceBody),
        contentType: "application/json; charset=UTF-8",
        success: function (response) {
            location.reload();
        }
    });
}

function getEmployeeIds(payload) {

    const data = payload.split('-');

    const eventRewardId = data[0];
    const eventId = data[1];


    $.ajax({
        type: 'GET',
        url: 'getEmployeeIds/' + eventRewardId + '/' + eventId,
        contentType: "application/json; charset=UTF-8",
        success: function (result) {
            $('#employeeName').html()
            let employeeName = "";
            let indexNo = 1;
            const employeeNames = result.employeeNames
            const rewardProgram = result.rewardProgram
            const isFinished = rewardProgram.finished
            let totalRewards = 0
            let totalWinner = 0
            let totalRunnerUp = 0
            employeeAttendanceList = []

            if (employeeNames.length > 0) {

                if (isFinished) {
                    for (const index in employeeNames) {
                        employeeName = employeeName + `<tr>
                                    <td>${indexNo}</td>
                                    <td>${employeeNames[index].emloyee_name}</td>
                                    <td>${employeeNames[index].attempt_event}</td>
                                    <td>${employeeNames[index].attempt_winner === 0 ? '-' : employeeNames[index].attempt_winner}</td>
                                    <td>${employeeNames[index].attempt_runner_up === 0 ? '-' : employeeNames[index].attempt_runner_up}</td>
                                </tr>`
                        indexNo++;
                        totalRewards+=employeeNames[index].attempt_event;
                        totalWinner+=employeeNames[index].attempt_winner;
                        totalRunnerUp+=employeeNames[index].attempt_runner_up;

                    }
                    let total=0;
                    employeeName = employeeName + `<tr>
                                                    <td colspan="2"><b>SubTotal</b></td>
                                                    <td> ${totalRewards}</td>
                                                    <td>${totalWinner}</td>
                                                    <td>${totalRunnerUp}</td>
                                                  </tr>`
                    employeeName = employeeName + `<tr>
                                                    <td colspan="4"><b>Total</b></td>
                                                    <td>${totalRewards + totalWinner + totalRunnerUp}</td>
                                                   </tr>`


                } else {
                    for (const index in employeeNames) {

                        let employeeData = {
                            employeeId: `${employeeNames[index].id}`,
                            winner: false,
                            runnerUp: false
                        }

                        employeeAttendanceList.push(employeeData);

                        employeeName = employeeName + `<tr>
                                    <td>${indexNo}</td>
                                    <td>${employeeNames[index].emloyee_name}</td>
                                    <td>${rewardProgram.totalRewards}</td>
                                    <td><div class="form-check form-check-flat form-check-primary">
                                       <label class="form-check-label">
                                            <input type="checkbox" name="isWinner" class="form-check-input" id="winner ${indexNo}" onclick="disableRunnerUp(this,${employeeNames[index].id})" value="true">
                                            <i class="input-helper"></i>
                                       </label>
                                        </div>
                                    </td>
                                    <td><div class="form-check form-check-flat form-check-primary" >
                                        <label class="form-check-label">
                                            <input type="checkbox" name="isRunnerUp" class="form-check-input" id="runnerUp ${indexNo}" onclick="disableWinner(this,${employeeNames[index].id})" value="true">
                                             <i class="input-helper"></i>
                                        </label>
                                        </div>
                                    </td>
                                </tr>`
                        indexNo++;
                    }
                    document.getElementById("xyz").innerHTML = `
                            <div class="d-flex justify-content-end">
                                <button  id="submit" class="btn btn-primary" onclick="finishEvent(${eventId})">Finish</button>
                            </div>`;
                }
                $('#employeeName').html(employeeName)
            } else {
                employeeAttendanceList = []
                $('#employeeName,#xyz').html('')
            }
        }
    });
}

function finishEvent(eventId1) {

    const requestBody = {
        eventId: eventId1,
        eventDetailsDTOList: employeeAttendanceList
    };

    $.ajax({
        type: 'POST',
        url: 'finishEvent',
        data: JSON.stringify(requestBody),
        contentType: "application/json; charset=UTF-8",
        success: function (response) {

            employeeAttendanceList = [];

        }
    });
}

function disableRunnerUp(winner, employeeId) {

    const index = employeeAttendanceList.findIndex(employee => {
        return Number(employee.employeeId) === employeeId
    })

    let status = winner.id.split(" ")[1];
    let runnerId = "runnerUp " + status;

    if (document.getElementById(runnerId).attributes.disabled) {
        document.getElementById(runnerId).disabled = false
        employeeAttendanceList[index].winner = false
    } else {
        document.getElementById(runnerId).disabled = true
        employeeAttendanceList[index].winner = true
    }

}

function disableWinner(runnerUp, employeeId) {

    const index = employeeAttendanceList.findIndex(employee => {
        return Number(employee.employeeId) === employeeId
    })

    let status = runnerUp.id.split(" ")[1];
    let winner = "winner " + status;

    if (document.getElementById(winner).attributes.disabled) {
        document.getElementById(winner).disabled = false
        employeeAttendanceList[index].runnerUp = false
    } else {
        document.getElementById(winner).disabled = true
        employeeAttendanceList[index].runnerUp = true
    }

}

