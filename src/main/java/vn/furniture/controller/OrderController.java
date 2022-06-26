package vn.furniture.controller;

import vn.furniture.DAO.OrderDAO;
import vn.furniture.DAO.OrderDetailDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.entity.*;
import vn.furniture.service.Mailer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        String method = request.getParameter("payment");
        String note = request.getParameter("note");

        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductDAO productDAO = new ProductDAO();
        if (user == null || cart == null) {
            response.sendRedirect("login");
        } else {
            // add database
            Order order = new Order();
            order.setPayMethod(method);
            order.setVat(cart.getVat());
            order.setNote(note);
            order.setStatus(true);
            order.setUserId(user.getUserId());
            order.setPrice(cart.totalWithVAT());

            int id = orderDAO.add(order);
            int check = 0;
            if (orderDetailDAO.addDetail(id, cart) == 1) {
                //update quantity product
                List<OrderDetail> list = orderDetailDAO.getList(id);
                for (OrderDetail detail : list) {
                    Product product = productDAO.getRow(detail.getProductId());
                    product.setQuantityStock(product.getQuantityStock() - detail.getQuantity());
                    if (product.getQuantityStock() == 0) product.setStatus(false);
                    check = productDAO.update(product); // thanh cong
                    if (check == 0) response.sendRedirect("order");
                }
                if (check == 1) {
                    Mailer mail = new Mailer();
                    String text = "Your order id is: " + id + "\nPlease check by 'tracking' to view order detail";
                    mail.sendMail(user.getEmail(), "Information your order", text);
                    session.removeAttribute("cart");
                    response.sendRedirect("tracking");
                }
            }
        }
    }
}
