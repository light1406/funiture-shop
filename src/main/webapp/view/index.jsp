<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/slider.css"/>
    <link rel="stylesheet" href="assets/client/css/featured.css"/>
    <link rel="stylesheet" href="assets/client/css/product.css"/>
    <link rel="stylesheet" href="assets/client/css/seller.css"/>
</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/slider.jsp"/>
    <jsp:include page="/layout/client/featured.jsp"/>
    <jsp:include page="/layout/client/seller.jsp"/>
    <jsp:include page="/layout/client/subscribe.jsp"/>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>

<script src="assets/client/js/slider.js"></script>
<script src="assets/client/js/seller.js"></script>
</body>
</html>
