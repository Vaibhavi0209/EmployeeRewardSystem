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
    <title>Hr | Queries</title>
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
                        <h4 class="mb-0 text-white">Queries</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#complaintDetailsModal">Add
                        </button>

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
                                            <th>Description</th>
                                            <th>Complaint Date</th>
                                            <th>Reply</th>
                                            <th>Reply Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${complaintList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.subject}</td>
                                                <td>${i.description}</td>
                                                <td>${i.complaintDate}</td>
                                                <td>${i.reply}</td>
                                                <td>${i.replyDate}</td>
                                                <td>
                                                    <c:if test="${i.complaintStatus eq 'PENDING'}">
                                                    <div class="badge badge-danger badge-pill ">PENDING</div>
                                                    </c:if>
                                                    <c:if test="${i.complaintStatus eq 'REPLIED'}">
                                                        <div class="badge badge-success badge-pill ">REPLIED</div>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${i.complaintStatus eq 'PENDING'}">
                                                        <a onclick="getComplaintById(${i.id})">
                                                            <i class="mdi mdi-pencil lead" data-toggle="modal"
                                                               data-target="#complaintDetailsModal" title="Edit Complaint" style="cursor: pointer"></i>
                                                        </a>
                                                    </c:if>

                                                    <a href="deleteComplaint?id=${i.id}">
                                                        <i title="Delete Complaint"
                                                           class="mdi mdi-delete lead text-danger ml-2"
                                                           title="Delete Employee"></i>
                                                    </a>
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

    <!-- Modal starts -->
    <div class="modal fade" id="complaintDetailsModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Queries</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <f:form class="cmxform" id="complaint_form" method="post" action="saveComplaint"
                            modelAttribute="complaint">
                    <fieldset>
                        <div class="form-group">
                            <label  class="required" for="subject">Subject</label> <f:input id="subject"
                                                                          path="subject"
                                                                          class="form-control"
                                                                          name="subject"
                                                                          minlength="2" type="text"/>
                        </div>
                        <div class="form-group">
                            <label  class="required" for="description">Description</label> <f:textarea id="description"
                                                                                     path="description"
                                                                                     class="form-control"
                                                                                     name="description"
                                                                                     rows="5" type="text"/>
                        </div>
                        <div class="form-group">
                            <label  for="reply">Reply</label> <f:textarea id="reply"
                                                                         path="reply"
                                                                         class="form-control"
                                                                         name="reply"
                                                                         rows="5" type="text"/>
                        </div>
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
    <!-- Modal Ends -->

    <!-- Criteria Modal starts-->
    <div class="modal fade" id="criteriaDetailsModal" tabindex="-1" role="dialog"
         aria-labelledby="criteriaModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="criteriaModalLabel">Criteria</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table id="criteria-listing" class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Criteria Name</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
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
<script src="<%=request.getContextPath()%>/adminResources/custom/js/complaint.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>

<!-- End custom js for this page-->
</body>

</html>
