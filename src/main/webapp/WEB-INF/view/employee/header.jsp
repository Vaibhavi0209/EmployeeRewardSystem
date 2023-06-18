<%@ page import="com.demo.util.BaseMethods" %>
<div class="horizontal-menu">
    <nav class="navbar top-navbar col-lg-12 col-12 p-0">
        <div class="container">
            <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
                <ul class="navbar-nav mr-lg-2 d-none d-lg-flex">
                </ul>
                <div
                        class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="index"><img
                            src="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg" alt="logo"
                            class="mr-2"/></a> <b style="color: white">Rising Stars</b> <a
                        class="navbar-brand brand-logo-mini" href="index"><img
                        src="<%=request.getContextPath()%>/adminResources/image/logo-mini.svg" alt="logo"/></a>
                </div>
                <ul class="navbar-nav navbar-nav-right">


                </ul>
            </div>
        </div>
    </nav>
    <nav class="bottom-navbar">
        <div class="container">
            <ul class="nav page-navigation">
                <li class="nav-item">
                    <a class="nav-link" href="index">
                        <i class="mdi mdi-view-dashboard menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="event">
                        <i class="mdi mdi-image-filter-vintage menu-icon"></i>
                        <span class="menu-title">Events</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="product">
                        <i class="mdi mdi-cart menu-icon"></i>
                        <span class="menu-title">Products</span>
                    </a>
                </li>
                <li class="nav-item mega-menu">
                    <a href="teamDetails" class="nav-link">
                        <i class="mdi mdi-account-multiple menu-icon"></i>
                        <span class="menu-title">Teams</span>
                    </a>

                </li>
                <li class="nav-item mega-menu">
                    <a href="profile" class="nav-link">
                        <i class="mdi mdi-account-circle menu-icon"></i>
                        <span class="menu-title">Profile</span>
                    </a>

                </li>

                <li class="nav-item mega-menu">
                    <a href="cart" class="nav-link">
                        <i class="mdi mdi-cart menu-icon"></i>
                        <span class="menu-title">Cart</span>
                    </a>

                </li>
                <li class="nav-item mega-menu">
                    <a href="myOrder" class="nav-link">
                        <i class="mdi mdi-shopping menu-icon"></i>
                        <span class="menu-title">My Order</span>
                    </a>

                </li>
                <li class="nav-item mega-menu">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                       id="profileDropdown"><i class="mdi mdi-account-circle menu-icon"></i><span
                            class="nav-profile-name"><%=BaseMethods.getUser()%></span>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                         aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="/logout"> <i
                                class="mdi mdi-logout text-primary"></i> Logout
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>