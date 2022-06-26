package vn.furniture.controller.cart;

import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.Cart;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartUpdate", value = "/cart-update")
public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String pid = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        if (cart.get(pid) == null) {
            Product product = new ProductDAO().getRow(pid);
            if (product != null) {
                product.setQuantitySold(quantity);
                cart.add(product);
            } else {
                response.setStatus(404);
            }
        } else {
            cart.add(pid, quantity);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
}
