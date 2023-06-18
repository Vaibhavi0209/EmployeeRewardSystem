package com.demo.service;

import com.demo.entity.Product;
import com.demo.entity.ProductDto;
import com.demo.entity.ProductImage;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public interface ProductImageservice {

    List<ProductImage> getAll();

    List<ProductImage> findById(int id) ;

    ProductDto findByProductName(Product product) throws JsonProcessingException;

    void deleteImage(Integer id);
}
