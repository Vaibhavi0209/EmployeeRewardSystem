package com.demo.controller;


import com.demo.entity.Cart;
import com.demo.entity.Product;
import com.demo.entity.ProductImage;
import com.demo.service.CartService;
import com.demo.service.ProductImageservice;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class MyOrderController {
    private final CartService cartService;
    private final ProductImageservice productImageservice;

    @GetMapping("employee/myOrder")
    public ModelAndView getAllEmployee() {

        List<String> orderList = cartService.getMyOrder();

        Map<String, Object> map = new HashMap();

        for (String orderId : orderList) {

            List<Cart> cartList = cartService.getOrderDetails(orderId);

            List<Product> productIdList = cartList.stream().map(Cart::getProductId).collect(Collectors.toList());

            for (Product product : productIdList) {
                List<ProductImage> productImage = productImageservice.findById(product.getId());

                product.setProductImageList(productImage);
            }
            map.put(orderId, productIdList);
        }

        return new ModelAndView("employee/myOrder", "cartMap", map);

    }

    @GetMapping("employee/getOrderDetails")
    public ResponseEntity getOrderDetails(@RequestParam String orderId) {

        List<Cart> cartList = cartService.getOrderDetails(orderId);

        List<Product> productIdList = cartList.stream().map(r -> r.getProductId()).collect(Collectors.toList());

        for (Product product : productIdList) {
            List<ProductImage> productImage = productImageservice.findById(product.getId());
            product.setProductImageList(productImage);
        }

        return new ResponseEntity(productIdList, HttpStatus.OK);

    }

}
