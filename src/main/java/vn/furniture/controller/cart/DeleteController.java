package vn.furniture.controller.cart;

import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.Cart;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCart", value = "/cart-remove")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pid = request.getParameter("id");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        Product product = cart.delete(pid);
        session.setAttribute("cart", cart);
        if (product == null) {
            response.setStatus(404);
        }
    }
}
