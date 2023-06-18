<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin | Supplier</title>
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
                        <h4 class="mb-0 text-white">Supplier</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#supplierModal">Add
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
                                            <th>Supplier Name</th>
                                            <th>Email</th>
                                            <th>Phone No</th>
                                            <th>Supplier Description</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${supplierList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.supplierName}</td>
                                                <td>${i.email}</td>
                                                <td>${i.phoneNo}</td>
                                                <td>${i.supplierDescription}</td>
                                                <td><a onclick="getSupplierById(${i.id})"> <i data-toggle="modal"
                                                                                              data-target="#supplierModal"
                                                                                              title="Edit Supplier"
                                                                                              class="mdi mdi-pencil lead"
                                                                                              style="cursor: pointer"></i>
                                                </a> <a href="deleteSupplier?id=${i.id}"> <i title="Delete Supplier"
                                                                                             class="mdi mdi-delete lead text-danger ml-2"></i>
                                                </a></td>
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
    <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

    <!-- Modal starts -->
    <div class="modal fade" id="supplierModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Supplier</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <f:form action="saveSupplier" id="supplier_form" method="post" modelAttribute="Supplier">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group"><label class="required" for="supplierName">Supplier Name</label>
                                <f:input path="supplierName" id="supplierName"
                                         class="form-control"
                                         name="supplierName"
                                         minlength="2"
                                         type="text"/>
                            </div>

                            <div class="form-group"><label class="required" for="email">Email</label>
                                <f:input path="email" id="email"
                                         class="form-control"
                                         name="email"
                                         minlength="2"
                                         type="email"/>
                            </div>

                            <div class="form-group"><label class="required" for="phoneNo">Phone No</label>
                                <f:input path="phoneNo" id="phoneNo"
                                         class="form-control"
                                         name="phoneNo"
                                         onkeypress="isInputNumber(event)"
                                />
                            </div>

                            <div class="form-group">
                                <label for="supplierDescription">Supplier Description </label>
                                <f:textarea id="supplierDescription" path="supplierDescription" class="form-control"
                                            name="comment" rows="5"/>

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

</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/dataTables.bootstrap4.js"></script>


<script src="<%=request.getContextPath()%>/adminResources/js/form-validation.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/bt-maxLength.js"></script>


<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/bootstrap-maxlength.min.js"></script>
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

<script src="<%=request.getContextPath()%>/adminResources/custom/js/supplier.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
</body>
</html>
