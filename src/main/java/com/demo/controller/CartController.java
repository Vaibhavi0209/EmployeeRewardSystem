package com.demo.controller;

import com.demo.entity.Cart;
import com.demo.entity.City;
import com.demo.entity.Product;
import com.demo.entity.ProductImage;
import com.demo.service.CartService;
import com.demo.service.ProductImageservice;
import com.demo.service.ProductService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    private final ProductImageservice productImageservice;
    private final ProductService productService;

    @GetMapping("employee/cart")
    public ModelAndView getAllEmployee() {
        List<Cart> cartList = cartService.getAll();
        List<Product> productIdList = cartList.stream().map(r -> r.getProductId()).collect(Collectors.toList());
        for (Product product : productIdList) {
            List<ProductImage> productImage = productImageservice.findById(product.getId());
            product.setProductImageList(productImage);
        }

        List<Integer> subTotal = new ArrayList<>();
        Integer sum = 0;
        for (Cart cart : cartList) {
            sum = sum + cart.getProductRewards();
        }
        subTotal.add(sum);
        return new ModelAndView("employee/cart", "cartList", cartList).addObject("subTotal", subTotal);

    }

    @GetMapping(value = "employee/addToCart")
    public ModelAndView addToCart(@RequestParam Integer id) {
        cartService.addToCart(id);

        return new ModelAndView("redirect:/employee/cart");
    }


    @GetMapping(value = "employee/deleteCart")
    public ModelAndView deleteCart(@RequestParam Integer id) {
        this.cartService.deleteCart(id);
        return new ModelAndView("redirect:/employee/cart");


    }


    @GetMapping(value = "employee/deleteAllCart")
    public ModelAndView deleteAllCart() {
        this.cartService.deleteAllCart();
        return new ModelAndView("redirect:/employee/cart");


    }

    @GetMapping(value = "employee/getCartDetails")
    public ModelAndView getCartDetails() {
        this.cartService.saveCartDetails();
        return new ModelAndView("redirect:/employee/cart");
    }

}
