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
    <title>Employee | Cart</title>
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
                                <div class="d-flex justify-content-between ">

                                    <h4 class="font-weight-normal lead mb-4" style="color:#5e2572;"><b>Your cart</b>
                                    </h4>
                                    <h6 class="text-body"><a href="deleteAllCart" class="text-muted"
                                                             style="color: #5e2572 !important;"><i
                                            class="mdi mdi-trash-can"></i>Clear
                                        Cart</a></h6>
                                </div>


                                <div class="table-responsive shopping-summery table-bordered">
                                    <table class="table table-wishlist">
                                        <thead>
                                        <tr class="main-heading">
                                            <th class="custome-checkbox start pl-30">
                                                #
                                            </th>
                                            <th scope="col" colspan="2">Product</th>
                                            <th scope="col">Product Point</th>
                                            <th scope="col" class="end">Remove</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${cartList}" var="i" varStatus="j">
                                            <tbody>
                                            <tr class="pt-30">

                                                <td class="custome-checkbox pl-30">
                                                        ${j.count}
                                                </td>
                                                <td>
                                                    <c:forEach items="${i.productId.productImageList}" var="s"
                                                               begin="1" end="1">

                                                        <img alt="image"
                                                             src="<%=request.getContextPath()%>/product-images/${s.productFileName}"
                                                             style="height: 100px ; width: 100px ; border-radius: 0px">

                                                    </c:forEach>
                                                </td>

                                                <td>
                                                    <h5 class="text-brand"
                                                        style="margin-right: 10rem">${i.productId.productName}</h5>
                                                </td>


                                                <td class="price" data-title="Price">
                                                    <h5 class="text-brand">${i.productRewards}</h5>
                                                </td>

                                                <td class="action text-center" data-title="Remove"><a
                                                        href="deleteCart?id=${i.id}"
                                                        class="text-body"><i style="color:#5e2572;cursor: pointer"
                                                                             class="mdi mdi-trash-can"></i></a></td>


                                            </tr>


                                            </tbody>

                                        </c:forEach>
                                    </table>


                                </div>
                            </div>
                        </div>

                        <div class="mt-3">
                            <a href="product"><i class="mdi mdi-subdirectory-arrow-left mr-1"></i>Continue Shopping</a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="border p-md-4 cart-totals ml-30">
                                    <div class="table-responsive">
                                        <table class="table no-border">
                                            <tbody>
                                            <tr>
                                                <td class="cart_total_label">
                                                    <h6 class="text-muted">Subtotal</h6>
                                                </td>
                                                <td class="cart_total_amount">
                                                    <h4 class="text-brand text-end">${subTotal.get(0)}</h4>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td class="cart_total_label">
                                                    <h6 class="text-muted">Total</h6>
                                                </td>
                                                <td class="cart_total_amount">
                                                    <h4 class="text-brand text-end">${subTotal.get(0)}</h4>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <button type="button"
                                            class="btn btn-primary mb-20 w-100"><a
                                            style="color:white !important;"
                                            href="getCartDetails">Proceed To CheckOut<i
                                            class="mdi mdi-subdirectory-arrow-right ml-1"></i></a>
                                    </button>

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
<script src="<%=request.getContextPath()%>/adminResources/custom/js/cart.js"></script>

<!-- End custom js for this page-->
</body>

</html>

