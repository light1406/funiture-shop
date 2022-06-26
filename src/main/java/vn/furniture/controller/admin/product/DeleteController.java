package vn.furniture.controller.admin.product;

import vn.furniture.DAO.*;
import vn.furniture.entity.*;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteController", value = "/delete-product")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getRow(id);
        if (product == null) {
            response.setStatus(404);
        } else {
            ProductDetailDAO productDetailDAO = new ProductDetailDAO();
            ImageDAO imageDAO = new ImageDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            MaterialDAO materialDAO = new MaterialDAO();
            OriginDAO originDAO = new OriginDAO();

            ProductDetail productDetail = productDetailDAO.getRow(product.getProductId());
            Category category = categoryDAO.getRow(product.getCategoryId());
            Material material = materialDAO.getRow(productDetail.getMaterial());
            Origin origin = originDAO.getRow(productDetail.getOrigin());
            List<Image> images = imageDAO.getList(product.getProductId());

            request.setAttribute("category", category);
            request.setAttribute("material", material);
            request.setAttribute("origin", origin);
            request.setAttribute("images", images);
            request.setAttribute("productDetail", productDetail);
            request.setAttribute("product", product);
        }

        request.getRequestDispatcher("view/manage/delete.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        String id = request.getParameter("pid");
        Product product = productDAO.getRow(id);
        if (product == null) response.setStatus(404);

        if (productDAO.delete(product) == 1) {
            XMessage message = new XMessage("success", "Delete record success");
            request.setAttribute("message", message);
            request.getRequestDispatcher("show-product").forward(request, response);
        } else {
            XMessage message = new XMessage("danger", "Delete record fail");
            request.setAttribute("message", message);
            request.getRequestDispatcher("show-product").forward(request, response);
        }
    }

}
