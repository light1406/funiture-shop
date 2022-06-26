<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <jsp:include page="/layout/client/css.jsp"/>
    <link rel="stylesheet" href="assets/client/css/product.css"/>
    <link rel="stylesheet" href="assets/client/css/seller.css"/>

</head>
<body>
<div id="app">

    <jsp:include page="/layout/client/header.jsp"/>
    <jsp:include page="/layout/client/breadcrumb.jsp"/>

    <div id="app-content">
        <div class="grid wide">
            <!-- product start -->
            <div class="row product-section">
                <div class="col l-2 m-4 c-6">
                    <jsp:include page="/layout/client/sidebar.jsp"/>
                </div>

                <div class="col l-10 m-12 c-12">
                    <div id="product-section">
                        <div class="product-list">
                            <c:forEach var="p" items="${products}">
                                <div class="product-item col l-4 m-6 c-12">
                                    <a href="detail?pid=${p.getProductId()}">
                                        <div class="product-item-img" style="
                                                background-image: url('${p.getLinkImage()}');
                                                "></div>
                                    </a>
                                    <div class="product-item-detail">
                                        <a href="detail?pid=${p.getProductId()}">
                                            <p class="product-item-heading">
                                                    ${p.getProductName()}
                                            </p>
                                        </a>
                                        <div class="product-item-price">
                                            <span class="product-item-amount">$${p.getSalePrice()}</span>
                                            <span class="product-item-old-price">$${p.getPrice()}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <div class="product-pagination">
                            <c:forEach var="i" begin="1" end="${endPage}">
                                <a href="product?page=${i}"
                                   class="product-pagination-link ${tag==i?"active":""}">${i}</a>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${categoryPage}">
                                <a href="category?cid=${cid}&page=${i}"
                                   class="product-pagination-link ${tag==i?"active":""}">${i}</a>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${materialPage}">
                                <a href="material?mid=${mid}&page=${i}"
                                   class="product-pagination-link ${tag==i?"active":""}">${i}</a>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${originPage}">
                                <a href="origin?oid=${oid}&page=${i}"
                                   class="product-pagination-link ${tag==i?"active":""}">${i}</a>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${searchPage}">
                                <a href="search?searchName=${searchName}&page=${i}"
                                   class="product-pagination-link ${tag==i?"active":""}">${i}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/layout/client/seller.jsp"/>

        </div>
    </div>
    <jsp:include page="/layout/client/footer.jsp"/>

</div>


<script>
    const headerSearch = document.querySelector(".header-tool__item-search");
    const headerInput = document.querySelector(".header-tool__item-input");
    const headerClose = document.querySelector(".header-tool__item-input-close");
    headerSearch.onclick = function () {
        headerInput.classList.remove("active");
    };
    headerClose.onclick = function (e) {
        e.stopPropagation();
        headerInput.classList.add("active");
    };
</script>
<script src="assets/client/js/seller.js"></script>


</body>
</html>
