package com.demo.repository;

import com.demo.entity.JobRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRoleRepository extends JpaRepository<JobRole, Integer> {



    List<JobRole> findAllByStatusTrue();
}
