package models;

public class Product {
    private long id;
    private long itemId;
    private long colorId;
    private double height;
    private double width;
    private double length;
    private String dimensionUnit;
    private double weight;
    private String weightUnit;
    private String description;
    private double cost;

    public Product() {}

    public Product(long id, long itemId, long colorId, double height, double width, double length, String dimensionUnit, double weight, String weightUnit, String description, double cost) {
        this.id = id;
        this.itemId = itemId;
        this.colorId = colorId;
        this.height = height;
        this.width = width;
        this.length = length;
        this.dimensionUnit = dimensionUnit;
        this.weight = weight;
        this.weightUnit = weightUnit;
        this.description = description;
        this.cost = cost;
    }

    public Product(Product product) {
        this.id = product.id;
        this.itemId = product.itemId;
        this.colorId = product.colorId;
        this.height = product.height;
        this.width = product.width;
        this.length = product.length;
        this.dimensionUnit = product.dimensionUnit;
        this.weight = product.weight;
        this.weightUnit = product.weightUnit;
        this.description = product.description;
        this.cost = product.cost;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public long getColorId() {
        return colorId;
    }

    public void setColorId(long colorId) {
        this.colorId = colorId;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public String getDimensionUnit() {
        return dimensionUnit;
    }

    public void setDimensionUnit(String dimensionUnit) {
        this.dimensionUnit = dimensionUnit;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getWeightUnit() {
        return weightUnit;
    }

    public void setWeightUnit(String weightUnit) {
        this.weightUnit = weightUnit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }
}
