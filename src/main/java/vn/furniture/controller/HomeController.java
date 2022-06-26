package vn.furniture.controller;

import vn.furniture.DAO.CategoryDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.DAO.ProductDetailDAO;
import vn.furniture.entity.Category;
import vn.furniture.entity.Product;
import vn.furniture.entity.ProductDetail;
import vn.furniture.entity.Slider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        ProductDAO productDAO = new ProductDAO();
        List<Product> sellers = productDAO.getSeller();
        List<Slider> sliders = getSlider();
        List<Category> categories = new CategoryDAO().getList();
        List<Product> featured = new ArrayList<>();
            for(int i = 0; i < 4; i++) {
                featured.add(productDAO.getFeatured(categories.get(i).getCategoryId()));
            }

        request.setAttribute("sellers", sellers);
        request.setAttribute("featured", featured);
        request.setAttribute("categories", categories);
        request.setAttribute("sliders", sliders);
        request.getRequestDispatcher("view/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public List<Slider> getSlider() {
        List<Slider> sliders = new ArrayList<Slider>();
        ProductDAO productDAO = new ProductDAO();
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();

        List<Product> products = productDAO.getSlider();
        List<ProductDetail> productDetails = productDetailDAO.getSlider();

        for (Product product : products) {
            for (ProductDetail detail : productDetails) {
                if (product.getProductId().equals(detail.getProductId())) {
                    sliders.add(new Slider(product.getProductId(), product.getProductName(), product.getLinkImage(), detail.getDescription()));
                }
            }
        }

        return sliders;
    }
}
