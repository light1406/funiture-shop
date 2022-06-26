<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar">
    <div class="sidebar-list">
        <div class="sidebar-item">
            <input type="radio" name="radio-check" id="category-check" hidden checked/>
            <div class="sidebar-item__heading">
                <label for="category-check"> Categories </label>
                <i class="fas fa-angle-down"></i>
            </div>
            <ul class="sidebar-item__sublist">
                <c:forEach var="c" items="${categories}">
                    <li class="sidebar-item__sublist-item">
                        <a href="category?cid=${c.getCategoryId()}" class="sidebar-item__sublist-item-link">
                                ${c.getCategoryName()}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="sidebar-item">
            <input type="radio" name="radio-check" id="origin-check" hidden ${check1}/>
            <div class="sidebar-item__heading">
                <label for="origin-check"> Origin </label>
                <i class="fas fa-angle-down"></i>
            </div>
            <ul class="sidebar-item__sublist">
                <c:forEach var="o" items="${origins}">
                    <li class="sidebar-item__sublist-item">
                        <a href="origin?oid=${o.getOriginId()}" class="sidebar-item__sublist-item-link">
                                ${o.getOriginName()}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="sidebar-item">
            <input type="radio" name="radio-check" id="material-check" hidden ${check2}/>
            <div class="sidebar-item__heading">
                <label for="material-check"> Material </label>
                <i class="fas fa-angle-down"></i>
            </div>
            <ul class="sidebar-item__sublist">
                <c:forEach var="m" items="${materials}">
                    <li class="sidebar-item__sublist-item">
                        <a href="material?mid=${m.getMaterialId()}" class="sidebar-item__sublist-item-link">
                                ${m.getMaterialName()}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>