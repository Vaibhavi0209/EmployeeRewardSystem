package com.demo.service;

import com.demo.entity.JobRole;
import com.demo.repository.JobRoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Service
public class JobRoleServiceImpl implements JobRoleService {

    private final JobRoleRepository jobRoleRepository;

    @Override
    public List<JobRole> getAll() {
        return jobRoleRepository.findAllByStatusTrue();
    }

    @Override
    public JobRole add(JobRole jobRole) {
        if (jobRole.getId() == null) {
            jobRole.setCreateAt(new Date());
            jobRole.setModifiedAt(new Date());
            jobRole.setStatus(true);
            return jobRoleRepository.save(jobRole);
        } else {
            JobRole jobRole1 = jobRoleRepository.findById(jobRole.getId()).get();
            jobRole.setCreateAt(jobRole1.getCreateAt());
            jobRole.setModifiedAt(new Date());
            jobRole.setStatus(jobRole1.getStatus());
            return this.jobRoleRepository.save(jobRole);
        }
    }


    @Override
    public void delete(int id) {
        JobRole deleteId = jobRoleRepository.findById(id).orElse(new JobRole());
        deleteId.setStatus(false);
        this.jobRoleRepository.save(deleteId);
    }

    @Override
    public JobRole findById(Integer id) {
        return jobRoleRepository.findById(id).orElse(new JobRole());
    }


}
