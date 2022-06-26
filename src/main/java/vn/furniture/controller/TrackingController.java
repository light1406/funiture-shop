package vn.furniture.controller;

import vn.furniture.DAO.OrderDAO;
import vn.furniture.DAO.OrderDetailDAO;
import vn.furniture.DAO.ProductDAO;
import vn.furniture.DAO.UserDAO;
import vn.furniture.entity.*;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TrackingController", value = "/tracking")
public class TrackingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        request.getRequestDispatcher("view/client/tracking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String oid = request.getParameter("oid");
        int orderId = Integer.parseInt(oid);
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductDAO productDAO = new ProductDAO();

        User user = userDAO.getRow(email);
        Order order = orderDAO.getRow(orderId);

        if (order != null) {
            List<OrderDetail> details = orderDetailDAO.getList(order.getOrderId());
            List<Product> products = productDAO.getList();

            List<OrderInfo> list = getList(details, products);
            request.setAttribute("user", user);
            request.setAttribute("order", order);
            request.setAttribute("list", list);

            XMessage message = new XMessage("danger", "Please check your email !!");
            request.setAttribute("message", message);
            request.setAttribute("title", "confirmation");
            request.getRequestDispatcher("view/client/confirm.jsp").forward(request, response);
        } else {
            response.sendRedirect("tracking");
        }
    }

    private List<OrderInfo> getList(List<OrderDetail> details, List<Product> products) {
        List<OrderInfo> list = new ArrayList<>();
        for (OrderDetail orderDetail : details) {
            for (Product product : products) {
                if (orderDetail.getProductId().equals(product.getProductId())) {
                    list.add(new OrderInfo(orderDetail.getOrderId(),
                            orderDetail.getProductId(),
                            product.getProductName(),
                            orderDetail.getQuantity(),
                            orderDetail.getPrice()));
                }
            }
        }
        return list;

    }
}
