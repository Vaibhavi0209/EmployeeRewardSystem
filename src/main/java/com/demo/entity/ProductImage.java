package com.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product_image_tbl")
public class ProductImage extends BaseAudit  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "product_file_name")
    private String productFileName;
    @Column(name = "product_file_path")
    private String productFilePath;

    @ManyToOne
    @JoinColumn(name = "Product_id")
    @JsonIgnore
    private Product productId;
}
