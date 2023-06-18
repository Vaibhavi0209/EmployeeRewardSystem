package com.demo.service;

import com.demo.entity.State;
import com.demo.entity.Supplier;
import com.demo.repository.SupplierRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SupplierServiceImpl implements SupplierService {

    private final SupplierRepository supplierRepository;

    @Override
    public List<Supplier> getAll() {
        return supplierRepository.findAllByStatusTrue();
    }

    @Override
    public void add(Supplier supplier) {
        if (supplier.getId() == null) {
            supplier.setCreateAt(new Date());
            supplier.setModifiedAt(new Date());
            supplier.setStatus(true);
            supplierRepository.save(supplier);

        } else {
            Supplier newSupplier = supplierRepository.findById(supplier.getId()).orElse(new Supplier());
            supplier.setCreateAt(newSupplier.getCreateAt());
            supplier.setModifiedAt(new Date());
            supplier.setStatus(true);
            supplierRepository.save(supplier);

        }
    }

    @Override
    public void delete(Integer id) {

        Supplier supplier = supplierRepository.findById(id).orElse(new Supplier());
        supplier.setStatus(false);
        supplierRepository.save(supplier);

    }

    @Override
    public Supplier findById(Integer id) {


        return supplierRepository.findById(id).orElse(new Supplier());

    }


}
