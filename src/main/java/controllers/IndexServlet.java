package controllers;

import doas.DaoFactory;
import models.Product;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "IndexServlet", urlPatterns = "/")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //List<Product> list = DaoFactory.getProductsDao().findByCategoryId(1);
        Map<Product, Long> list = DaoFactory.getProductsDao().getCart();
        System.out.println("list.size() = " + list.size());

        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
