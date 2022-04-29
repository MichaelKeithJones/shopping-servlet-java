package controllers;

import doas.DaoFactory;
import models.Product;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "IndexServlet", urlPatterns = "/")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> list = DaoFactory.getProductsDao().all();
        System.out.println("list.get(0).getColor() = " + list.get(0).getColor());

        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
