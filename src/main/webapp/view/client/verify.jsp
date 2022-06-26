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
                    <img src="assets/client/images/background_login.png" height="422" width="555"/>
                </div>
                <div class="col l-6 m-12 c-12">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome BBC Furniture ! <br> Please Fill In The Information.</h3>
                            <form method="post" action="verify" class="reset_password">
                                <div class="alert alert-${message.getType()}">
                                    ${message.getMessage()}
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="text" class="form-control" id="code" name="code"
                                           placeholder="Enter Code" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="Password" required>
                                    <span class="form-message">Password có độ dài tối thiểu là 8</span>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="password" class="form-control" id="confirm-password"
                                           name="confirm-password" placeholder="Confirm Password" required>
                                    <span class="form-message">Password không khớp</span>
                                </div>

                                <div class="col l-12 m-12 c-12 form-group">
                                    <button type="submit" value="submit" class="btn_3 form-submit">
                                        Confirm
                                    </button>
                                    <a class="lost_pass" href="./register">Register Account</a>
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
</body>
</html>
