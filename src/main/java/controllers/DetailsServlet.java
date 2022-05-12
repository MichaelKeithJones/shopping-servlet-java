package controllers;

import doas.DaoFactory;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import com.google.gson.*;
import models.Product;

@WebServlet(name = "DetailsServlet", urlPatterns = "/details")
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        request.setAttribute("products", DaoFactory.getProductsDao().getByItemName(product));
        request.getRequestDispatcher("/WEB-INF/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        System.out.println("product = " + product);
        List<Product> products = DaoFactory.getProductsDao().getByItemName(product);
        String json = new Gson().toJson(products);

        System.out.println("json = " + json);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}
