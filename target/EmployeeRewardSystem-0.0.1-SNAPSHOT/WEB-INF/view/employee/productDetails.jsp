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
    <title>Employee | ProductDetails</title>
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
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-8">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-md-4">
                                        <c:forEach items="${productDetails.productImageList}" var="k" begin="1" end="1">

                                            <img alt="image"
                                                 src="<%=request.getContextPath()%>/product-images/${k.productFileName}">

                                        </c:forEach>
                                    </div>
                                    <div class="col-md-8">

                                        <div class=" d-flex">
                                            <h1 class="card-text">${productDetails.productName}</h1>
                                        </div>
                                        <p class="card-text">${productDetails.productDescription}</p>
                                        <div class="mt-3 badge badge-outline-primary badge-pill">${productDetails.categoryId.category}</div>
                                        <div class="mt-2"><b>available: </b>${productDetails.totalProduct}</div>
                                        <div class="card-text mt-2"><b>Rewards: </b>${productDetails.productRewards}
                                        </div>
                                        <div class="d-flex justify-content-end modal-footer mt-3">
                                            <button type="button"
                                                    class="btn btn-primary btn-sm"><a
                                                    style="color:white !important;"
                                                    href="addToCart?id=${productDetails.id}">Add To Cart</a>
                                            </button>
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
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="<%=request.getContextPath()%>/adminResources/js/dashboard.js"></script>

    <script src="<%=request.getContextPath()%>/adminResources/js/profile-demo.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/jquery.barrating.min.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/custom/js/teamDetails.js"></script>

    <!-- End custom js for this page-->
</body>

</html>

