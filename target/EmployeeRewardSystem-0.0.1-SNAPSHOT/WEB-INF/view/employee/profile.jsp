<%@ page import="com.demo.util.BaseMethods" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="user" value="<%=BaseMethods.getUser()%>"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee | Profile</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons-1.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor-1.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-1-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/horizontal-css.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/css/favicon.png"/>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg"/>

</head>
<body class="sidebar-light">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->


    <jsp:include page="header.jsp"></jsp:include>


    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->


        <!-- partial -->
        <div class="container-fluid ">
            <div>
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="border-bottom text-center pb-4">

                                                <c:choose>
                                                    <c:when test="${employeeInfo.gender eq 'female' && employeeInfo.employeeFileName eq null}">
                                                        <img src="<%=request.getContextPath()%>/adminResources/image/female.png"
                                                             alt="profile" class="img-lg rounded-circle mb-3">
                                                    </c:when>
                                                    <c:when test="${employeeInfo.gender eq 'male' && employeeInfo.employeeFileName eq null}">
                                                        <img src="<%=request.getContextPath()%>/adminResources/image/face7.jpg"
                                                             alt="profile" class="img-lg rounded-circle mb-3">

                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="<%=request.getContextPath()%>/employee-images/${employeeInfo.employeeFileName}"
                                                             alt="profile" class="img-lg rounded-circle mb-3">
                                                    </c:otherwise>
                                                </c:choose>

                                                <p><b> ${employeeInfo.jobRoleId.jobRoleName}</b></p>
                                            </div>
                                            <div class="border-bottom py-4">
                                                <p><b>Skills</b></p>
                                                <div>
                                                    <c:forEach items="${skills}" var="i" varStatus="j">
                                                        <label class="badge badge-outline-dark">${i.skillName}</label>
                                                    </c:forEach>
                                                </div>

                                            </div>
                                            <div class="py-4">
                                                <p><b>Person Details</b></p>

                                                <p class="clearfix">
    <span class="float-left">
    Gender
    </span>
                                                    <span class="float-right text-muted">
                                                        ${employeeInfo.gender}
                                                    </span>
                                                </p>
                                                <p class="clearfix">
    <span class="float-left">
    Email
    </span>
                                                    <span class="float-right text-muted">
    <a href="#"> ${employeeInfo.email} </a></span>
                                                </p>
                                                <p class="clearfix">
    <span class="float-left">
    State
    </span>
                                                    <span class="float-right text-muted">
                                                        ${employeeInfo.stateId.stateName} </span>
                                                </p>
                                                <p class="clearfix">
    <span class="float-left">
    City
    </span>
                                                    <span class="float-right text-muted">
                                                        ${employeeInfo.cityId.cityName}
                                                    </span>
                                                </p>
                                                <p class="clearfix">
    <span class="float-left">
    Pin Code
    </span>
                                                    <span class="float-right text-muted">
                                                        ${employeeInfo.pinCode}
                                                    </span>
                                                </p>
                                                <p class="clearfix">
    <span class="float-left">
    PhoneNo
    </span>
                                                    <span class="float-right text-muted">
                                                        ${employeeInfo.phoneNo}
                                                    </span>
                                                </p>
                                            </div>
                                            <c:set var="total" value="0"></c:set>

                                            <c:forEach items="${ls}" var="i">
                                                <c:set var="total"
                                                       value="${total = (total + i.totalRewards + i.attempWiinner + i.attemptRunnerUp )}"></c:set>

                                            </c:forEach>
                                            <c:forEach items="${rewardsList}" var="i">
                                                <c:set var="total" value="${total = (total + i.rewards )}"></c:set>

                                            </c:forEach>


                                            <c:if test="${user eq employeeInfo.employeeId}">
                                                <button class="btn btn-primary btn-block">${total}</button>
                                                <div class="table-responsive table-bordered mt-3">
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

                                                <div class="table-responsive table-bordered mt-3">
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
                                            </c:if>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <h3>${employeeInfo.employeeName} (${employeeInfo.employeeId})</h3>
                                                    <div class="d-flex align-items-center">
                                                        <h5 class="mb-0 mr-2 text-muted">${employeeInfo.jobRoleId.jobRoleName}</h5>
                                                    </div>
                                                </div>
                                                <c:if test="${user eq employeeInfo.employeeId}">
                                                    <div>
                                                        <button class="btn btn-primary" data-toggle="modal"
                                                                data-target="#requestModal">Request
                                                        </button>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <div class="profile-feed">
                                                <c:forEach items="${postsList}" var="i" varStatus="j">
                                                    <div class="d-flex profile-feed-item">

                                                        <div class="ml-4">


                                                            <div class="d-flex align-items-center pb-3 border-bottom">


                                                                <c:choose>
                                                                    <c:when test="${i.employee.gender eq 'female' && i.employee.employeeFileName eq null}">
                                                                        <img src="<%=request.getContextPath()%>/adminResources/image/female.png"
                                                                             alt="profile"
                                                                             class="img-sm rounded-circle">
                                                                    </c:when>
                                                                    <c:when test="${i.employee.gender eq 'male' && i.employee.employeeFileName eq null}">
                                                                        <img src="<%=request.getContextPath()%>/adminResources/image/face7.jpg"
                                                                             alt="profile"
                                                                             class="img-sm rounded-circle">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="<%=request.getContextPath()%>/employee-images/${i.employee.employeeFileName}"
                                                                             alt="profile"
                                                                             class="img-sm rounded-circle">
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <div class="ml-3">
                                                                    <h6 class="mb-1">${i.employee.employeeName}</h6>
                                                                    <p>${i.description}</p>
                                                                </div>
                                                            </div>
                                                            <img src="<%=request.getContextPath()%>/post-images/${i.fileName}"
                                                                 alt="sample" class="rounded mw-100"
                                                                 style="width:-webkit-fill-available">

                                                            <p class="small text-muted mt-2 mb-0" style="display: none">
                                                      <span>
                                                        <i class="mdi mdi-thumb-up  mr-1"
                                                           style="color:#5e2572;cursor: pointer"></i>4
                                                      </span>
                                                                <span class="ml-2">
                                                        <i class="mdi mdi-comment mr-1"
                                                           style="color:#5e2572;cursor: pointer"></i>11
                                                      </span>
                                                            </p>
                                                        </div>
                                                    </div>

                                                </c:forEach>
                                            </div>
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

    <div class="modal fade" id="requestModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Request</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <f:form action="saveRequest" method="post" modelAttribute="requestData" enctype="multipart/form-data">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group"><label class="required" for="subject">Subject</label>
                                <f:input path="subject" id="subject"
                                         class="form-control"
                                         name="subject"
                                         minlength="2"
                                         type="text"/>
                            </div>
                            <div class="form-group"><label class="required" for="description">Description</label>
                                <f:textarea path="description" id="description"
                                            class="form-control"
                                            name="description"
                                            minlength="2"
                                            rows="5"
                                            type="text"/>
                            </div>
                            <div class="form-group">
                                <label>Attachment</label>

                                <input type="file" id="multipartFile" name="multipartFile"
                                       class="file-upload-default"/>
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled=""
                                           placeholder="Upload Image">
                                    <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button"
                                            >Upload</button>
                                        </span>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </f:form>
            </div>
        </div>
    </div>
    <!-- container-scroller -->
    <script>
    </script>
    <!-- plugins:js -->
    <script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="<%=request.getContextPath()%>/adminResources/js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/bootstrap-datepicker.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/file-upload.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="<%=request.getContextPath()%>/adminResources/js/dashboard.js"></script>

    <script src="<%=request.getContextPath()%>/adminResources/js/profile-demo.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/jquery.barrating.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/custom/js/employee.js"></script>

    <!-- End custom js for this page-->
</body>

</html>

