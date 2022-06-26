package vn.furniture.entity;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String, Product> data;
    private final double VAT = 0.1;

    public Cart() {
        this.data = new HashMap<>();
    }

    public Product get(String id) {
        return data.get(id);
    }

    public double getVat() {
        return VAT;
    }

    public int getVatCast() {
        return (int) (VAT * 100);
    }

    public int add(Product product) {
        if (data.containsKey(product.getProductId())) {
            data.get(product.getProductId()).quantityUp();
        } else data.put(product.getProductId(), product);
        return data.get(product.getProductId()).getQuantitySold();
    }

    public int add(String id, int quantity) {
        if (data.containsKey(id)) data.get(id).quantityUp(quantity);
        return data.get(id).getQuantitySold();
    }

    public Product delete(String id) {
        Product p = data.remove(id);
        return p;
    }

    public double totalOfList() {
        double total = 0;
        for (Product p : data.values()) {
            total += p.total();
        }
        return total;
    }

    public double totalWithVAT() {
        return totalOfList() + (totalOfList() * VAT);
    }

    public int quantity() {
        int quantity = 0;
        for (Product p : data.values()) {
            quantity += p.getQuantitySold();
        }
        return quantity;
    }

    public Collection<Product> getData() {
        return data.values();
    }

    public static void main(String[] args) {
        Cart cart = new Cart();
        Product p1 = new Product("01", null, null, 123, 100, 10, 20, null, true, null, null, null);
        p1.setQuantitySold(1);
        cart.add(p1);
        cart.add(p1);

        System.out.println(cart.getData().size());

    }
}
