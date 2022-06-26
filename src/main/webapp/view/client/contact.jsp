<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/contact.css"/>

</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>

    <div class="container-contact">
        <div class="contact-header">
            <h2 class="contact-header__text">Get in Touch</h2>
        </div>
        <div class="contact-wrap-content">
            <div class="contact-form-wrap">
                <div class="${alert} alert-danger">Please enter message</div>
                <form action="contact" method="post" class="contact-form">
                    <div class="contact-form__input">
                        <input type="text" name="fullName" placeholder="Enter your name">
                    </div>
                    <div class="contact-form__input">
                        <input type="email" name="email" placeholder="Enter email address">
                    </div>
                    <div class="contact-form__input">
                        <input type="subject" name="subject" placeholder="Enter subject">
                    </div>
                    <div class="contact-form__input">
                        <textarea placeholder="Enter Message" name="message"></textarea>
                    </div>
                    <div class="contact-btn">
                        <button class="btn-send" type="submit">Send Message</button>
                    </div>
                </form>
            </div>

            <div class="contact-info">
                <div class="contact-info__specific">
                    <i class="fas fa-home"></i>
                    <a href="#" class="contact-info__specific--address">Buttonwood, California.
                        <p>Rosemead, CA 91770</p>
                    </a>

                </div>

                <div class="contact-info__specific">
                    <i class="fas fa-mobile-alt "></i>
                    <a href="#" class="contact-info__specific--address">00 (440) 9865 562
                        <p>Mon to Fri 9am to 6pm</p>
                    </a>

                </div>

                <div class="contact-info__specific">
                    <i class="fas fa-envelope"></i>
                    <a href="#" class="contact-info__specific--address">support@store.com
                        <p>Send us your query anytime!</p>
                    </a>

                </div>

            </div>
        </div>


    </div>
    <jsp:include page="/layout/client/footer.jsp"/>

</div>

</body>
</html>
