package vn.furniture.controller.account;

import vn.furniture.DAO.UserDAO;
import vn.furniture.entity.User;
import vn.furniture.service.Mailer;
import vn.furniture.service.XMessage;
import vn.furniture.service.RandomTxt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        request.getRequestDispatcher("view/client/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String re_password = request.getParameter("confirm-password");
        String address = request.getParameter("address");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getRow(email);

        if (user != null) {
            XMessage message = new XMessage("danger", "Account is exist, please register with other email !!");
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/client/register.jsp").forward(request, response);
        } else {
            if (!password.equals(re_password)) {
                XMessage message = new XMessage("danger", "Confirm Password is not duplicate !!");
                request.setAttribute("message", message);
                request.getRequestDispatcher("view/client/register.jsp").forward(request, response);
            } else {
                user = new User();
                user.setEmail(email);
                user.setUserName(fullName);
                user.setPassword(userDAO.hashPassword(password));
                user.setPhone(phone);
                user.setAddress(address);
                user.setRole(false);
                user.setStatus(false);
                user.setCreatedAt(new Timestamp(new Date().getTime()));
                user.setCode(new RandomTxt().randomAlphaNumeric(6));
                if (userDAO.add(user) == 1) {
                    Mailer mail = new Mailer();
                    String to = user.getEmail();
                    String subject = "Active your account from shop furniture";
                    String text = "Click path to active account, please not share this link\n" + "http://localhost:8080/active?key1=" + user.getEmail() + "&key2=" + user.getPassword();
                    mail.sendMail(to, subject, text);
                    XMessage message = new XMessage("success", "Please check your email to active your account !!");
                    request.setAttribute("message", message);
                    request.setAttribute("title", "login");
                    request.getRequestDispatcher("view/client/login.jsp").forward(request, response);
                } else {
                    XMessage message = new XMessage("danger", "Error from system, please feedback for us, thank you !!");
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("view/client/register.jsp").forward(request, response);
                }
            }

        }


    }
}
