package com.demo.controller;

import com.demo.entity.ProductCategory;
import com.demo.service.ProductCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductCategoryController {

    private final ProductCategoryService productCategoryService;

    @GetMapping("admin/category")
    public ModelAndView productCategory() {
        List<ProductCategory> productCategoryList = productCategoryService.getAll();
        return new ModelAndView("admin/productCategory", "productCategoryList", productCategoryList)
                .addObject("productCategory1", new ProductCategory());
    }

    @PostMapping(value = "admin/saveProductCategory")
    public ModelAndView addProductCategory(@ModelAttribute ProductCategory productCategory) {
        productCategoryService.addProductCategory(productCategory);
        return new ModelAndView("redirect:/admin/category");
    }

    @GetMapping(value = "admin/deleteProductCategory")
    public ModelAndView deleteProductCategory(@RequestParam Integer id) {
        productCategoryService.deleteProductCategory(id);
        return new ModelAndView("redirect:/admin/category");
    }

    @GetMapping(value = "admin/getCategoryById/{id}")
    public ResponseEntity getCategoryById(@PathVariable Integer id) throws Exception {
        ProductCategory productCategory = productCategoryService.findById(id);
        return new ResponseEntity(productCategory, HttpStatus.OK);
    }

}
