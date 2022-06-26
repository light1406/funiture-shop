package vn.furniture.controller.account;

import vn.furniture.DAO.UserDAO;
import vn.furniture.db.DBContext;
import vn.furniture.entity.User;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "ActiveController", value = "/active")
public class ActiveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        String key1 = request.getParameter("key1");
        String key2 = request.getParameter("key2");

        User user = userDAO.getRow(key1);

        if (user != null) {
            if (user.getPassword().equals(key2)) {
                user.setStatus(true);
                if (userDAO.update(user) == 1) {
                    XMessage message = new XMessage("success", "Account has been activated !");
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("login").forward(request, response);
                } else {
                    XMessage message = new XMessage("danger", "Error from system, please feedback for us !");
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("login").forward(request, response);
                }
            } else {
                response.setStatus(404);
            }
        } else {
            response.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}
