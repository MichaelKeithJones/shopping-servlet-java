package controllers;

import doas.DaoFactory;
import models.Cart;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "IndexServlet", urlPatterns = "/")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = DaoFactory.getCartDao().checkCart(3);
        System.out.println("id = " + id);

        List<Cart> list = DaoFactory.getCartDao().all();
        System.out.println("list.get(0).getName() = " + list.get(0).getName());
        System.out.println("list.get(0).getName() = " + list.get(0).getColor());
        System.out.println("list.get(0).getName() = " + list.get(0).getCost());
        System.out.println("list.get(0).getName() = " + list.get(0).getQuantity());

        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

}
