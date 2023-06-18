package com.demo.entity;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class ProductDto {
    private Product product;
    private List<String> productImageNameList;

    private List<Integer> productImageIdList;
}
