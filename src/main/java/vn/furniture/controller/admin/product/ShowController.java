package vn.furniture.controller.admin.product;

import vn.furniture.DAO.CategoryDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.Category;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowController", value = "/show-product")
public class ShowController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getList();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getList();

        request.setAttribute("categories", categories);
        request.setAttribute("list",products);
        request.getRequestDispatcher("view/manage/show.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
