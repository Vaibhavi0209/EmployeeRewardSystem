package com.demo.service;

import com.demo.entity.Product;
import com.demo.entity.ProductDto;
import com.demo.entity.ProductImage;
import com.demo.repository.ProductImageRepository;
import com.demo.repository.ProductRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ProductImageServiceImpl implements ProductImageservice {

    private final ProductImageRepository productImageRepository;

    private final ProductRepository productRepository;

    @Override
    public List<ProductImage> getAll() {
        return productImageRepository.findAll();
    }

    @Override
    public List<ProductImage> findById(int id) {
        Product product = productRepository.findById(id).orElseGet(null);
        List<ProductImage> productImage = productImageRepository.findByProductIdAndStatusTrue(product);
        return productImage;
    }

    @Override
    public ProductDto findByProductName(Product product) throws JsonProcessingException {
        Product product1 = productRepository.findById(product.getId()).orElseGet(null);
        List<ProductImage> productImageName=productImageRepository.findProductImageName(product1.getId());
        ProductDto productDto=new ProductDto();
        productDto.setProduct(product1);
        List<String> fileNameList = productImageName.stream().map(ProductImage::getProductFileName).collect(Collectors.toList());
        productDto.setProductImageNameList(fileNameList);
        List<Integer> fileIdList = productImageName.stream().map(ProductImage::getId).collect(Collectors.toList());
        productDto.setProductImageIdList(fileIdList);
        return productDto;
    }

    @Override
    public void deleteImage(Integer id) {
        ProductImage productImage = productImageRepository.findById(id).orElse(new ProductImage());
        productImage.setStatus(Boolean.FALSE);
        productImageRepository.save(productImage);

    }
}
