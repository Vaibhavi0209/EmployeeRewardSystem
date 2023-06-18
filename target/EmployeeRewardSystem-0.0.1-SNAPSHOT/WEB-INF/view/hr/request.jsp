<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hr | Request</title>
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
                        <h4 class="mb-0 text-white">Request</h4>


                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Subject</th>
                                            <th>Employee Name</th>
                                            <th>Designation</th>
                                            <th>Image</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.subject}</td>
                                                <td>${i.employee.employeeName}</td>
                                                <td>${i.employee.jobRoleId.jobRoleName}</td>
                                                <td>
                                                    <img src="<%=request.getContextPath()%>/employee-request-images/${i.fileName}"
                                                         class="img-xs rounded-circle"
                                                         alt="<%=request.getContextPath()%>/employee-request-images/${i.fileName}">
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${i.requestStatus eq 'DECLINED'}">
                                                            <div class="badge badge-danger badge-pill">
                                                                <div>${i.requestStatus}</div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="badge badge-success badge-pill"
                                                                 style="cursor: pointer">
                                                                <div>${i.requestStatus}</div>

                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>

                                                    <c:choose>
                                                    <c:when test="${i.requestStatus eq 'PENDING'}">
                                                    <div class="badge badge-danger badge-pill"
                                                         data-toggle="modal"
                                                         data-target="#statusModal"
                                                         onclick="sendReply(${i.id})"
                                                         style="cursor: pointer">
                                                        DECLINE
                                                    </div>
                                                    <div class="badge badge-success badge-pill"
                                                         data-toggle="modal"
                                                         onclick="sendReward(${i.id})"
                                                         data-target="#statusModal" style="cursor: pointer">
                                                        APPROVE
                                                    </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <div>--</div>
                                                    </c:otherwise>
                                                    </c:choose>


                                                <td>
                                                    <a href="deleteRequest?id=${i.id}">
                                                        <i title="Delete Request"
                                                           class="mdi mdi-delete lead text-danger ml-2"></i>
                                                    </a>
                                                </td>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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


    <div class="modal fade" id="statusModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Request</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <f:form class="cmxform" method="post" action="saveReply"
                            modelAttribute="request">
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <f:input id="subject"
                                 path="subject"
                                 class="form-control"
                                 name="subject"
                                 readonly="true"
                                 minlength="2" type="text"/>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <f:textarea id="description"
                                    path="description"
                                    class="form-control"
                                    name="description"
                                    readonly="true"
                                    rows="5" type="text"/>

                    </div>
                    <div id="abc"></div>
                    <f:hidden path="id"/>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
                </f:form>

            </div>
        </div>
    </div>
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
<script src="<%=request.getContextPath()%>/adminResources/custom/js/request.js"></script>


<!-- End custom js for this page-->
</body>

</html>
