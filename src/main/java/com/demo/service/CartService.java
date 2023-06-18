package com.demo.service;

import com.demo.entity.Cart;

import java.util.List;

public interface CartService {
    Cart addToCart(Integer id);

    List<Cart> getAll();

    void deleteCart(Integer id);

    void deleteAllCart();

    void saveCartDetails();

    List<String> getMyOrder();

    List<Cart> getOrderDetails(String orderId);

}
