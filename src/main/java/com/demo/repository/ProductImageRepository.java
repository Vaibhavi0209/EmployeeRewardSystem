package com.demo.repository;

import com.demo.entity.Product;
import com.demo.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage,Integer> {


    List<ProductImage> findByProductIdAndStatusTrue(Product product);
    @Query(nativeQuery = true, value = "select * from product_image_tbl pit where pit.product_id =?1 and status= true  ")
    List<ProductImage>findProductImageName(Integer id);






}
