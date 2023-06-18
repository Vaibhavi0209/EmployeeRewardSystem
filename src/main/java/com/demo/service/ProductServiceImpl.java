package com.demo.service;

import com.demo.entity.Product;
import com.demo.entity.ProductImage;
import com.demo.repository.ProductImageRepository;
import com.demo.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductImageRepository productImageRepository;


    @Override
    public List<Product> getAll() {
        return productRepository.findAllByStatusTrue();
    }

    @Override
    public void delete(int id) {
        Product product = productRepository.findById(id).orElse(new Product());
        product.setStatus(false);
        productRepository.save(product);
    }

    @Override
    public void add(Product product, List<MultipartFile> multipartFileList, HttpServletRequest request) throws IOException {

        try {

            String path = request.getSession().getServletContext().getRealPath("/");
            String filePath = path + "product-images";

            if (product.getId() == null) {
                product.setCreateAt(new Date());
                product.setModifiedAt(new Date());
                product.setStatus(true);
                productRepository.save(product);


            } else {
                Product product1 = productRepository.findById(product.getId()).get();
                product.setCreateAt(product1.getCreateAt());
                product.setModifiedAt(new Date());
                product.setStatus(product1.getStatus());
                this.productRepository.save(product);
            }
            if (multipartFileList != null && !multipartFileList.isEmpty()) {
                for (MultipartFile file : multipartFileList) {
                    String fileName = file.getOriginalFilename();
                    if (fileName != null && !fileName.equals("")) {
                        try {
                            byte barr[] = file.getBytes();


                            BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));
                            bout.write(barr);
                            bout.flush();
                            bout.close();

                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        ProductImage productImage = new ProductImage();
                        productImage.setProductId(product);
                        productImage.setProductFileName(fileName);
                        productImage.setProductFilePath(filePath);
                        productImage.setStatus(true);
                        productImage.setCreateAt(new Date());
                        productImage.setModifiedAt(new Date());
                        productImageRepository.save(productImage);
                    }
                }
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    @Override
    public Product findById(Integer id) {
        Product product = productRepository.findById(id).orElse(new Product());
        return product;
    }

    @Override
    public List<Product> getProductByCategory(String[] category) {

        List<Integer> intList = new ArrayList<>(category.length);
        for (String i : category)
        {
            intList.add(Integer.valueOf(i));
        }
        List<Product> list = productRepository.getProductByCategory(intList);
        return list;
    }
}
