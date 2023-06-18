package com.demo.controller;

import com.demo.entity.JobRole;
import com.demo.entity.Supplier;
import com.demo.service.JobRoleService;
import com.demo.service.SupplierService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SupplierController {
    private final SupplierService supplierService;

    @GetMapping("admin/supplier")
    public ModelAndView supplier() {
        List<Supplier> supplierList = supplierService.getAll();
        return new ModelAndView("admin/supplier", "supplierList", supplierList).addObject("Supplier", new Supplier());
    }

    @PostMapping("admin/saveSupplier")
    public ModelAndView addSupplier(@ModelAttribute Supplier supplier) {
        this.supplierService.add(supplier);
        return new ModelAndView("redirect:/admin/supplier");
    }

    @GetMapping(value = "admin/deleteSupplier")
    public ModelAndView deleteSupplier(@RequestParam Integer id) {
        this.supplierService.delete(id);
        return new ModelAndView("redirect:/admin/supplier");
    }


    @GetMapping(value = "admin/getSupplierById/{id}")
    public ResponseEntity editJobRole(@PathVariable Integer id) throws Exception {
        Supplier supplier = this.supplierService.findById(id);
        return new ResponseEntity(supplier, HttpStatus.OK);
    }
}
