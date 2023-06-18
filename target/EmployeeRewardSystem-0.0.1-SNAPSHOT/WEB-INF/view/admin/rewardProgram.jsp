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
    <title>Admin | Reward Program</title>
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
                        <h4 class="mb-0 text-white">Event Reward</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#rewardProgramModal">Add
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
                                            <th>Event Name</th>
                                            <th>Event Date</th>
                                            <th> Total Reward </th>
                                            <th>Reward for Winner</th>
                                            <th>Reward for RunnerUp</th>
                                            <th>Status</th>
                                            <th>Approved</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${rewardProgramList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.eventId.eventName}</td>
                                                <td>${i.eventDate}</td>
                                                <td>${i.totalRewards}</td>
                                                <td>${i.rewardWinner}</td>
                                                <td>${i.rewardRunnerUp}</td>
                                                <td>
                                                    <c:if test="${i.rewardStatus eq 'PENDING'}">
                                                        <div class="badge badge-danger badge-pill ">PENDING</div>
                                                    </c:if>
                                                    <c:if test="${i.rewardStatus eq 'APPROVED'}">
                                                        <div class="badge badge-success badge-pill ">${i.rewardStatus}</div>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${i.rewardStatus eq 'APPROVED'}">
                                                    </c:if>
                                                    <c:if test="${i.rewardStatus eq 'PENDING'}">
                                                        <a href="statusRewardProgram?id=${i.id}">Approved</a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${i.rewardStatus eq 'APPROVED'}">
                                                    </c:if>

                                                    <c:if test="${i.rewardStatus eq 'PENDING'}">
                                                        <a onclick="getRewardProgramById(${i.id})"><i
                                                                title="Edit Reward Program" data-toggle="modal"
                                                                data-target="#rewardProgramModal"
                                                                class="mdi mdi-pencil lead" style="cursor: pointer"></i></a>
                                                        <a
                                                                href="deleteRewardProgram?id=${i.id}"><i
                                                                title="Delete Reward Program"
                                                                class="mdi mdi-delete lead text-danger ml-2"></i></a>
                                                    </c:if>
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
    <div class="modal fade" id="rewardProgramModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <f:form class="cmxform" id="eventReward_form" method="post" action="saveRewardProgram"
                        modelAttribute="RewardProgram">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Event Reward</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label class="required">Event Name</label>
                                        <f:select id="eventId" path="eventId.id" class="form-control"
                                                  required="required">
                                            <option disabled="disabled" selected="selected">Select Event</option>
                                            <c:forEach items="${eventList}" var="i">

                                                <f:option value="${i.id}">${i.eventName}</f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="required">Event Date</label>
                                        <f:input path="eventDate" name="eventDate" id="eventDate" class="form-control"
                                                 type="date" required="required"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Reward Point Scheme:</label>

                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label class="required"> Total Rewards</label>
                                        <f:input path="totalRewards" name="totalRewards" id="totalRewards"
                                                 class="form-control"
                                                 minlength="2" placeholder=" Total Reward  " required="required"
                                                 onkeypress="isInputNumber(event)"/>
                                        <f:hidden path="id"/>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="required"> Winner</label>
                                        <f:input path="rewardWinner" name="rewardWinner" id="rewardWinner"
                                                 class="form-control"
                                                 onkeypress="isInputNumber(event)"
                                                 minlength="2" placeholder="Reward Winner" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="required"> RunnerUp</label>
                                        <f:input path="rewardRunnerUp"
                                                 name="rewardRunnerUp"
                                                 id="rewardRunnerUp"
                                                 class="form-control"
                                                 minlength="2"
                                                 placeholder="Reward RunnerUp" required="required"
                                                 onkeypress="isInputNumber(event)"/>
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
<script src="<%=request.getContextPath()%>/adminResources/custom/js/rewardProgram.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>


<!-- End custom js for this page-->
</body>

</html>
