<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/confirm.css"/>
</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>
    <div class="container-confirm">
        <p class="confirm-heading">Thank you. Your order has been received.</p>
        <div class="bill-wrap">
            <div class="bill-1">
                <h4 class="bill-heading">Order Info</h4>
                <div class="bill-info">
                    <p class="bill-info_title">Order Number</p>
                    <p class="bill-info__value">${order.getOrderId()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Date Order</p>
                    <p class="bill-info__value">${order.getCreatedAt()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Total</p>
                    <p class="bill-info__value">${order.getPrice()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Payment Method</p>
                    <p class="bill-info__value">${order.getPayMethod()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Status</p>
                    <p class="bill-info__value">${order.isStatus()?"delivery is in progress":"delivered"}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Note</p>
                    <p class="bill-info__value">${order.getNote()}</p>
                </div>
            </div>

            <div class="bill-2">
                <h4 class="bill-heading">User Info</h4>
                <div class="bill-info">
                    <p class="bill-info_title">Full Name</p>
                    <p class="bill-info__value">${user.getUserName()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Phone </p>
                    <p class="bill-info__value">${user.getPhone()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Address</p>
                    <p class="bill-info__value">${user.getAddress()}</p>
                </div>
                <div class="bill-info">
                    <p class="bill-info_title">Email</p>
                    <p class="bill-info__value">${user.getEmail()}</p>
                </div>
            </div>

        </div>
        <div class="confirm-detail-wrap">
            <div class="confirm-detail">
                <h4 class="confirm-detail__heading">Order Details</h4>
                <table id="myTable">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="i" items="${list}">
                        <tr>
                            <td>${i.getProductName()}</td>
                            <td>${i.getQuantity()}</td>
                            <td>${i.getPrice()}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>Total</td>
                        <td></td>
                        <td>${order.getPrice()}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>
</body>
</html>
