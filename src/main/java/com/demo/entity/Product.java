package com.demo.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product_master_tbl")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product extends BaseAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "product_name")
    private String productName;
    @Column(name = "product_Rewards")
    private Integer productRewards;

    @Column(name = "product_description")
    private String productDescription;
    @Column(name = "total_product")
    private Integer totalProduct;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private ProductCategory categoryId;

    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Supplier supplierId;

    @Transient
    private List<ProductImage> productImageList;

}

