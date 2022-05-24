package controllers;

import doas.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "IndexServlet", urlPatterns = "/")
public class IndexServlet extends HttpServlet {

    public IndexServlet() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", DaoFactory.getProductsDao().topThreeProducts());
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
