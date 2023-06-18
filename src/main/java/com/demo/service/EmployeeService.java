package com.demo.service;

import com.demo.entity.City;
import com.demo.entity.Employee;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface EmployeeService {
    List<Employee> getAll();

    void add(Employee employee, MultipartFile multipartFile, HttpServletRequest request);

    void deleteEmployeeWithTeam(Integer id, Integer teamId);

    void deleteEmployee(Integer id);

    Employee findById(Integer id);

    List<Employee> getName(Employee employee);

    List<City> findByStateId(Integer id);

    Employee getEmployeeProfile();

    Employee getEmployeeProfileByUserName(String employeeUserName);

}
