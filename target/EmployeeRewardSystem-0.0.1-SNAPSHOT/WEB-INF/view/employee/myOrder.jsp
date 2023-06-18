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
    <title>Employee | MyOrder</title>
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
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between ">
                            <h4 class="font-weight-normal lead mb-4" style="color:#5e2572;"><b>My Order</b>
                            </h4>
                        </div>
                        <div class="accordion" id="accordion" role="tablist">
                            <c:forEach items="${cartMap}" var="i" varStatus="j">
                                <c:forEach items="${i.value}" var="info">
                                    <%--                                    ${info} - - ${i}--%>

                                    <div class="card">
                                    <div class="card-header" role="tab" id="heading-${j.count}">
                                        <h6 class="mb-0">
                                            <a data-toggle="collapse" href="#collapse-${j.count}" aria-expanded="false"
                                               aria-controls="collapse-${j.count}" class="collapsed"
                                               onclick="getOrderDetails(`${i.key}`)">
                                                    ${j.count}. Order &nbsp;(#${i.key})
                                            </a>
                                        </h6>
                                    </div>
                                    <div id="collapse-${j.count}" class="collapse" role="tabpanel"
                                         aria-labelledby="heading-${j.count}"
                                         data-parent="#accordion" style="">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="table-responsive shopping-summery table-bordered">
                                                        <table class="table table-wishlist">
                                                            <thead>
                                                            <tr class="main-heading">
                                                                <th class="custome-checkbox start pl-30">
                                                                    #
                                                                </th>
                                                                <th>Product</th>
                                                                <th>Product Name</th>
                                                                <th>Rewards</th>
                                                            </tr>
                                                            </thead>

                                                            <tbody id="orderTableBody-${i.key}"></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </div>
                            </c:forEach>

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

    <script type="text/javascript">

        function getOrderDetails(orderId) {
            console.log("orderId:::::", orderId);
            $.ajax({
                type: "GET", url: "getOrderDetails?orderId=" + orderId,
                context: document.body,
                success: function (response) {
                    if (response && response.length > 0) {
                        console.log(response)
                        let tableRow = '';
                        for (const index in response) {
                            let indexNo = 1;
                            const productName = response[index].productName;
                            const productRewards = response[index].productRewards;
                            const fileName = response[index].productImageList[0].productFileName
                            console.log("fileName ::", response[index]);
                            tableRow = tableRow + '<tr>'
                            tableRow = tableRow + '<td>' + indexNo + '</td>'
                            tableRow = tableRow + '<td><img src="<%=request.getContextPath()%>/product-images/' + fileName + '"></td>'
                            tableRow = tableRow + '<td>' + productName + '</td>'
                            tableRow = tableRow + '<td>' + productRewards + '</td>'
                            tableRow = tableRow + '</tr>'

                            indexNo++;
                        }
                        $('#orderTableBody-' + orderId).html(tableRow)

                    }

                }
            });

        }

    </script>

    <!-- End custom js for this page-->
</body>

</html>

