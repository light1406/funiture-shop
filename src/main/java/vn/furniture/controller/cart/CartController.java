package vn.furniture.controller.cart;

import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.Cart;
import vn.furniture.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        session.setAttribute("cart", cart);
        request.getRequestDispatcher("view/client/cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        String action = request.getParameter("action");
//        System.out.println(action);
//        try {
//            switch (action) {
//                case "add":
//                    create(request, response);
//                    return;
//                case "update":
//                    update(request, response);
//                    return;
//                case "delete":
//                    delete(request, response);
//                    return;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }


}
