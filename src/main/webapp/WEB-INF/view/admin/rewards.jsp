<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin | Rewards</title>
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
    <!-- partial:../../partials/_navbar.html -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_settings-panel.html -->

        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

        <!-- partial -->
        <!-- partial:../../partials/_sidebar.html -->
        <jsp:include page="menu.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="card">
                    <div
                            class="card-header custom-card-header d-flex align-items-center justify-content-between">
                        <h4 class="mb-0 text-white">Rewards</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#rewardsModal">Add
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
                                            <th>Rewards Point</th>
                                            <th>Year</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${rewardsList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.rewardsPoint}</td>
                                                <td>${i.year}</td>
                                                <td><a onclick="getRewardsById(${i.id})"><i
                                                        title="Edit Rewards"
                                                        style="cursor:pointer "
                                                        data-toggle="modal"
                                                        data-target="#rewardsModal"
                                                        class="mdi mdi-pencil lead"></i></a><a
                                                        href="deleteRewards?id=${i.id}"><i
                                                        title="Delete Rewards"
                                                        class="mdi mdi-delete lead text-danger ml-2"></i></a></td>
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
    <div class="modal fade" id="rewardsModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">

                <f:form class="cmxform" id="rewards_form" method="post" action="saveRewards"
                        modelAttribute="rewards1">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Rewards</h5>
                        <button type="button" title="Close" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group">
                                <label class="required" for="rewardsPoint">Rewards Point</label> <f:input
                                    path="rewardsPoint"
                                    id="rewardsPoint"
                                    class="form-control" name="rewardsPoint"
                                    minlength="2" type="text" onkeypress="isInputNumber(event)"/>
                            </div>
                            <div class="form-group">
                                <label class="required" for="year">Year </label>
                                <f:hidden path="id"/>

                                <f:input type="number" path="year" id="year"
                                         class="form-control" name="year" placeholder="YYYY" min="1999" max="2050"/>
                                <script>
                                    document.querySelector("input[type=number]")
                                        .oninput = e => console.log(new Date(e.target.valueAsNumber, 0, 1))
                                </script>
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
<script src="<%=request.getContextPath()%>/adminResources/custom/js/rewards.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

<!-- End custom js for this page-->
</body>

</html>
