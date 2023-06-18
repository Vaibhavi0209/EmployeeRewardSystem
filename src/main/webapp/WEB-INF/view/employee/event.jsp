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
    <title>Employee | Event</title>
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
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"></jsp:include>

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="card">
                    <div class="card-body">
                        <h4 class="font-weight-normal lead mb-4"
                            style="color: #5e2572 !important;"><b>Upcoming Event</b></h4>
                        <div class="row">
                            <div class="col-12">
                                <div class="row portfolio-grid">
                                    <c:forEach items="${eventList}" var="i" varStatus="j">
                                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12 d-flex">
                                            <figure class="effect-text-in">
                                                <img src="<%=request.getContextPath()%>/event-images/${i.eventImage}"
                                                     alt="<%=request.getContextPath()%>/event-images/${i.eventImage}">
                                                <figcaption>
                                                    <h4>${i.eventName}</h4>
                                                    <p>${i.eventDescription}</p>
                                                </figcaption>
                                            </figure>
                                        </div>
                                    </c:forEach>
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
                <f:form action="saveEvent" method="post" modelAttribute="Event" id="event_form">
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group"><label class="required" for="eventName">Event Name</label>
                                <f:input path="eventName" id="eventName"
                                         class="form-control"
                                         name="eventName"
                                         minlength="2"
                                         maxlength="10" required="required"
                                         type="text"/>
                            </div>
                            <div class="form-group"><label for="eventDescription">Event Description </label>
                                <f:textarea path="eventDescription" id="eventDescription" class="form-control"
                                            name="eventDescription" rows="5" minlength="2" maxlength="1000"
                                            required="required"/> <f:hidden path="id"/></div>
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
<!-- End custom js for this page-->
<!-- Required meta tags -->

<script src="<%=request.getContextPath()%>/adminResources/custom/js/event.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>

</body>
</html>
