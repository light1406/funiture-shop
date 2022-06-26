<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/product.css"/>
    <link rel="stylesheet" href="assets/client/css/seller.css"/>
    <link rel="stylesheet" href="assets/client/css/detail.css"/>

</head>
<body>
<div id="app">

    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>
    <section id="detail-product">
        <div class="grid wide">
            <div class="row detail-product-wrapper">
                <div class="col l-7 m-12">
                    <div class="detail-product-img">
                        <div class="detail-slider">
                            <div class="detail-slider-wrapper">
                                <input type="radio" name="detail-img" id="detail-img-1" hidden checked/>
                                <input type="radio" name="detail-img" id="detail-img-2" hidden/>
                                <input type="radio" name="detail-img" id="detail-img-3" hidden/>
                                <div class="detail-slider-pictures">
                                    <c:forEach var="i" items="${images}">
                                        <div class="detail-slider-picture">
                                            <img src="${i.getImage()}" alt="" class="detail-slider-img"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <ul class="detail-slider-list">
                                <c:forEach var="i" items="${images}" varStatus="indexImage">
                                    <li class="detail-slider-item">
                                        <label for="detail-img-${indexImage.count}" class="detail-slider-item__link">
                                            <img src="${i.getImage()}" alt=""
                                                 class="detail-slider-item__img"/>
                                        </label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col l-4 m-12">
                    <div class="detail-product-text">
                        <h3 class="detail-product-text__headding">
                            ${product.getProductName()}
                        </h3>
                        <h2 class="detail-product-text__salePrice">
                            $${product.getSalePrice()}
                            <span class="detail-product-text__price">$${product.getPrice()} </span>
                        </h2>
                        <ul class="detail-product-text__list">
                            <li class="detail-product-text__item">
                                <p class="col l-3">Category:</p>
                                <a href="category?cid=${category.getCategoryId()}"
                                   class="text text-warning"> ${category.getCategoryName()}</a>
                            </li>
                            <li class="detail-product-text__item">
                                <p class="col l-3">Availability:</p>

                                <c:choose>
                                    <c:when test="${product.isStatus() && product.getQuantityStock()>0}">
                                        <span class="text text-success"> In Stock </span>
                                    </c:when>
                                    <c:when test="${product.isStatus() && product.getQuantityStock()==0}">
                                        <span class="text text-info">  Products coming soon </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text text-danger"> Stop Working </span>
                                    </c:otherwise>
                                </c:choose>


                            </li>
                        </ul>

                        <p>
                            ${productDetail.getDescription()}
                        </p>
                        <div class="detail-product-text__cart">
                            <div class="detail-product-text__cart-count">
                                        <span class="detail-product-text__cart-count-decrement">
                                            <i class="fas fa-minus"></i>
                                        </span>
                                <input type="text" name="quantitySold" value="1" min="1"
                                       max="${product.getQuantityStock()}"
                                       class="detail-product-text__cart-count-input"/>
                                <span class="detail-product-text__cart-count-increment">
                                            <i class="fas fa-plus"></i>
                                        </span>
                            </div>
                            <c:choose>
                                <c:when test="${product.isStatus() && product.getQuantityStock()>0}">
                                    <button type="submit"
                                            pid="${product.getProductId()}"
                                            class="detail-product-text__cart-btn"
                                            id="cart-add">add to cart
                                    </button>


                                </c:when>
                                <c:when test="${product.isStatus() && product.getQuantityStock()==0}">
                                    <span class="detail-product-text__cart-btn stop">add to cart</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="detail-product-text__cart-btn stop">add to cart</span>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="detail-product-description">
        <div class="grid wide">
            <ul class="detail-product-tabs">
                <li class="detail-product-tab active">Description</li>
                <li class="detail-product-tab">Specification</li>
            </ul>

            <div class="detail-product-tabs-content">
                <div class="detail-tab-pane active">
                    <p>
                        ${productDetail.getDescription()}
                    </p>
                </div>
                <div class="detail-tab-pane">
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Width</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getWidth()}cm</h5>
                        </div>
                    </div>
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Weight</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getWeight()}kg</h5>
                        </div>
                    </div>
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Height</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getHeight()} cm</h5>
                        </div>
                    </div>
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Depth</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getDepth()} m</h5>
                        </div>
                    </div>
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Material</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getMaterial()}</h5>
                        </div>
                    </div>
                    <div class="row detail-tab-row">
                        <div class="col l-6">
                            <h5>Origin</h5>
                        </div>
                        <div class="col l-6">
                            <h5> ${productDetail.getOrigin()}</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <jsp:include page="/layout/client/seller.jsp"/>
    <jsp:include page="/layout/client/footer.jsp"/>
</div>
<script src="assets/client/js/seller.js"></script>
<script src="assets/client/js/detail.js"></script>

<script type="text/javascript" src="assets/manage/plugins/jquery-core/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#cart-add").click(function () {
            var quantity = $(".detail-product-text__cart-count-input").val();
            var pid = $(this).attr("pid");
            $.ajax({
                url: "cart-add",
                method: "POST",
                data: {
                    // action: "add",
                    quantitySold: quantity,
                    pid: pid
                },
                success: function (data) {
                    $("body").html($('body').load("cart"));
                }
            })
        })
    })
</script>
</body>
</html>
