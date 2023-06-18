<%@ page import="com.demo.util.BaseMethods" %>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div
            class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
        <ul class="navbar-nav mr-lg-2 d-none d-lg-flex">
            <li class="nav-item nav-toggler-item">
                <button class="navbar-toggler align-self-center" type="button"
                        data-toggle="minimize">
                    <span class="mdi mdi-menu"></span>
                </button>
            </li>

        </ul>
        <div
                class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a  class="navbar-brand brand-logo" href="index"><img
                    src="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg"  alt="logo" class="mr-2"/></a> <b>Rising Stars</b> <a
                class="navbar-brand brand-logo-mini" href="index"><img
                src="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg" alt="logo"/></a>
        </div>
        <ul class="navbar-nav navbar-nav-right">

            <li class="nav-item nav-profile dropdown"><a
                    class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                    id="profileDropdown"> <img src="<%=request.getContextPath()%>/adminResources/image/face7.jpg"><span
                    class="nav-profile-name"><%=BaseMethods.getUser()%></span>
            </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                     aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="/logout"> <i
                            class="mdi mdi-logout text-primary"></i> Logout
                    </a>
                </div>
            </li>
            <li class="nav-item nav-toggler-item-right d-lg-none">
                <button class="navbar-toggler align-self-center" type="button"
                        data-toggle="offcanvas">
                    <span class="mdi mdi-menu"></span>
                </button>
            </li>
        </ul>
    </div>
</nav>
