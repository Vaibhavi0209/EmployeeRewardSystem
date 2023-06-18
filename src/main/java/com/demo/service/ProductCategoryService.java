package com.demo.service;

import com.demo.entity.ProductCategory;

import java.util.List;

public interface ProductCategoryService {


    List<ProductCategory> getAll();

    void deleteProductCategory(Integer id);

    void addProductCategory(ProductCategory productCategory);

    ProductCategory findById(Integer id);
}
