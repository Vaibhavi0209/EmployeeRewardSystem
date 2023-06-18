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
    <title>Hr | Employee</title>
    <!-- plugins:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/jquery.tagsinput.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-editable.css">


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
                        <h4 class="mb-0 text-white">Employee</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#employeeDetailsModal">Add
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
                                            <th>Employee</th>
                                            <th>Employee ID</th>
                                            <th>Employee Name</th>
                                            <th>Email</th>
                                            <th>Phone No</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${employeeList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${i.gender eq 'female' && i.employeeFileName eq null}">
                                                            <img src="<%=request.getContextPath()%>/adminResources/image/female.png"
                                                                 class="img-xs rounded-circle"
                                                                 alt="<%=request.getContextPath()%>/adminResources/image/female.png">
                                                        </c:when>
                                                        <c:when test="${i.gender eq 'male' && i.employeeFileName eq null}">
                                                            <img src="<%=request.getContextPath()%>/adminResources/image/face7.jpg"
                                                                 class="img-xs rounded-circle"
                                                                 alt="<%=request.getContextPath()%>/adminResources/image/face7.jpg">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="<%=request.getContextPath()%>/employee-images/${i.employeeFileName}"
                                                                 class="img-xs rounded-circle"
                                                                 alt="<%=request.getContextPath()%>/employee-images/${i.employeeFileName}">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${i.employeeId}</td>
                                                <td>${i.employeeName}</td>
                                                <td>${i.email}</td>
                                                <td>${i.phoneNo}</td>
                                                <td>
                                                    <a onclick="getEmployeeInfo(${i.id})" data-toggle="modal"
                                                       data-target="#EmpDetails"><i
                                                            class="mdi mdi-information-outline lead mr-1 mt-1"
                                                            title="Employee Info" style="cursor: pointer"></i> </a>

                                                    <a onclick="getEmployeeById(${i.id})">
                                                        <i data-toggle="modal"
                                                           data-target="#employeeDetailsModal"
                                                           class="mdi mdi-pencil lead" title="Edit Employee"
                                                           style="cursor: pointer"></i>
                                                    </a>
                                                    <a href="deleteEmployee?id=${i.id}">
                                                        <i class="mdi mdi-delete lead text-danger ml-2"
                                                           title="Delete Employee"></i>
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
    <div class="modal fade" id="employeeDetailsModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <f:form class="cmxform" method="post" action="saveEmployee"
                            modelAttribute="employee" enctype="multipart/form-data" id="employee_form">
                    <fieldset>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="required" for="employeeName">Employee Name</label> <f:input
                                    id="employeeName"
                                    path="employeeName"
                                    class="form-control"
                                    name="employeeName"
                                    minlength="2"
                                    type="text"
                            />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="employeeName">Skills</label> <input
                                    id="skills"
                                    class="form-control"
                                    name="skills"
                                    minlength="2"
                                    type="text"
                            />
                            </div>
                            <div class="form-group col-md-4">
                                <label>File upload</label>

                                <input type="file" id="multipartFile" name="multipartFile"
                                       class="file-upload-default"/>
                                <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled=""
                                           placeholder="Upload Image" id="fileName"
                                    >
                                    <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button"
                                            >Upload</button>
                                        </span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <div id="skillDetails"></div>
                            </div>
                        </div>


                        <div class="row">
                            <div style="display:none">
                                <div class="form-group">
                                    <label for="employeeId">Employee ID</label> <f:input id="employeeId"
                                                                                         path="employeeId"
                                                                                         class="form-control"
                                                                                         name="employeeId"
                                                                                         disabled="true"
                                                                                         minlength="2" type="text"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required" for="jobRoleId">Role</label>
                                    <f:select path="jobRoleId.id" id="jobRoleId" class="form-control"
                                              required="required">
                                        <option value="0" selected>Select Role</option>
                                        <c:forEach items="${jobRoleList}" var="i">
                                            <f:option value="${i.id}">
                                                ${i.jobRoleName}
                                            </f:option>
                                        </c:forEach>
                                    </f:select>
                                </div>
                            </div>


                            <div class="col-md-9">
                                <div class="row">

                                    <div class="col-md-6">
                                        <label class="required"
                                               class="mr-3 d-flex justify-content-center">Gender</label>
                                        <div class="d-flex justify-content-center">
                                            <div class="form-check mr-5">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="gender"
                                                           id="male" value="male" checked="">
                                                    Male
                                                    <i class="input-helper"></i></label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="gender"
                                                           id="female" value="female">
                                                    Female
                                                    <i class="input-helper"></i></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="required" class="mr-3">State</label>
                                        <f:select path="stateId.id" id="stateId" class="form-control"
                                                  onchange="getCity(0,this.value)">
                                            <option value="0" selected>Select State</option>
                                            <c:forEach items="${stateList}" var="i">
                                                <f:option value="${i.id}">
                                                    ${i.stateName}
                                                </f:option>
                                            </c:forEach>
                                        </f:select>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="required" class="mr-3">City</label>
                                        <f:select path="cityId.id" id="cityId" class="form-control">
                                        </f:select>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required" for="email">Email ID</label> <f:input id="email"
                                                                                                  path="email"
                                                                                                  class="form-control"
                                                                                                  name="email"
                                                                                                  minlength="2"
                                                                                                  type="email"
                                />
                                </div>
                            </div>
                            <div class="col-md-3">

                                <div class="form-group">
                                    <label class="required" for="phoneNo">Phone No</label> <f:input path="phoneNo"
                                                                                                    id="phoneNo"
                                                                                                    class="form-control"
                                                                                                    name="phoneNo"
                                                                                                    minlength="10"
                                                                                                    maxLength="12"
                                                                                                    type="text"
                                                                                                    onkeypress="isInputNumber(event)"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required" for="dob">Date Of Birth</label>
                                    <div id="datepicker-popup" class="input-group date datepicker">
                                        <f:input type="date" id="dob" class="form-control" path="dob"/>
                                        <span class="input-group-addon input-group-append border-left">
                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="required" for="pinCode">PinCode</label>
                                    <f:input id="pinCode"
                                             path="pinCode"
                                             class="form-control"
                                             name="pinCode"
                                             minlength="6" maxlength="6" type="numericonly"
                                             onkeypress="isInputNumber(event)"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address">Address</label>
                            <f:textarea
                                    path="address"
                                    id="address"
                                    class="form-control" name="address" maxlength="500"
                                    rows="4"/>

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

    <!-- Employee Details Modal starts-->

    <div class="modal fade" id="EmpDetails" tabindex="-1" role="dialog"
         aria-labelledby="EmpDetailsLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="criteriaModalLabel">Employee Details</h5>
                    <button type="button" title="Close" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table" border="1px">
                            <tbody id="employeeBody">
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
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.tagsinput.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.inputmask.bundle.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/inputmask.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/form-repeater.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/x-editable.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/form-addons.js"></script>


<!-- endinject -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/custom/js/validation.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/custom/js/employee.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<!-- End custom js for this page-->
</body>

</html>
