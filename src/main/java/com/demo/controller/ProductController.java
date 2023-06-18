package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.ProductCategoryService;
import com.demo.service.ProductImageservice;
import com.demo.service.ProductService;
import com.demo.service.SupplierService;
import com.demo.util.BaseMethods;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@AllArgsConstructor
public class ProductController {

    private final ProductService productService;

    private final ProductCategoryService productCategoryService;


    private final ProductImageservice productImageservice;
    private final SupplierService supplierService;


    @GetMapping(value = {"admin/product", "hr/product"})
    public ModelAndView getAllProduct() {
        List<Product> productList = productService.getAll();
        List<ProductCategory> productCategoryList = productCategoryService.getAll();
        List<Supplier> supplierList = supplierService.getAll();


        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/product", "productList", productList).addObject("Product1", new Product()).addObject("productCategoryList", productCategoryList)
                    .addObject("supplierList", supplierList);
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/product", "productList", productList).addObject("Product1", new Product()).addObject("productCategoryList", productCategoryList)
                    .addObject("supplierList", supplierList);
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @RequestMapping(value = "employee/product", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getProducts(HttpServletRequest request) {
        String[] category = request.getParameterValues("category");

        Set categorySet = new HashSet();

        List<Product> productList;
        if (category != null) {
            productList = productService.getProductByCategory(category);
            for (String a : category) {
                categorySet.add(a);
            }
        } else {
            productList = productService.getAll();
            categorySet = null;
        }
        List<ProductCategory> productCategoryList = productCategoryService.getAll();
        for (Product product : productList) {
            List<ProductImage> productImage = productImageservice.findById(product.getId());
            product.setProductImageList(productImage);
        }


        return new ModelAndView("employee/product", "productList", productList)
                .addObject("categoryArray", categorySet)
                .addObject("productCategoryList", productCategoryList);
    }

    @GetMapping(value = "employee/showProductDetails")
    public ModelAndView productDetails(@RequestParam Integer id) {
        Product productDetails = productService.findById(id);

        List<ProductImage> productImage = productImageservice.findById(productDetails.getId());
        productDetails.setProductImageList(productImage);

        return new ModelAndView("employee/productDetails", "productDetails", productDetails);
    }

    @PostMapping(value = {"admin/saveProduct", "hr/saveProduct"})
    public ModelAndView addProduct(@ModelAttribute Product product, @RequestParam List<MultipartFile> multipartFileList, HttpServletRequest request) throws IOException {
        productService.add(product, multipartFileList, request);


        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/product");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/product");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"admin/deleteProduct", "hr/deleteProduct"})
    public ModelAndView deleteProduct(@RequestParam Integer id) {
        productService.delete(id);

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/product");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/product");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }


    @GetMapping(value = {"admin/getProductById/{id}", "hr/getProductById/{id}"})
    public ResponseEntity<ProductDto> editProduct(@PathVariable Integer id) throws IOException {
        Product product = this.productService.findById(id);
        ProductDto productImageNameList = this.productImageservice.findByProductName(product);
        return new ResponseEntity(productImageNameList, HttpStatus.OK);
    }

    @GetMapping(value = {"admin/getProductImageById/{id}", "hr/getProductImageById/{id}"})
    public ResponseEntity getProductImage(@PathVariable Integer id) {
        List<ProductImage> productImageList = this.productImageservice.findById(id);
        return new ResponseEntity(productImageList, HttpStatus.OK);
    }

    @PostMapping(value = {"admin/deleteImage/{id}", "hr/deleteImage/{id}"})
    public ResponseEntity getProductImageId(@PathVariable Integer id) {
        this.productImageservice.deleteImage(id);
        return new ResponseEntity(HttpStatus.OK);
    }


}