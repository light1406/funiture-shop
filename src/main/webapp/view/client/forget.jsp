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
                            <div class="alert alert-${message.getType()}">
                                ${message.getMessage()}
                            </div>
                            <form class="row send_email" action="forget" method="post">
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="email" class="form-control" id="email" name="email" value=""
                                           placeholder="Email " required>
                                </div>

                                <div class="col l-12 m-12 c-12 form-group">
                                    <input type="submit" class="btn_3 form-submit form-continue" value="continue">


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
<script src="assets/client/js/validate.js"></script>

</body>
</html>
