package vn.furniture.controller.admin.product;

import vn.furniture.DAO.ProductDAO;
import vn.furniture.service.XMessage;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "StatusController", value = "/status")
public class StatusController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getRow(pid);

        boolean status = product.isStatus() ? false : true;

        product.setStatus(status);
        if (productDAO.update(product) == 1) {
            XMessage message = new XMessage("success", "Change status success");
            request.setAttribute("message", message);
            request.getRequestDispatcher("show-product").forward(request, response);
        } else {
            XMessage message = new XMessage("danger", "Change status fail");
            request.setAttribute("message", message);
            request.getRequestDispatcher("show-product").forward(request, response);
        }
    }
}
