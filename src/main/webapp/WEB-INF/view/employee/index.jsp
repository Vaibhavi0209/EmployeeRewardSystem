<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee | Dashboard</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons-1.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor-1.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-1-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/horizontal-css.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/dropzone.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/css/favicon.png"/>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/dropify.min.css">

</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_horizontal-navbar.html -->
    <jsp:include page="header.jsp"></jsp:include>

    <!-- partial -->
    <div class="main-panel">
        <!-- partial:partials/_sidebar.html -->

        <!-- partial -->
        <div class="content-wrapper">
            <div class="row">

                <div class="col-md-3">
                    <div class="card card-radius-5 mb-4">
                        <div class="card-body">
                            <h4 class="font-weight-normal lead mb-5" style="color: #5e2572 !important;"><b>Rewards</b>

                                <c:set var="total" value="0"></c:set>

                                <c:forEach items="${ls}" var="i">
                                    <c:set var="total"
                                           value="${total = (total + i.totalRewards + i.attempWiinner + i.attemptRunnerUp )}"></c:set>

                                </c:forEach>
                                <c:forEach items="${rewardsList}" var="i">
                                    <c:set var="total" value="${total = (total + i.rewards )}"></c:set>

                                </c:forEach>
                                <div class="card mb-3 mt-2"
                                     style="height: 65px; width: auto; border-radius:0.50rem; background-color: #8e2fbf ;display: flex;justify-content: center;align-items: center">

                                    <div class="badge badge-primary badge-pill" style="width: 70px;">${total}
                                    </div>

                                </div>

                                <div class="card" style=" width: auto; border-radius:0.50rem; ">
                                    <div class="table-responsive table-bordered">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Event</th>
                                                <th>Rewards</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${ls}" var="i">

                                                <tr>
                                                    <td>${i.eventName}</td>
                                                    <td>${i.totalRewards + i.attempWiinner + i.attemptRunnerUp}</td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="card mt-3" style=" width: auto; border-radius:0.50rem; ">
                                    <div class="table-responsive table-bordered">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>Rewards</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${rewardsList}" var="i">
                                                <tr>
                                                    <td>${i.title}</td>
                                                    <td> ${i.rewards}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </h4>


                        </div>
                    </div>


                </div>


                <div class="col-md-6">

                    <div class="d-flex flex-column">

                        <div class="card card-radius-5 mb-4">
                            <div class="card-body">


                                <form action="savePost" method="post" enctype="multipart/form-data" id="posts_form">
                                    <div class="form-group d-flex search-field row">
                                        <input type="text" class="form-control col-12 mb-2"
                                               placeholder="Something write Here" name="description" id="description">

                                        <input type="file" class="dropify col-12 " name="file" id="file"/>

                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary btn-rounded">Post
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <c:forEach items="${postsList}" var="i">
                            <div class="card card-radius-5 mb-4">
                                <div class="card-body">
                                    <form action="#">

                                        <div class="d-flex align-items-center pb-3 border-bottom">

                                            <c:choose>
                                                <c:when test="${i.employee.gender eq 'female' && i.employee.employeeFileName eq null}">
                                                    <img src="<%=request.getContextPath()%>/adminResources/image/female.png"
                                                         alt="profile" class="img-sm rounded-circle">
                                                </c:when>
                                                <c:when test="${i.employee.gender eq 'male' && i.employee.employeeFileName eq null}">
                                                    <img src="<%=request.getContextPath()%>/adminResources/image/face7.jpg"
                                                         alt="profile" class="img-sm rounded-circle">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="<%=request.getContextPath()%>/employee-images/${i.employee.employeeFileName}"
                                                         alt="profile" class="img-sm rounded-circle">
                                                </c:otherwise>
                                            </c:choose>


                                            <div class="ml-3">
                                                <h6 class="mb-1">${f:toUpperCase(i.employee.employeeName)}</h6 class="mb-1">
                                                <small class="text-muted mb-0">${i.employee.jobRoleId.jobRoleName}</small>
                                            </div>
                                        </div>

                                        <div class="m-3">${i.description}</div>

                                        <img style="width:-webkit-fill-available"
                                             src="<%=request.getContextPath()%>/post-images/${i.fileName}">

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-around mt-3">
                                                <div><i class="mdi mdi-thumb-up menu-icon mr-1"
                                                        style="color:#5e2572;cursor: pointer"></i>Like
                                                </div>
                                                <div><i class="mdi mdi-comment  menu-icon mr-1"
                                                        style="color:#5e2572;cursor: pointer"></i>Comment
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>


                    </div>

                </div>
                <div class="col-md-3">


                    <div class="card card-radius-5 mb-4">

                        <div class="d-flex flex-column justify-content-between">
                            <div class="card-body">
                                <h4 class="font-weight-normal lead mb-4" style="color: #5e2572 !important;"><b>Today's
                                    Birthday</b></h4>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive">
                                            <table id="order-listing" class="table">
                                                <thead>
                                                <tr>
                                                </tr>

                                                </thead>
                                                <tbody id="data">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="card-body px-0 pb-0 d-flex flex-column justify-content-between">
                                <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                        <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                    </div>
                                </div>
                                <canvas id="statistics-chart" class="mt-auto chartjs-render-monitor" width="475"
                                        height="236" style="display: block; height: 189px; width: 380px;"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="card card-radius-5 mb-4">
                        <div class="card-body">
                            <h4 class="font-weight-normal lead mb-4" style="color: #5e2572 !important;"><b>Teams</b>
                            </h4>
                            <div id="finalResult"></div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<!-- plugins:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/vendor-1.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="<%=request.getContextPath()%>/adminResources/js/Chart-1.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/bootstrap-1-datepicker.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-1-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/hoverable-1-collapse.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/template-1.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/settings-1.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist-1.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/dashboard-1.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist-1.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/employee.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/team.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/file-upload.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/custom/js/posts.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/js/dropzone.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/js/dropify.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/dropify.js"></script>


<!-- End custom js for this page-->
</body>

</html>