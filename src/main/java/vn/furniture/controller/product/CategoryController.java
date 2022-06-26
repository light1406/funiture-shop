package vn.furniture.controller.product;

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
import java.util.List;

@WebServlet(name = "CategoryController", value = "/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        OriginDAO originDAO = new OriginDAO();
        MaterialDAO materialDAO = new MaterialDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();

        List<Origin> origins = originDAO.getList();
        List<Material> materials = materialDAO.getList();
        List<Category> categories = categoryDAO.getList();
        List<Product> sellers = productDAO.getSeller();
        int limit = 9;

        int amount = productDAO.getAmountWithCategoryId(cid);
        int endPage = amount / limit;
        if (amount % limit != 0) {
            endPage++;
        }
        request.setAttribute("categoryPage", endPage);

        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int index = Integer.parseInt(page);
        List<Product> products = productDAO.getListWithCategoryId(cid, index, limit);

        request.setAttribute("cid", cid);
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
