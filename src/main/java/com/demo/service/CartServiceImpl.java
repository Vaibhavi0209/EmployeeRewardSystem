package com.demo.service;

import com.demo.entity.*;
import com.demo.repository.CartRepository;
import com.demo.repository.EmployeeRepository;
import com.demo.repository.ProductRepository;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    private final CartRepository cartRepository;
    private final ProductRepository productRepository;
    private final EmployeeRepository employeeRepository;

    @Override
    public Cart addToCart(Integer id) {
        Product product = productRepository.findById(id).orElse(new Product());
        String user = BaseMethods.getUser();
        Employee employeeId = employeeRepository.findEmployeeByEmployeeId(user);
        Cart cart = new Cart();
        cart.setProductId(product);
        cart.setProductRewards(product.getProductRewards());
        cart.setLoginId(employeeId);
        cart.setModifiedAt(new Date());
        cart.setCreateAt(new Date());
        cart.setStatus(true);
        cart.setProductStatus("PENDING");
        cartRepository.save(cart);
        return cart;
    }

    @Override
    public List<Cart> getAll() {
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Cart> cartList = cartRepository.findAllByLoginId(employeeByEmployeeId);
        return cartList;
    }

    @Override
    public void deleteCart(Integer id) {
        Cart cart = cartRepository.findById(id).orElse(null);
        cart.setStatus(false);
        this.cartRepository.save(cart);
    }

    @Override
    public void deleteAllCart() {
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Cart> cartList = cartRepository.findAllByLoginId(employeeByEmployeeId);

        for (Cart cart : cartList) {
            cart.setStatus(false);
            this.cartRepository.save(cart);
        }

    }

    @Override
    public void saveCartDetails() {

        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Cart> cartList = cartRepository.getPurchasedProduct(employeeByEmployeeId);

        for (Cart cart : cartList) {
            cart.setProductStatus("PURCHASED");
            String uuid = UUID.randomUUID().toString();
            cart.setOrderId(uuid);
            this.cartRepository.save(cart);
        }
    }


    @Override
    public List<String> getMyOrder() {
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<String> cartList = cartRepository.findAllByPurchasedProduct(employeeByEmployeeId);
        return cartList;
    }

    @Override
    public List<Cart> getOrderDetails(String orderId) {
        List<Cart> cartList = cartRepository.getOrderDetails(orderId);
        return cartList;
    }

}
