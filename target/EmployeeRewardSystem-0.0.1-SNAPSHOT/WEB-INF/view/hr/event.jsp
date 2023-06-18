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
    <title>Hr | Event</title>
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
                        <h4 class="mb-0 text-white">Event</h4>

                        <button class="btn btn-primary" data-toggle="modal"
                                data-target="#eventModal">Add
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
                                            <th>Event Description</th>
                                            <th>Event Image</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${eventList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>${i.eventName}</td>
                                                <td>${i.eventDescription}</td>
                                                <td> <img src="<%=request.getContextPath()%>/event-images/${i.eventImage}"
                                                          img-xs rounded-circle
                                                          alt="<%=request.getContextPath()%>/event-images/${i.eventImage}">
                                                </td>
                                                <td><a onclick="getEventById(${i.id})"> <i title="Edit Event"
                                                                                           data-toggle="modal"
                                                                                           data-target="#eventModal"
                                                                                           class="mdi mdi-pencil lead"
                                                                                           style="cursor: pointer"></i>
                                                </a> <a href="deleteEvent?id=${i.id}"> <i title="Delete Event"
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
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Event</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <f:form action="saveEvent" method="post" modelAttribute="Event" id="event_form"  enctype="multipart/form-data">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group"><label class="required" for="eventName">Event Name</label>
                                <f:input path="eventName" id="eventName"
                                         class="form-control"
                                         name="eventName"
                                         minlength="2"
                                         required="required"
                                         type="text"/>
                            </div>
                            <div class="form-group"><label for="eventDescription">Event Description </label>
                                <f:textarea path="eventDescription" id="eventDescription" class="form-control"
                                            name="eventDescription" rows="5" minlength="2" maxlength="1000"
                                           /> <f:hidden path="id"/>
                            </div>

                            <div class="form-group">
                                <label>File upload</label>

                                <input type="file" id="multipartFile" name="multipartFile"
                                       class="file-upload-default"/>
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
<script src="<%=request.getContextPath()%>/adminResources/js/file-upload.js"></script>

<!-- endinject -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
<!-- End custom js for this page-->
<!-- Required meta tags -->

<script src="<%=request.getContextPath()%>/adminResources/custom/js/event.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

</body>
</html>
