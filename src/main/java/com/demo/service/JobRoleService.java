package com.demo.service;

import com.demo.entity.JobRole;

import java.util.List;

public interface JobRoleService {


    JobRole add(JobRole jobRole);


    List<JobRole> getAll();

    void delete(int id);


    JobRole findById(Integer id) throws Exception;
}
