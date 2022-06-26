<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header">
    <div class="grid wide">
        <div class="row header-wrapper">
            <div class="col m-1 c-1 hide-on-pc">
                <div class="mobile-nav">

                    <label for="mobile-nav-check">
                        <i class="fas fa-bars "></i>
                    </label>
                    <input type="checkbox" name="" id="mobile-nav-check" hidden>

                    <ul class="mobile-nav-list">
                        <li class="mobile-nav-item">
                            <a href="./home" class="mobile-nav-item__link">Home</a>
                        </li>
                        <li class="mobile-nav-item">
                            <a href="./product" class="mobile-nav-item__link">Product</a>
                        </li>
                        <li class="mobile-nav-item">
                            <a href="./about" class="mobile-nav-item__link">About</a>
                        </li>
                        <li class="mobile-nav-item">
                            <a href="./tracking" class="mobile-nav-item__link">Tracking</a>
                        </li>
                        <li class="mobile-nav-item">
                            <a href="./contact" class="mobile-nav-item__link">Contact</a>
                        </li>
                        <c:if test="${account.isRole()}">
                            <li class="mobile-nav-item">
                                <a href="./admin" class="mobile-nav-item__link">Admin</a>
                            </li>
                        </c:if>
                    </ul>

                </div>
            </div>

            <div class="col l-3 m-8 c-7">
                <a href="./home" class="header-brand">
                    <img src="./assets/client/images/logo.png" alt="logo"/>
                </a>
            </div>
            <div class="col l-6 hide-on-mobile-tablet">
                <ul class="header-list">
                    <li class="header-item">
                        <a href="./home" class="header-item__link">Home</a>
                    </li>
                    <li class="header-item">
                        <a href="./product" class="header-item__link">Product</a>
                    </li>
                    <li class="header-item">
                        <a href="./about" class="header-item__link">About</a>
                    </li>
                    <li class="header-item">
                        <a href="./tracking" class="header-item__link">Tracking</a>
                    </li>
                    <li class="header-item">
                        <a href="./contact" class="header-item__link">Contact</a>
                    </li>
                    <c:if test="${sessionScope.account.isRole()}">
                        <li class="header-item">
                            <a href="./admin" class="header-item__link">Admin</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="col l-3 m-3 c-4">
                <div class="header-tool">
                    <ul class="header-tool__list">
                        <li class="header-tool__item header-tool__item-search">
                            <i class="fas fa-search"></i>
                            <div class="header-tool__item-input active">
                                <div class="grid wide">
                                    <form action="search" method="post">
                                        <input type="text" name="searchName" id="header-search"
                                               placeholder="Search Here"
                                               class="header-tool__item-search-input col l-11"/>
                                        <span class="header-tool__item-input-close l-1">
                                                    <i class="fas fa-times"></i>
                                                </span>
                                    </form>
                                </div>
                            </div>
                        </li>
                        <li class="header-tool__item header-tool__item-user">
                            <c:if test="${sessionScope.account !=null}">
                                <div class="header-tool__item-user-picture">
                                    <img src="assets/client/images/user.png" width=25 alt="anh user"
                                         class="header-tool__item-user-img">
                                    <span>${sessionScope.account.getUserName()}</span>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.account ==null}">
                                <i class="far fa-user"></i>
                            </c:if>
                            <ul class="header-tool__item-user-list">
                                <c:if test="${sessionScope.account !=null}">
                                    <li class="header-tool__item-user-item">
                                        <a href="logout" class="header-tool__item-user-item-link">
                                            Logout
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.account ==null}">
                                    <li class="header-tool__item-user-item">
                                        <a href="./login" class="header-tool__item-user-item-link">
                                            Login
                                        </a>
                                    </li>
                                    <li class="header-tool__item-user-item">
                                        <a href="./register" class="header-tool__item-user-item-link">
                                            Register
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                        <li class="header-tool__item header-tool__item-cart">
                            <a href="./cart" class="header-tool__item-cart-link">
                                <i class="fas fa-cart-plus"></i>
                                <span class="show-number ${sessionScope.cart.getData().size()>0 && sessionScope.cart!=null?"active":""}">${sessionScope.cart.getData().size()}</span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>