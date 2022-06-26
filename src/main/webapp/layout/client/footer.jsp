<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer id="footer">
    <div class="grid wide">
        <div class="footer-wrapper">
            <div class="col l-2 m-6 c-12 ">
                <div class="footer-content">
                    <h4 class="footer-heading">My Account</h4>
                    <ul class="footer-list">
                        <li class="footer-item">
                            <a href="./login.html" class="footer-item__link">
                                Login Account
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./register.html" class="footer-item__link">
                                Register Account
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./cart.html" class="footer-item__link">
                                Shopping Cart
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./about.html" class="footer-item__link">
                                About Us
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col l-2 m-6 c-12">
                <div class="footer-content">
                    <h4 class="footer-heading">Product</h4>
                    <ul class="footer-list">
                        <li class="footer-item">
                            <a href="./product.html" class="footer-item__link">
                                Living room
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./product.html" class="footer-item__link">
                                Bedroom
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./product.html" class="footer-item__link">
                                Decor & Kitchen
                            </a>
                        </li>
                        <li class="footer-item">
                            <a href="./product.html" class="footer-item__link">
                                Collections
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col l-2 m-6 c-12">
                <div class="footer-content">
                    <h4 class="footer-heading">My Account</h4>
                    <ul class="footer-list">
                        <li class="footer-item">
                            <a href="" class="footer-item__link"> Facebook </a>
                        </li>
                        <li class="footer-item">
                            <a href="" class="footer-item__link"> Instagram </a>
                        </li>
                        <li class="footer-item">
                            <a href="" class="footer-item__link"> Twitter </a>
                        </li>
                        <li class="footer-item">
                            <a href="" class="footer-item__link"> Website </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col l-4 m-6 c-12">
                <div class="footer-content">
                    <h4 class="footer-heading">Newsletter</h4>
                    <p>You Will Receive Notifications About New Shop News</p>
                    <form action="subscribe" method="post" class="subscribe-form">
                        <input type="email" name="email" placeholder="${alert==null?"Enter Email Address":alert}"
                               class="subscribe-control col l-8 ${alert==null?" ":"text-danger"}"
                               style="background-color: #f2f2f2"
                               register
                        />
                        <button type=" submit" class="subscribe-submit">
                            Subscribe
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer-wrapper footer-copyright">
            <div class="col l-8">
                <p>
                    Copyright © 2021 All rights reserved | This template is made with by <a href="./index.html">BBC
                    Furniture Store</a>
                </p>
            </div>
            <div class="col l-4">
                <ul class="footer-social-list">
                    <li class="footer-social-item">
                        <a href="" class="footer-social-link">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="footer-social-item">
                        <a href="" class="footer-social-link">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </li>
                    <li class="footer-social-item">
                        <a href="" class="footer-social-link">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-back">
        <a href="#">
            <i class="fas fa-chevron-up"></i>
        </a>
    </div>
</footer>