<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee | Product</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons-1.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor-1.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-1-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->


    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/owl.theme.default.min.css">

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

        <jsp:include page="menu.jsp"></jsp:include>
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="font-weight-normal lead mb-4"
                                    style="color: #5e2572 !important;"><b>Products</b></h4>
                                <div class="row">
                                    <c:forEach items="${productList}" var="i" varStatus="j">
                                        <div class="col-md-4">
                                            <div class="card mb-4" style="height: 500px">
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <c:forEach items="${i.productImageList}" var="k" begin="1" end="1">
                                                        <div
                                                                style="height: 280px;width: -webkit-fill-available">
                                                            <img alt="image"
                                                                 src="<%=request.getContextPath()%>/product-images/${k.productFileName}"
                                                                 style="width: -webkit-fill-available">
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="mx-4 mt-3">
                                                    <div class="d-flex justify-content-between">
                                                        <h4 class="card-title"><b>${i.productName}</b></h4>
                                                        <h5><b>${i.productRewards}</b></h5>
                                                    </div>

                                                    <p class="card-text">${i.productDescription}</p>
                                                    <p>
                                                    <div class="badge badge-outline-primary badge-pill">${i.categoryId.category}</div>
                                                    </p>
                                                </div>

                                                <div class="mx-2 d-flex align-items-end justify-content-end">

                                                    <c:choose>
                                                        <c:when test="${i.totalProduct == 0}">
                                                            <button type="button"
                                                                    class="btn btn-primary btn-sm"><a
                                                                    style="color:white !important;"
                                                                    disabled>
                                                                Purchase</a>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" class="btn btn-primary btn-sm"><a
                                                                    style="color:white !important;"
                                                                    href="showProductDetails?id=${i.id}">Purchase</a>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="font-weight-normal lead mb-4"
                                    style="color: #5e2572 !important;"><b>Category</b></h4>

                                <form class="forms-sample" action="product" method="post">
                                    <c:if test="${categoryArray eq null}">
                                        <c:forEach items="${productCategoryList}" var="i">
                                            <div class="form-check form-check-flat form-check-primary">
                                                <label class="form-check-label">
                                                    <input type="checkbox" name="category"
                                                           value="${i.id}"
                                                           class="form-check-input">${i.category}
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${categoryArray ne null}">
                                        <c:forEach items="${productCategoryList}" var="i">
                                            <c:forEach items="${categoryArray}" var="k">
                                                <div class="form-check form-check-flat form-check-primary">
                                                    <label class="form-check-label">
                                                        <c:if test="${k eq i.id}">
                                                            <input type="checkbox" name="category"
                                                                   value="${i.id}"
                                                                   checked="checked"
                                                                   class="form-check-input">${i.category}
                                                        </c:if>
                                                        <c:if test="${k ne i.id}">
                                                            <input type="checkbox" name="category"
                                                                   value="${i.id}"
                                                                   class="form-check-input">${i.category}
                                                        </c:if>
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:if>
                                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>

        <jsp:include page="footer.jsp"></jsp:include>


    </div>

    <!-- Modal Image starts -->


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

<script src="<%=request.getContextPath()%>/adminResources/js/owl.carousel.min.js"></script>
<!-- End custom js for this page-->
</body>

</html>
