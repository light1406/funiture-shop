<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/layout/manage/css.jsp"/>
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
                            <strong class="text-danger text-uppercase">Add product</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="show-product" class="btn btn-sm btn-info"><i
                                    class="fas fa-long-arrow-alt-left"></i> Back </a>
                        </div>
                    </div>
                </div>
                <div class="alert alert-${message.getType()}">
                    ${message.getMessage()}
                </div>
                <div class="card-body">
                    <form action="add-product" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>Product Name <span class="text-danger">(*)</span> </label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="form-group">
                                    <label>Quantity Stock</label>
                                    <input type="number" class="form-control" name="quantity-stock">
                                </div>
                                <div class="form-group">
                                    <label>Quantity Import</label>
                                    <input type="number" class="form-control" name="quantity-import">

                                </div>
                                <div class="form-group">
                                    <label>Width </label>
                                    <input type="text" class="form-control" name="width">
                                </div>
                                <div class="form-group">
                                    <label>Height</label>
                                    <input type="text" class="form-control" name="height">
                                </div>
                                <div class="form-group">
                                    <label>Depth</label>
                                    <input type="text" class="form-control" name="depth">
                                </div>
                                <div class="form-group">
                                    <label>Weight</label>
                                    <input type="text" class="form-control" name="weight">
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea type="text" class="form-control" name="description" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="number" class="form-control" name="price">

                                </div>
                                <div class="form-group">
                                    <label>Sale Price</label>
                                    <input type="number" class="form-control" name="sale-price">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <input type="text" class="form-control" name="category">
                                </div>
                                <div class="form-group">
                                    <label>Material</label>
                                    <input type="text" class="form-control" name="material">
                                </div>
                                <div class="form-group">
                                    <label>Origin</label>
                                    <input type="text" class="form-control" name="origin">
                                </div>
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <input type="file" name="avatar" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <button type="submit" id="create" class="btn btn-sm btn-success"><i
                                class="fas fa-save"></i> Save
                        </button>
                    </form>
                </div>

            </div>

        </section>
    </div>

</div>
<jsp:include page="/layout/manage/script.jsp"/>
</body>
</html>
