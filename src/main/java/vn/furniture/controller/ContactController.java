package vn.furniture.controller;

import vn.furniture.DAO.ContactDAO;
import vn.furniture.entity.Contact;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getServletPath().split("/")[1];
        request.setAttribute("title", title);
        request.getRequestDispatcher("view/client/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        ContactDAO contactDAO = new ContactDAO();
        if (message.length() > 0) {
            Contact contact = new Contact();
            contact.setEmail(email);
            contact.setFullName(fullName);
            contact.setSubject(subject);
            contact.setMessage(message);
            contact.setCreatedAt(new Timestamp(new Date().getTime()));
            contactDAO.add(contact);
            response.sendRedirect("contact");
        } else {
            String title = request.getServletPath().split("/")[1];
            request.setAttribute("title", title);
            request.setAttribute("alert", "alert");
            request.getRequestDispatcher("view/client/contact.jsp").forward(request, response);
        }
    }
}
