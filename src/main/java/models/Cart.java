package models;

public class Cart {
    private long id;
    private long product_id;
    private long quantity;

    public Cart() {}

    public Cart(long id, long product_id, long quantity) {
        this.id = id;
        this.product_id = product_id;
        this.quantity = quantity;
    }

    public Cart(Cart cart) {
        this.id = cart.id;
        this.product_id = cart.product_id;
        this.quantity = cart.quantity;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(long product_id) {
        this.product_id = product_id;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
}
