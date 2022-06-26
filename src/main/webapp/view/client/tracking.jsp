<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/tracking.css"/>

</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>

    <div class="container-tracking">
        <div class="tracking-heading">
            <div class="alert alert-${message.getType()}">
                ${message.getMessage()}
            </div>
            <p class="tracking-heading__text">
                To track your order please enter your Order ID in the box below and press the "Tracking Order" button.
                <strong>
                    This was given to you on your receipt and in the confirmation email you should have received.
                </strong>
            </p>
        </div>
        <div class="tracking-form">
            <form action="tracking" method="post">
                <div class="tracking-form__input">
                    <input type="text" name="oid" placeholder="Order ID"/>
                </div>
                <div class="tracking-form__input">
                    <input type="email" name="email" placeholder="Email"/>
                </div>
                <div class="tracking-btn">
                    <button class="btn-tracking" type="submit">Tracking Order</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>
</body>
</html>
