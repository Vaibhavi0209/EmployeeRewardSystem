package com.demo.repository;

import com.demo.entity.Employee;
import com.demo.entity.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    List<Employee> findAllByStatusTrue();

    @Query(nativeQuery = true, value = "select * from employee_master_tbl emt where dob =CURRENT_DATE() and status=true;")
    List<Employee> findEmployeeByCurrentDate();

    @Query(nativeQuery = true, value = "select * from employee_master_tbl emt order by id desc limit 1;")
    Employee findEmployeeId();

    Employee findEmployeeByEmployeeId(String employeeId);
}
