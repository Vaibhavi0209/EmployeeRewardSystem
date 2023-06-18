package com.demo.service;

import com.demo.entity.ProductCategory;
import com.demo.repository.ProductCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {

    private final ProductCategoryRepository productCategoryRepository;

    @Override
    public List<ProductCategory> getAll() {
        return productCategoryRepository.findAllByStatusTrue();
    }

    @Override
    public void deleteProductCategory(Integer id) {
        ProductCategory productCategory = productCategoryRepository.findById(id).orElse(new ProductCategory());
        productCategory.setStatus(false);
        productCategoryRepository.save(productCategory);
    }

    @Override
    public void addProductCategory(ProductCategory productCategory) {
        if (productCategory.getId() == null) {
            productCategory.setStatus(true);
            productCategory.setModifiedAt(new Date());
            productCategory.setCreateAt(new Date());
            productCategoryRepository.save(productCategory);
        } else {
            ProductCategory addProductCategory = productCategoryRepository.findById(productCategory.getId()).orElse(new ProductCategory());
            productCategory.setStatus(addProductCategory.getStatus());
            productCategory.setCreateAt(addProductCategory.getCreateAt());
            productCategory.setModifiedAt(new Date());
            this.productCategoryRepository.save(productCategory);
        }
    }

    @Override
    public ProductCategory findById(Integer id) {
        return productCategoryRepository.findById(id).orElse(new ProductCategory());
    }
}
