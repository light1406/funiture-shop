<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/user.css"/>

</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>
    <section class="login_part padding_top">
        <div class="grid wide">
            <div class="row align-items-center">
                <div class="col l-6 m-12 c-12">
                    <img src="assets/client/images/background_login.png"/>
                </div>
                <div class="col l-6 m-12 c-12">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome BBC Furniture ! <br> Please Fill In The Information.</h3>
                            <div class="alert alert-${message.getType()}">
                                ${message.getMessage()}
                            </div>
                            <form class="row contact_form" action="register" method="post">
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="text" class="form-control" id="fullName" name="fullName" value=""
                                           placeholder="Full Name" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="email" class="form-control" id="email" name="email" value=""
                                           placeholder="Email" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="tel" class="form-control" id="phone" name="phone" value=""
                                           placeholder="Phone" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="password" class="form-control" id="password" name="password" value=""
                                           placeholder="Password" required>
                                    <span class="form-message">Password có độ dài tối thiểu là 8</span>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="password" class="form-control" id="confirm-password"
                                           name="confirm-password" value="" placeholder="Confirm Password" required>
                                    <span class="form-message">Password không khớp</span>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="text" class="form-control" id="address" name="address" value=""
                                           placeholder="Address" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group">
                                    <button type="submit" value="submit" class="btn_3 form-submit">
                                        Register
                                    </button>
                                    <a class="lost_pass" href="./forget">Forget password?</a>
                                    <a class="register_account" href="./login">Login Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>
<script src="assets/client/js/validate.js"></script>
</body>
</html>
