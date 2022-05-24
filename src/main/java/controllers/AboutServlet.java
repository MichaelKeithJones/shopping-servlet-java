package controllers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "AboutServlet", urlPatterns = "/about")
public class AboutServlet extends HttpServlet {

    public AboutServlet() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/about.jsp").forward(request, response);
    }

}