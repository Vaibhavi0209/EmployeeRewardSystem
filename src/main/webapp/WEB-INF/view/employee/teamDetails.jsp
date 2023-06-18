<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee | Teams</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons-1.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor-1.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/bootstrap-1-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/horizontal-css.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/chat.css">

    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/css/favicon.png"/>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg"/>

    <style>
        .team-member:hover {
            cursor: pointer;
            background: rgb(230, 233, 237);
        }

        .teamCss {
            height: 50px;
        }
    </style>

</head>
<body class="sidebar-light">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->


    <jsp:include page="header.jsp"></jsp:include>


    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="email-wrapper wrapper vh-60">
                    <div class="row align-items-stretch">
                        <div class="mail-sidebar d-none d-lg-block col-md-3 pt-3 bg-white" style="height: 30%">
                            <div class="menu-bar border-right">
                                <div class="wrapper">
                                    <div class="d-flex mx-3 my-2">
                                        <h4><i class="mdi mdi-account-multiple menu-icon ml-4"
                                               style="color:#5e2572;"></i>
                                            <h4 class="font-weight-normal lead ml-4 mb-2"
                                                style="color: #5e2572 !important;">
                                                <b>Your Teams</b></h4>
                                        </h4>
                                    </div>

                                </div>

                                <div class="profile-list scroll" id="finalResult">
                                </div>


                            </div>
                        </div>
                        <div class="mail-view d-none d-md-block col-md-9 bg-white">
                            <div class="row">
                                <div class="col-md-12 mb-4 mt-4">

                                    <div class="btn-toolbar">
                                        <div style="width: -webkit-fill-available;">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link" id="chat-tab" data-toggle="tab" href="#chat"
                                                       role="tab" aria-controls="chat-1" aria-selected="false"> <i
                                                            class="mdi mdi-chat-processing"></i>Chat
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="members-tab" data-toggle="tab"
                                                       href="#members" role="tab" aria-controls="members-1"
                                                       aria-selected="false">
                                                        <i class="mdi mdi-account-multiple"></i>
                                                        Member
                                                    </a>
                                                </li>
                                            </ul>

                                            <div class="tab-content" style="width: -webkit-fill-available">
                                                <div class="tab-pane fade active show" id="chat" role="tabpanel"
                                                     aria-labelledby="chat-tab">
                                                    <div class="media">
                                                        <div class="media-body">
                                                            <div class="scroll">
                                                                <main class="msger-chat">
                                                                    <div class="msg left-msg">

                                                                        <div class="msg-bubble">
                                                                            <div class="msg-info">
                                                                                <div class="msg-info-name">BOT</div>
                                                                                <div class="msg-info-time">12:45</div>
                                                                            </div>

                                                                            <div class="msg-text">
                                                                                Hi, welcome to SimpleChat! Go ahead and
                                                                                send me a message. ?
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="msg right-msg">

                                                                        <div class="msg-bubble">
                                                                            <div class="msg-info">
                                                                                <div class="msg-info-name"
                                                                                     id="empName">${employeeName.employeeName}</div>
                                                                                <div class="msg-info-time">12:46</div>
                                                                            </div>

                                                                            <div class="msg-text">
                                                                                You can change your name in JS section!
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </main>
                                                            </div>
                                                            <form class="msger-inputarea">
                                                                <input type="text" class="msger-input"
                                                                       placeholder="Enter your message...">
                                                                <button type="submit" class="btn-primary">Send
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade active" id="members" role="tabpanel"
                                                     aria-labelledby="members-tab">
                                                    <div class="media">
                                                        <div class="media-body">
                                                            <ul id="member-details">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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

            <nav class="bottom-navbar">
                <jsp:include page="footer.jsp"></jsp:include>

            </nav>

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
    <script src="<%=request.getContextPath()%>/adminResources/custom/js/chat.js"></script>


    <!-- End custom js for this page-->
</body>
<style>
    .scroll {
        overflow-x: hidden;
        overflow-y: scroll;
        height: 450px;
    }
</style>
</html>

