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
    <title>Hr | Team</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css"/>
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/select2.min.css"/>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css"/>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css"/>

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
                        <h4 class="mb-0 text-white">Team</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#teamModal" >Add
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
                                            <th>Team Name</th>
                                            <th>Team Description</th>
                                            <th>Team Member</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${teamList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.teamName}</td>
                                                <td>${i.teamDescription}</td>
                                                <td><a onclick="getTeamMember(${i.id})"><i title="View Team Members"
                                                                                           data-toggle="modal"
                                                                                           data-target="#TeamMemberModal"
                                                                                           class="mdi mdi-account-multiple lead ml-2"
                                                                                           style="cursor: pointer"></i></a>
                                                </td>
                                                <td>
                                                    <a onclick="getTeamById(${i.id})"> <i
                                                            data-toggle="modal"
                                                            data-target="#teamModal" title="Edit team"
                                                            style="cursor: pointer"
                                                            class="mdi mdi-pencil lead ml-2"></i>
                                                    </a>
                                                    <a href="teamDelete?id=${i.id}"> <i title="Delete team"
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
    <div class="modal fade" id="teamModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add team</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <f:form action="saveTeam" method="post" modelAttribute="Team" id="team_form">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group"><label class="required" for="teamName">Team Name</label>
                                <f:input path="teamName" id="teamName"
                                         class="form-control"
                                         name="teamName"
                                         minlength="2"
                                         type="text"/>
                            </div>
                            <div class="form-group">
                                <label for="teamDescription">
                                    Description </label>
                                <f:textarea path="teamDescription" id="teamDescription" class="form-control"
                                            name="teamDescription" rows="5"/>
                            </div>

                            <div class="form-group">
                                <label class="required">Team Members</label><br>
                                <select id="teamMember" class="form-control js-example-basic-multiple"
                                        multiple="true" name="teamMembers">
                                    <c:forEach items="${employeeList}" var="i">
                                        <option value="${i.id}">${i.employeeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <f:hidden path="id"/>

                            <div id="data"></div>
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


    <div class="modal fade" id="TeamMemberModal" tabindex="-1" role="dialog"
         aria-labelledby="TeamMemberLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="employeeTeam">
                    </h5>
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
                                <th>Employee</th>
                                <th>Team Member</th>
                                <th>Role</th>
                            </tr>
                            </thead>
                            <tbody id="teamBody">
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
<!-- End custom js for this page-->
<!-- Required meta tags -->
<script src="<%=request.getContextPath()%>/adminResources/js/select2.min.js"></script>

<script>
    $('.js-example-basic-multiple').select2({
        placeholder: 'Select Team Members',
        width: 'resolve'
    });
</script>

<script src="<%=request.getContextPath()%>/adminResources/custom/js/team.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
</body>
</html>
