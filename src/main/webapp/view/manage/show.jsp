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
                <div class="alert alert-${message.getType()}">
                    ${message.getMessage()}
                </div>
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger text-uppercase">List Product</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="add-product" class="btn btn-sm btn-success"><i class="fas fa-plus"></i> Add
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped" id="myTable">
                        <thead>
                        <tr>
                            <th class="text-center" style="width:20px">#</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Sale Price</th>
                            <th>Create At</th>
                            <th>Status</th>
                            <th class="text-center" style="width:180px">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- data -->
                        <c:forEach var="i" items="${list}">
                            <tr>
                                <td><input type="checkbox" name="checkId" value=""/></td>

                                <td><img src="assets/client/images/products/${i.getLinkImage()}" style="width:120px"/>
                                </td>
                                <td>${i.getProductName()}</td>
                                <td>${i.getSalePrice()}</td>
                                <td>${i.getCreateAt()}</td>
                                <td>
                                    <a href="status?pid=${i.getProductId()}"
                                       class="btn ${i.isStatus()?"btn-success":"btn-danger"} ">
                                        Active
                                    </a>
                                </td>
                                <td>
                                    <a href="detail-product?pid=${i.getProductId()}"
                                       class="btn btn-sm btn-primary">
                                        <i class="fas fa-eye"></i>
                                    </a>

                                    <a href="update-product?pid=${i.getProductId()}"
                                       class="btn btn-sm btn-info">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-product?pid=${i.getProductId()}"
                                       class="btn btn-sm btn-danger">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>

                </div>

            </div>

        </section>
    </div>
</div>

<jsp:include page="/layout/manage/script.jsp"/>
<script src="assets/manage/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#myTable').DataTable();
    });
</script>
</body>
</html>
