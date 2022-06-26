<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="seller">
    <div class="grid wide">
        <div class="seller-wrapper">
            <div class="row seller-heading">
                <div class="col l-12">
                    <h2>Best Seller</h2>
                </div>
                <div class="seller-control hide-on-mobile">
                    <div class="seller-control__next-btn"><span>Next</span></div>
                    <div class="seller-control__previous-btn">
                        <span>Previous</span>
                    </div>
                </div>
            </div>

            <div class="seller-list">
                <c:forEach var="s" items="${sellers}">
                    <div class="product-item col l-3 m-3 c-12">
                        <a href="detail?pid=${s.getProductId()}">
                            <div class="product-item-img" style="
                                    background-image: url('${s.getLinkImage()}');
                                    "></div>
                        </a>
                        <div class="product-item-detail">
                            <a href="detail?pid=${s.getProductId()}">
                                <p class="product-item-heading">${s.getProductName()}</p>
                            </a>
                            <div class="product-item-price">
                                <span class="product-item-amount">$${s.getSalePrice()}</span>
                                <span class="product-item-old-price">$${s.getPrice()}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>