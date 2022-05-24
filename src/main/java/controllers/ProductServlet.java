package controllers;

import doas.DaoFactory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {

    public ProductServlet() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        if(category == null) request.setAttribute("products", DaoFactory.getProductsDao().firstProducts());
        else request.setAttribute("products", DaoFactory.getProductsDao().findByCategoryName(category));
        request.getRequestDispatcher("/WEB-INF/products.jsp").forward(request, response);
    }

}