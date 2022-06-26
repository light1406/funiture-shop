package vn.furniture.controller.account;

import vn.furniture.DAO.UserDAO;
import vn.furniture.entity.User;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getRow(email);

        if (user != null) {
            if (user.getPassword().equals(userDAO.hashPassword(password))) {
                if (user.isStatus()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("account", user);
                    response.sendRedirect("home");
                } else {
                    XMessage message = new XMessage("danger", "Your account is not active, please check email to active");
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
                }
            } else {
                XMessage message = new XMessage("danger", "Password is wrong");
                request.setAttribute("message", message);
                request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
            }
        } else {
            XMessage message = new XMessage("danger", "Account is not register");
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
        }

    }
}
