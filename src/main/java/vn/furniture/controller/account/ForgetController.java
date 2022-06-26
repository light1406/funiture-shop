package vn.furniture.controller.account;

import vn.furniture.DAO.UserDAO;
import vn.furniture.entity.User;
import vn.furniture.service.Mailer;
import vn.furniture.service.XMessage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgetController", value = "/forget")
public class ForgetController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("view/client/forget.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getRow(email);
        if (user != null) {
            Mailer mail = new Mailer();
            String to = user.getEmail();
            String subject = "Verification your account";
            String text = "This is your code verify: " + user.getCode() ;
//            + "\n Code with time to use in 5 minute"
            mail.sendMail(to, subject, text);

            HttpSession session = request.getSession();
            session.setAttribute("authCode", user);
            response.sendRedirect("verify");
        } else {
            XMessage message = new XMessage("danger", "Please check your email !!");
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/client/forget.jsp").forward(request, response);
        }
    }
}
