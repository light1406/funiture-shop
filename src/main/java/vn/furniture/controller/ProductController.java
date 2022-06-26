package vn.furniture.controller;

import vn.furniture.DAO.CategoryDAO;
import vn.furniture.DAO.MaterialDAO;
import vn.furniture.DAO.OriginDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.Category;
import vn.furniture.entity.Material;
import vn.furniture.entity.Origin;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        ProductDAO productDAO = new ProductDAO();
        OriginDAO originDAO = new OriginDAO();
        MaterialDAO materialDAO = new MaterialDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Origin> origins = originDAO.getList();
        List<Material> materials = materialDAO.getList();
        List<Category> categories = categoryDAO.getList();
        List<Product> sellers = productDAO.getSeller();
        int limit = 9;

        int amount = productDAO.getAmount();
        int endPage = amount / limit;
        if (amount % limit != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);

        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int index = Integer.parseInt(page);
        List<Product> products = productDAO.getList(index, limit);

        request.setAttribute("tag", index);
        request.setAttribute("products", products);
        request.setAttribute("sellers", sellers);
        request.setAttribute("origins", origins);
        request.setAttribute("materials", materials);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("view/client/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
