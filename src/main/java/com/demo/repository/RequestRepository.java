package com.demo.repository;

import com.demo.entity.Employee;
import com.demo.entity.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RequestRepository extends JpaRepository<Request, Integer> {
    List<Request> findAllByStatusTrue();


    @Query(nativeQuery = true,value = "select * from request_master_tbl rmt WHERE employee_id = ?1 and rmt.request_status ='APPROVED' and status = TRUE")
    List<Request> findAllByRequestStatus(Integer id);
}
