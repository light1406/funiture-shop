<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/layout/manage/css.jsp"/>

    <link href="assets/manage/css/jquery.dataTables.min.css" rel="stylesheet"/>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="/layout/manage/preloader.jsp"/>
    <jsp:include page="/layout/manage/navbar.jsp"/>
    <jsp:include page="/layout/manage/sidebar.jsp"/>

    <div class="content-wrapper">
        <section class="content my-3">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger text-uppercase">Delete Product</strong>
                        </div>
                        <form method="post" action="delete-product" class="col-md-6 text-right">
                            <input type="text" name="pid" value="${product.getProductId()}" hidden>
                            <button type="submit" class="btn btn-sm btn-danger"
                                    onClick="return confirm('Are you sure you want to delete?')">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                            <a href="show-product" class="btn btn-sm btn-info">
                                <i class="fas fa-long-arrow-alt-left"></i> Back
                            </a>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <td>ID Product</td>
                            <td>${product.getProductId()}</td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>${product.getProductName()}</td>
                        </tr>
                        <tr>
                            <td>Image</td>
                            <td>
                                <img src="assets/client/images/products/${product.getLinkImage()}" alt="" width="50px">

                                <c:forEach var="i" items="${images}">
                                    <img src="assets/client/images/products/${i.getImage()}" alt="" width="50px" class="ml-2">
                                </c:forEach>

                            </td>

                        </tr>

                        <tr>
                            <td>Category</td>
                            <td>${category.getCategoryName()}</td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td>$${product.getPrice()}</td>
                        </tr>
                        <tr>
                            <td>Sale Price</td>
                            <td>$${product.getSalePrice()}</td>
                        </tr>
                        <tr>
                            <td>Quantity Stock</td>
                            <td>${product.getQuantityStock()}</td>
                        </tr>
                        <tr>
                            <td>Quantity Import</td>
                            <td>${product.getQuantityImport()}</td>
                        </tr>
                        <tr>
                            <td>Date Import</td>
                            <td>${product.getDateImport()}</td>
                        </tr>
                        <tr>
                            <td>Width</td>
                            <td>${productDetail.getWidth()}</td>
                        </tr>
                        <tr>
                            <td>Height</td>
                            <td>${productDetail.getHeight()}</td>
                        </tr>
                        <tr>
                            <td>Depth</td>
                            <td>${productDetail.getDepth()}</td>
                        </tr>
                        <tr>
                            <td>Weight</td>
                            <td>${productDetail.getWeight()}</td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>${productDetail.getDescription()}</td>
                        </tr>
                        <tr>
                            <td>Origin</td>
                            <td>${origin.getOriginName()}</td>
                        </tr>
                        <tr>
                            <td>Material</td>
                            <td>${material.getMaterialName()}</td>
                        </tr>

                        <tr>
                            <td>Create Date</td>
                            <td>${product.getCreateAt()}</td>
                        </tr>
                        <tr>
                            <td>Update Date</td>
                            <td>${product.getUpdateAt()}</td>
                        </tr>

                        <tr>
                            <td>Status</td>
                            <td class="text-${product.isStatus()?"success":"danger"}">Active</td>
                        </tr>
                    </table>
                </div>

            </div>

        </section>
    </div>
</div>

<jsp:include page="/layout/manage/script.jsp"/>

<script>

</script>
</body>
</html>
