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
    <title>Admin | Badge</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <link href="path/to/select2.min.css" rel="stylesheet"/>
    <script src="path/to/select2.min.js"></script>
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
                        <h4 class="mb-0 text-white">Badge</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#badgeDetailsModal">Add
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
                                            <th>Badge Name</th>
                                            <th>Badge Description</th>
                                            <th>Badge Rewards</th>
                                            <th>Badge Image</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${badgeList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.badgeName}</td>
                                                <td>${i.badgeDescription}</td>
                                                <td>${i.badgeRewards}</td>
                                                <td>
                                                    <img src="<%=request.getContextPath()%>/badge-images/${i.badgeImage}"
                                                         img-xs rounded-circle
                                                         alt="<%=request.getContextPath()%>/badge-images/${i.badgeImage}">
                                                </td>
                                                <td>

                                                    <a onclick="getCritaria(${i.id})" data-toggle="modal"
                                                       data-target="#criteriaDetailsModal"><i
                                                            class="mdi mdi-information-outline lead mr-1 mt-1"
                                                            title="Badge Info" style="cursor: pointer"></i> </a>
                                                    <a onclick="getBadgeById(${i.id})">
                                                        <i class="mdi mdi-pencil lead" data-toggle="modal"
                                                           data-target="#badgeDetailsModal" title="Edit Badge"
                                                           style="cursor: pointer"></i>
                                                    </a>
                                                    <a href="deleteBadge?id=${i.id}">
                                                        <i class="mdi mdi-delete lead text-danger ml-2"
                                                           title="Delete Badge"></i>
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
    <div class="modal fade" id="badgeDetailsModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Badge</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <f:form class="cmxform" id="badge_form" method="post" action="saveBadge" modelAttribute="Badge"
                            enctype="multipart/form-data">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="required" for="badgeName">Badge Name</label> <f:input id="badgeName"
                                                                                                        path="badgeName"
                                                                                                        class="form-control"
                                                                                                        name="badgeName"
                                                                                                        minlength="2"
                                                                                                        type="text"/>
                                </div>
                                <div class="form-group">
                                    <label for="badgeDescription">Badge Description </label>
                                    <f:textarea id="badgeDescription" path="badgeDescription" class="form-control"
                                                name="comment" rows="5"/>
                                    <f:hidden path="id"/>

                                </div>
                                <div class="form-group">
                                    <label class="required" for="badgeRewards">Badge Rewards</label> <f:input
                                        id="badgeRewards"
                                        path="badgeRewards"
                                        class="form-control"
                                        name="badgeRewards"
                                        minlength="2" type="text" onkeypress="isInputNumber(event)"/>
                                </div>
                                <div class="form-group">
                                    <label>File upload</label>

                                    <input type="file" id="multipartFile" name="multipartFile"
                                           class="file-upload-default"/>
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" disabled=""
                                               placeholder="Upload Image"
                                        >
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button"
                                            >Upload</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">


                                <div class="row form-group">
                                    <div class="col-md-10">
                                        <label>Criteria to avail this Badge</label>
                                        <input path="cn"
                                               id="cn" class="form-control" name="name" type="text"/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" value="+" id="sub" onclick="addCriteria()"
                                                class="btn btn-info btn-sm icon-btn ml-2 mt-4">
                                            <i class="mdi mdi-plus"></i>
                                        </button>
                                        <button class="btn btn-info btn-sm icon-btn ml-2 mt-4 " type="button" value="+"
                                                id="upd"
                                                onclick="updteCriteria()" style="display:none;"><i
                                                class="mdi mdi-plus"></i>
                                        </button>
                                        <br><br>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table" id="box">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Criteria</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody id="editCriteria">

                                        </tbody>
                                    </table>
                                </div>

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
    <!-- Modal Ends -->

    <!-- Criteria Modal starts-->
    <div class="modal fade" id="criteriaDetailsModal" tabindex="-1" role="dialog"
         aria-labelledby="criteriaModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="criteriaModalLabel">Criteria</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table id="criteria-listing" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
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
<script src="<%=request.getContextPath()%>/adminResources/js/file-upload.js"></script>

<!-- endinject -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/badge.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

<!-- End custom js for this page-->
</body>

</html>
