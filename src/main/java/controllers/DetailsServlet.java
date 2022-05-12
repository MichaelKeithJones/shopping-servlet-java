package controllers;

import doas.DaoFactory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DetailsServlet", urlPatterns = "/details")
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        request.setAttribute("products", DaoFactory.getProductsDao().getByItemName(product));
        request.getRequestDispatcher("/WEB-INF/details.jsp").forward(request, response);
    }

}
