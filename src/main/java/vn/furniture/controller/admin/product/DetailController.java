package vn.furniture.controller.admin.product;

import vn.furniture.DAO.*;
import vn.furniture.entity.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailController", value = "/detail-product")
public class DetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String id = request.getParameter("pid");
        Product product = productDAO.getRow(id);
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        ImageDAO imageDAO = new ImageDAO();
        OriginDAO originDAO = new OriginDAO();
        MaterialDAO materialDAO = new MaterialDAO();

        Category category = categoryDAO.getRow(product.getCategoryId());
        ProductDetail productDetail = productDetailDAO.getRow(product.getProductId());
        List<Image> images = imageDAO.getList(product.getProductId());
        Material material = materialDAO.getRow(productDetail.getMaterial());
        Origin origin = originDAO.getRow(productDetail.getOrigin());

        request.setAttribute("category", category);
        request.setAttribute("material", material);
        request.setAttribute("origin", origin);
        request.setAttribute("images", images);
        request.setAttribute("productDetail", productDetail);
        request.setAttribute("product", product);
        request.getRequestDispatcher("view/manage/detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
