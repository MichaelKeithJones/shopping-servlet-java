package controllers;

import doas.*;
import models.*;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import org.json.HTTP;
import org.json.JSONObject;

import com.google.gson.Gson;

@WebServlet(name = "CartServlet", urlPatterns = "/cart")
public class CartServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = DaoFactory.getProductsDao().getShoppingCart();
        String json = new Gson().toJson(products);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuffer jb = new StringBuffer();
        String line = null;

        while ((line = reader.readLine()) != null) jb.append(line);
        JSONObject jsonObject =  new JSONObject(jb.toString());

        String action = jsonObject.getString("action");
        long id = jsonObject.getLong("id");

        switch (action) {
            case "set": {
                long quantity = jsonObject.getLong("quantity");
                DaoFactory.getProductsDao().setCartQuantity(id, quantity);
            } break;
            case "remove": {
                DaoFactory.getProductsDao().deleteProductCart(id);
            } break;
            case "add": {
                long quantity = jsonObject.getLong("quantity");
                long oldQuantity = DaoFactory.getProductsDao().getCartQuantity(id);
                if (oldQuantity == 0) DaoFactory.getProductsDao().addProductCart(id, quantity);
                else DaoFactory.getProductsDao().setCartQuantity(id, oldQuantity + quantity);
            } break;
        }

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Post complete.");
    }

}
