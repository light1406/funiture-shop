<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>


    <link rel="stylesheet" href="assets/client/css/cart.css"/>

</head>
<body>

<div id="app">
    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>
    <c:set var="cart" value="${sessionScope.cart}"></c:set>
    <c:if test="${cart == null || cart.getData().size() == 0}">
        <div class="grid wide">
            <div class="cart-empty">
                <p>
                    You have no items in your shopping basket.
                </p>
            </div>
            <a href="./product" class="btn btn-continue-shopping">Continue Shopping</a>
        </div>
    </c:if>
    <c:if test="${cart != null && cart.getData().size() != 0}">
        <div class="content-wrapper grid wide">
            <!-- Main content -->
            <section class="content my-3">
                <!-- Default box -->
                <div class="card">
                    <div class="card-body">
                        <table id="myTable">
                            <thead>
                            <tr>
                                <th class="text-center" colspan="2">Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th class="text-center">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- data -->
                            <c:set var="products" value="${cart.getData()}"></c:set>
                            <c:forEach var="c" items="${products}">
                                <tr>
                                    <td><img src="${c.getLinkImage()}" alt="" width="50px">
                                    </td>
                                    <td>${c.getProductName()}</td>
                                    <td>$${c.getSalePrice()}</td>
                                    <td><input type="number" value="${c.getQuantitySold()}"
                                               old-quantity="${c.getQuantitySold()}"
                                               pid="${c.getProductId()}" class="change-quantity"></td>
                                    <td>$${c.total()}</td>
                                    <td class="text-center">
                                        <a class="btn btn-sm btn-danger cart-remove" pid="${c.getProductId()}">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <p class="total-price">Total: <span>${cart.totalOfList()} </span></p>
                    </div>
                    <!-- /.card-body -->

                </div>
                <!-- /.card -->

            </section>

            <div class="cart-btn">
                <button class="btn-continue-shopping"><a href="./product">Continue Shopping</a></button>
                <button class="btn-to-checkout"><a href="./checkout">Proceed To Checkout</a></button>
            </div>
            <!-- /.content -->
        </div>
    </c:if>
    <jsp:include page="/layout/client/footer.jsp"/>
    <script type="text/javascript" src="assets/manage/plugins/jquery-core/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".cart-remove").click(function () {
                var id = $(this).attr("pid");
                item = $(this).closest("tr");
                $.ajax({
                    url: "cart-remove",
                    method: "POST",
                    data: {
                        // action: "delete",
                        id: id
                    },
                    success: function (data) {
                        item.remove();
                        $("body").html($('body').load("cart"));
                    }
                })
            })

            $(".change-quantity").blur(function () {
                var id = $(this).attr("pid");
                var oldQuantity = $(this).attr("old-quantity");
                var quantity = $(this).val();
                var changeQuantity = quantity - oldQuantity;
                if (quantity > 0 && quantity != oldQuantity) {
                    $.ajax({
                        url: "cart-update",
                        method: "POST",
                        data: {
                            // action: "update",
                            id: id,
                            quantity: changeQuantity
                        },
                        success: function (data) {
                            $(".change-quantity").attr("old-quantity", quantity)
                            $("body").html($('body').load("cart"));
                        },
                        error: function (data) {
                            if (data.status == 404) {
                                alert("Product is not exist")
                            }
                            if (data.status == 405) {
                                alert("Quantity over limit")
                            }
                        }
                    })
                }
            })
        })
    </script>
</div>
</body>
</html>
