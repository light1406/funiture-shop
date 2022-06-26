package vn.furniture.controller.account;

import vn.furniture.DAO.UserDAO;
import vn.furniture.entity.User;
import vn.furniture.service.RandomTxt;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyController", value = "/verify")
public class VerifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        request.getRequestDispatcher("view/client/verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authCode");
        UserDAO userDAO = new UserDAO();

        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm-password");

        if (password.equals(confirm)) {
            if (user.getCode().equals(code)) {
                user.setPassword(userDAO.hashPassword(password));
                user.setCode(new RandomTxt().randomAlphaNumeric(6));
                userDAO.update(user);
                XMessage message = new XMessage("success", "Update password success!!");
                request.setAttribute("message", message);
                request.setAttribute("title", "login");
                request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
            } else {
                XMessage message = new XMessage("danger", "Code is not match !!");
                request.setAttribute("message", message);
                request.getRequestDispatcher("view/client/verify.jsp").forward(request, response);
            }
        } else {
            XMessage message = new XMessage("danger", "Confirm password is not duplicate !!");
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/client/verify.jsp").forward(request, response);
        }
    }
}
