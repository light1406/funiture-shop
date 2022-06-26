<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="featured" id="featured">
    <h1 class="featured-heading">Featured Category</h1>
    <div class="grid wide">
        <div class="row featured-wrapper">
            <c:forEach var="item" items="${featured}" varStatus="count">
                <c:choose>
                    <c:when test="${count.index == 0|| count.index == 3}">
                        <div class="col l-7 m-6 c-12">
                            <div class="featured-content">
                                <c:forEach var="c" items="${categories}">
                                    <c:if test="${c.getCategoryId() ==item.getCategoryId() }">
                                        <p>${ c.getCategoryName()}</p>
                                    </c:if>
                                </c:forEach>
                                <h3>${item.getProductName()}</h3>
                                <a href="detail?pid=${item.getProductId()}" class="featured-btn ">
                                    EXPLORE NOW
                                    <i class="fas fa-play"></i>
                                </a>
                                <img src="${item.getLinkImage()}" alt=""
                                     class="featured-img"/>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col l-5 m-6 c-12">
                            <div class="featured-content">
                                <c:forEach var="c" items="${categories}">
                                    <c:if test="${c.getCategoryId() ==item.getCategoryId() }">
                                        <p>${ c.getCategoryName()}</p>
                                    </c:if>
                                </c:forEach>
                                <h3>${item.getProductName()}</h3>
                                <a href="detail?pid=${item.getProductId()}" class="featured-btn ">
                                    EXPLORE NOW
                                    <i class="fas fa-play"></i>
                                </a>
                                <img src="${item.getLinkImage()}" alt=""
                                     class="featured-img"/>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </div>
    </div>
</section>