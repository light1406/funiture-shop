<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/checkout.css"/>
</head>
<body>
<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>

    <div class="container-checkout">
        <div class="checkout-form">
            <form action="order" method="post">
                <h3 class="form-checkout__heading">User Information</h3>
                <div class="input-wrap">
                    <div class="form-checkout__input">
                        <input type="text" placeholder="Full Name" value="${sessionScope.account.getUserName()}"
                               readonly/>
                    </div>

                    <div class="form-checkout__input">
                        <input type="tel" placeholder="Phone Number " value="${sessionScope.account.getPhone()}"
                               pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                               readonly/>
                    </div>
                    <div class="form-checkout__input">
                        <input type="email" placeholder="Email" value="${sessionScope.account.getEmail()}" readonly/>
                    </div>
                    <div class="form-checkout__input">
                        <input type="text" placeholder="Address" value="${sessionScope.account.getAddress()}" readonly/>
                    </div>
                    <div class="form-checkout__input">
                        <h3 class="form-checkout__heading">Message</h3>
                        <textarea name="note" id="" cols="50" rows="7" placeholder="Order Note"></textarea>
                    </div>
                </div>
            </form>
        </div>


        <!-- RECEIPT  -->
        <form class="checkout-receipt" action="order" method="post">
            <h3 class="form-checkout__heading">Your Order</h3>
            <table>
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${sessionScope.cart.getData()}">
                    <tr>
                        <td>${c.getProductName()}</td>
                        <td class="quantity">${c.getQuantitySold()}</td>
                        <td>${c.total()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="checkout-cost">
                <table>
                    <tr>
                        <td><strong>Subtotal:</strong></td>
                        <td>$${sessionScope.cart.totalOfList()}</td>
                    </tr>
                    <tr>
                        <td><strong>VAT:</strong></td>
                        <td>${sessionScope.cart.getVatCast()}%</td>
                    </tr>
                    <tr>
                        <td><strong>Total:</strong></td>
                        <td>$${sessionScope.cart.totalWithVAT()}</td>
                    </tr>
                </table>
            </div>
            <div class="checkout-receipt__info-payment">
                <h3 class="checkout-receipt__info-payment--header">Payment Method </h3>

                <div class="checkout-receipt__info-method-payment">
                    <input type="radio" checked value="cash" name="payment" id="payment-cash"/>
                    <label for="payment-cash" class="">Cash</label>
                </div>
                <div class="checkout-receipt__info-method-payment">
                    <input type="radio" value="Paypal" name="payment" id="payment-paypal"/>
                    <label for="payment-paypal">Paypal</label>
                </div>
            </div>
            <div class="checkout-receipt__btn">
                <button class="btn-checkout form-submit" type="submit">Check Out</button>
            </div>
        </form>
        <!-- RECEIPT  -->

    </div>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>
</body>
</html>
