package controllers;

import doas.DaoFactory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import com.google.gson.*;

@WebServlet(name = "DetailsServlet", urlPatterns = "/details")
public class DetailsServlet extends HttpServlet {

    public DetailsServlet() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productsJson = new Gson().toJson(DaoFactory.getProductsDao().getByItemName(request.getParameter("product")));
        request.setAttribute("products", productsJson);
        request.getRequestDispatcher("/WEB-INF/details.jsp").forward(request, response);
    }


}