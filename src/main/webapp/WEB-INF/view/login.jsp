<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee Rewards System | Login</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/images/logo-mini.svg"/>


    <style>
        .error {
            color: red;
        }
    </style>
</head>

<body class="sidebar-light">
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
            <div class="row w-100">
                <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left p-5">
                        <div style="text-align: center" class="mb-2">
                            <img src="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg" height="25Px"
                                 alt="logo" class="mr-2"><b>Rising Stars</b>
                        </div>
                        <p style="text-align: center">Sign in to continue</p>
                        <form class="pt-3" action="j_spring_security_check" method="post" id="login_form" >
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" id="exampleInputEmail1"
                                       name="username"
                                       placeholder="Username" >
<%--                                <span style="color:red;"--%>
<%--                                id="userErrDivId"></span>--%>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg" id="exampleInputPassword1"
                                       name="password"
                                       placeholder="Password" >
<%--                                <span style="color:red;"--%>
<%--                                      id="passwordErrDivId"></span>--%>
                            </div>
                            <div class="mt-3">
                                <input type="submit"
                                       class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
                                       value="SIGN IN" >
                            </div>
                            <%--<div class="my-2 d-flex justify-content-between align-items-center">
                              <a href="#" class="auth-link text-black">Forgot password?</a>
                            </div>--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->



<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->



<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
<!-- endinject -->

<!-- Custome -->
<script >
    $(function () {
        var $registerForm = $("#login_form");

        $registerForm.validate({
            rules: {
                username: {
                    required: true,

                },
                password: {
                    required: true,
                },
            },
            // messages: {
            //     username: {
            //         required: 'UserName must be  required',
            //
            //     },
            //     password: {
            //         required: 'Password must be  required',
            //
            //     },
            // },
        })
    })

</script>

<script src="<%=request.getContextPath()%>/adminResources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.validate.js"></script>


<!-- custome end -->
</body>

</html>
