<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hr | Event</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg"/>
</head>

<body class="sidebar-light">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->


    <jsp:include page="header.jsp"></jsp:include>


    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"></jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">

                <div class="card">
                    <div
                            class="card-header custom-card-header d-flex align-items-center justify-content-between">
                        <h4 class="mb-0 text-white">Attendance</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Event</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="eventIdForm"
                                                onchange="getEmployeeName(this.value)">
                                            <option disabled="disabled" selected="selected">Select Event</option>
                                            <c:forEach items="${rewardProgramList}" var="i">
                                                        <c:if test="${i.rewardStatus eq 'APPROVED'}">
                                                <option
                                                        value="${i.eventId.id}">${i.eventId.eventName} - (${i.eventDate})
                                                </option>
                                                        </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Employee</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="employeeId"
                                                onchange="handleOnChangeOfEmployee()">
                                            <option disabled="disabled" selected="selected">Select Employee</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-9" id="employeeBadges"></div>
                                </div>


                                <div class="d-flex justify-content-end">
                                    <button class="btn btn-primary" onclick="saveEmployeeAttendance()">
                                        Save
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card" style="margin-top: 10px">

                    <div
                            class="card-header custom-card-header d-flex align-items-center">

                        <div>
                            <form>
                                <select class="form-control" id="eventId"
                                        onchange="getEmployeeIds(this.value)">
                                    <option disabled="disabled" selected="selected">Select Event</option>

                                    <c:forEach items="${rewardProgramList}" var="i">

                                                <c:if test="${i.rewardStatus eq 'APPROVED'}">
                                        <option value="${i.id}-${i.eventId.id}">${i.eventId.eventName} - (${i.eventDate})
                                            (${i.totalRewards})
                                        </option></c:if>

                                    </c:forEach>
                                </select>
                            </form>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Employee Name</th>
                                            <th>Rewards</th>
                                            <th>Winner</th>
                                            <th>Runner Up</th>

                                        </tr>
                                        </thead>
                                        <tbody id="employeeName">

                                        </tbody>
                                    </table>
                                    <div id="xyz">

                                    </div>

                                </div>

                            </div>
                        </div>


                    </div>

                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->

            <jsp:include page="footer.jsp"></jsp:include>

            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->


</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
<!-- End custom js for this page-->
<!-- Required meta tags -->

<script src="<%=request.getContextPath()%>/adminResources/custom/js/attendance.js"></script>


</body>
</html>
