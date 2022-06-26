package vn.furniture.controller;

import vn.furniture.DAO.SubscribeDAO;
import vn.furniture.entity.Subscribe;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;

@WebServlet(name = "SubscribeController", value = "/subscribe")
public class SubscribeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        request.getRequestDispatcher("view/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        SubscribeDAO subscribeDAO = new SubscribeDAO();
        request.setAttribute("title", "home");

        if (email.length() > 0) {
            Subscribe subscribe = subscribeDAO.getRow(email);
            if (subscribe == null) {
                subscribe = new Subscribe();
                subscribe.setEmail(email);
                subscribe.setCreateAt(new Timestamp(new Date().getTime()));
                subscribeDAO.add(subscribe);
                response.sendRedirect("home");
            } else {
                XMessage message = new XMessage("danger", "You were registered");
                request.setAttribute("message", message);
                request.getRequestDispatcher("view/index.jsp").forward(request, response);
            }
        } else {
            XMessage message = new XMessage("danger", "Email is too short");
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/index.jsp").forward(request, response);
        }
    }
}
