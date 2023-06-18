package com.demo.repository;

import com.demo.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {


    List<Product> findAllByStatusTrue();

    @Query(nativeQuery = true, value = "select * from product_master_tbl where status = true and category_id in (?1)")
    List<Product> getProductByCategory(List<Integer> categoryIds);

}
