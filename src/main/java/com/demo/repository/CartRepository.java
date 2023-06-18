package com.demo.repository;

import com.demo.entity.Cart;
import com.demo.entity.Employee;
import com.demo.entity.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {

    List<Cart> findAllByStatusTrue();

//    @Modifying
//    @Query(nativeQuery = true,value = "SELECT * from cart_master_tbl cmt WHERE login_id = ?1;")
//     List<Cart> findAllByLoginId(Employee id);


    @Modifying
    @Query(nativeQuery = true, value = "SELECT * from cart_master_tbl cmt WHERE cmt.login_id = ?1 and status=true and product_status='PENDING' ")
    List<Cart> findAllByLoginId(Employee id);

    @Modifying
    @Query(nativeQuery = true, value = "SELECT * from cart_master_tbl cmt WHERE cmt.login_id = ?1 and status=true")
    List<Cart> getPurchasedProduct(Employee id);

    @Modifying
    @Query(nativeQuery = true, value = "SELECT distinct order_id from cart_master_tbl cmt WHERE cmt.login_id = ?1 and status=true and product_status='PURCHASED'")
    List<String> findAllByPurchasedProduct(Employee id);

    @Modifying
    @Query(nativeQuery = true, value = "SELECT * from cart_master_tbl cmt WHERE cmt.order_id = ?1 and status=true")
    List<Cart> getOrderDetails(String id);


}
