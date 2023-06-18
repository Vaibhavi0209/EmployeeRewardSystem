<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin | Product</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/lightgallery.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/jquery.tagsinput.min.css">

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
                        <h4 class="mb-0 text-white">Product</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#productModal">Add
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
                                            <th>Product Name</th>
                                            <th>Product Description</th>
                                            <th>Product Rewards</th>
                                            <th>Product category</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${productList}" var="i" varStatus="j">

                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.productName}</td>
                                                <td>${i.productDescription}</td>
                                                <td>${i.productRewards}</td>
                                                <td>${i.categoryId.category}</td>
                                                <td><a data-toggle="modal"
                                                       data-target="#productImageModal"
                                                       onclick="getProductImage(${i.id})"> <i title="view Image"
                                                                                              class=" mdi mdi-information-outline lead mr-1"
                                                                                              style="cursor: pointer"></i></a>
                                                    <a onclick="getProductById(${i.id})"> <i title="Edit Product"
                                                                                             data-toggle="modal"
                                                                                             data-target="#productModal"
                                                                                             class="mdi mdi-pencil lead"
                                                                                             style="cursor: pointer"></i>
                                                    </a> <a href="deleteProduct?id=${i.id}"> <i title="Delete Product"
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

    <!-- Modal starts -->
    <div class="modal fade" id="productModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <f:form action="saveProduct" id="product_form" method="post" modelAttribute="Product1"
                        enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                        <button type="button" title="Close" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label class="required">Product Category</label>
                                        <f:select id="categoryId" path="categoryId.id" class="form-control"
                                                  required="required">
                                            <option disabled="disabled" selected="selected">Select Product Category
                                            </option>
                                            <c:forEach items="${productCategoryList}" var="i">
                                                <f:option value="${i.id}">${i.category}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="required">Product Name</label>
                                        <f:input path="productName" name="productName" id="productName"
                                                 class="form-control"
                                                 minlength="2" placeholder="Product Name"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="required">Product Rewards</label> <f:input path="productRewards"
                                                                                                 name="productRewards"
                                                                                                 id="productRewards"
                                                                                                 class="form-control"
                                                                                                 minlength="2"
                                                                                                 placeholder="Product Rewards"
                                                                                                 onkeypress="isInputNumber(event)"/>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="required">Supplier Name</label>
                                        <f:select id="supplierId" path="supplierId.id"
                                                  class="form-control" required="required">
                                            <option disabled="disabled" selected="selected">Select Supplier Name
                                            </option>
                                            <c:forEach items="${supplierList}" var="i">
                                                <f:option value="${i.id}">${i.supplierName}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="required">Total Product</label> <f:input path="totalProduct"
                                                                                               name="totalProduct"
                                                                                               id="totalProduct"
                                                                                               class="form-control"
                                                                                               placeholder="Total Product"
                                                                                               onkeypress="isInputNumber(event)"/>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Product Description </label>
                                        <f:textarea path="productDescription" class="form-control"
                                                    id="productDescription"
                                                    name="productDescription" rows="5"
                                                    placeholder="Product Description" minlength="2"/>
                                        <f:hidden path="id"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>File upload</label>

                                        <input type="file" id="multipartFileList" name="multipartFileList"
                                               class="file-upload-default" multiple/>
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
                                    <div class="form-group" id="data">
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


    <!-- Modal Image starts -->
    <div class="modal fade" id="productImageModal" tabindex="-1" role="dialog"
         aria-labelledby="productImageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="productImageModalLabel">Product Image</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body">
                    <fieldset>
                        <div class="main-panel">
                            <div class="row grid-margin">
                                <div class="col-lg-12">
                                    <div id="lightgallery" class="row lightGallery">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>


            </div>
        </div>
    </div>
    <!-- Modal Image Ends -->


</div>

<!-- container-scroller -->

<!-- plugins:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->

<!-- Plugin js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/dataTables.bootstrap4.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/sweetalert.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.avgrund.min.js"></script>
<!-- End plugin js for this page-->

<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/lightgallery-all.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/file-upload.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.tagsinput.min.js"></script>
<!-- endinject -->

<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/custom/js/product.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/productImage.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/js/alerts.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/avgrund.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

<!-- End custom js for this page-->
</body>

</html>
