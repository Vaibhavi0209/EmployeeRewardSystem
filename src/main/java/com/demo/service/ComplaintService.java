package com.demo.service;

import com.demo.entity.Complaint;

import java.util.List;

public interface ComplaintService {
    List<Complaint> getAll();

    void deleteCompliant(Integer id);

    void add(Complaint complaint);

    Complaint findById(Integer id);

    void complaintStatus(Integer id);
}
