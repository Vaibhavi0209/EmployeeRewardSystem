package com.demo.service;

import com.demo.entity.Supplier;

import java.util.List;

public interface SupplierService {
    List<Supplier> getAll();

    void add(Supplier supplier);

    void delete(Integer id);

    Supplier findById(Integer id);
}
