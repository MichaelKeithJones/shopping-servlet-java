package controllers;

import doas.DaoFactory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "IndexServlet", urlPatterns = "/")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = DaoFactory.getCartDao().checkCart(3);
        System.out.println("id = " + id);

        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
