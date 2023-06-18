package com.demo.service;

import com.demo.entity.Product;
import com.demo.entity.ProductImage;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface ProductService {
    List<Product> getAll();

    void delete(int id);

    void add(Product product, List<MultipartFile> multipartFileList, HttpServletRequest request) throws IOException;

    Product findById(Integer id);

    List<Product> getProductByCategory(String[] category);

}
