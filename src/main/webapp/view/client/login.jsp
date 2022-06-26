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
                            <h3>Welcome Back ! <br> Please Sign In Now</h3>
                            <div class="alert alert-${message.getType()}">
                                ${message.getMessage()}
                            </div>
                            <form class="row contact_form" action="login" method="post">
                                <div class="col l-12 m-12 c-12 form-group p_star">
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="Email" required>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group p_star form-show">
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="Password" required>
                                    <div class="show-icon">
                                        <span class="show-password active"><i class="far fa-eye"></i></span>
                                        <span class="show-password no-active"><i
                                                class="far fa-eye-slash"></i></span>
                                    </div>
                                </div>
                                <div class="col l-12 m-12 c-12 form-group">
                                    <%--                                    <div class="creat_account d-flex align-items-center">--%>
                                    <%--                                        <input type="checkbox" id="f-option" name="selector">--%>
                                    <%--                                        <label for="f-option">Remember me</label>--%>
                                    <%--                                    </div>--%>
                                    <button type="submit" value="submit" class="btn_3 form-submit">
                                        log in
                                    </button>
                                    <a class="lost_pass" href="./forget">Forget password?</a>
                                    <a class="register_account" href="./register">Register Account</a>
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


<script>

    document.querySelector(".show-password.no-active").onclick = function () {
        document.querySelector(".show-password.no-active").style.display = "none";
        document.querySelector(".show-password.active").style.display = "block";
        document.querySelector(".show-password.active").parentNode.previousElementSibling.type = "text"
    }

    document.querySelector(".show-password.active").onclick = function () {
        document.querySelector(".show-password.active").style.display = "none";
        document.querySelector(".show-password.no-active").style.display = "block";
        document.querySelector(".show-password.active").parentNode.previousElementSibling.type = "password"
    }
</script>
</body>
</html>
