package vn.furniture.controller;

import vn.furniture.DAO.CategoryDAO;
import vn.furniture.DAO.ImageDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.DAO.ProductDetailDAO;
import vn.furniture.entity.Category;
import vn.furniture.entity.Image;
import vn.furniture.entity.Product;
import vn.furniture.entity.ProductDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailProductController", value = "/detail")
public class DetailProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        String pid = request.getParameter("pid");
        ProductDAO productDAO = new ProductDAO();
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        ImageDAO imageDAO = new ImageDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        Product product = productDAO.getRow(pid);
        ProductDetail productDetail = productDetailDAO.getRow(pid);
        List<Image> images = imageDAO.getList(pid);
        Category category = categoryDAO.getRow(product.getCategoryId());
        List<Product> sellers = productDAO.getSeller();

        request.setAttribute("product", product);
        request.setAttribute("productDetail", productDetail);
        request.setAttribute("images", images);
        request.setAttribute("sellers", sellers);
        request.setAttribute("category", category);
        request.getRequestDispatcher("view/client/detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
