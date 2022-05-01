package models;

public class Cart {
    private String name;
    private double cost;
    private String color;
    private long quantity;

    public Cart() {}

    public Cart(String name, double cost, String color, long quantity) {
        this.name = name;
        this.cost = cost;
        this.color = color;
        this.quantity = quantity;
    }

    public Cart(Cart cart) {
        this.name = cart.name;
        this.cost = cart.cost;
        this.color = cart.color;
        this.quantity = cart.quantity;
    }

    public String getName() {
        return name;
    }

    public double getCost() {
        return cost;
    }

    public String getColor() {
        return color;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
}
