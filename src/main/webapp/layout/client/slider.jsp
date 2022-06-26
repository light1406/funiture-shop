<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="slider">
    <div class="grid wide">
        <div class="slider-wrapper">
            <ul class="slider-list">
                <c:forEach var="s" items="${sliders}">
                    <li class="slider-item col l-12 m-12 c-12">
                        <div class="slider-item-left col l-5">
                            <div class="slider-item-left__heading">
                                <h1>${s.getProductName()}</h1>
                            </div>
                            <div class="slider-item-left__description">
                                <p>
                                        ${s.getDescription()}
                                </p>
                            </div>
                            <div class="slider-item-left__button">
                                <a href="detail?pid=${s.getProductId()}" class="slider-item-left__button-link">
                                    Buy now
                                </a>
                            </div>
                        </div>
                        <div class="slider-item-right col l-7 hide-on-mobile-tablet">
                            <img src="${s.getImage()}" alt="" class="slider-item-right__img"/>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="slider-control hide-on-mobile">
                <div class="slider-control__next-btn"><span>Next</span></div>
                <div class="slider-control__previous-btn">
                    <span>Previous</span>
                </div>
            </div>
        </div>
    </div>
</div>