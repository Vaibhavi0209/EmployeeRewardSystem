package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.EmployeeService;
import com.demo.service.JobRoleService;
import com.demo.service.SkillService;
import com.demo.service.StateService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;
    private final JobRoleService jobRoleService;
    private final StateService stateService;
    private final SkillService skillService;


    @GetMapping(value = {"hr/employee", "admin/employee"})
    public ModelAndView getAllEmployee() {
        String role = BaseMethods.getUserRole();
        List<Employee> employeeList = employeeService.getAll();
        List<JobRole> jobRoleList = jobRoleService.getAll();
        List<State> stateList = stateService.getAll();

        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/employee", "employeeList", employeeList)
                    .addObject("employee", new Employee()).addObject("jobRoleList", jobRoleList).addObject("stateList", stateList);
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/employee", "employeeList", employeeList)
                    .addObject("employee", new Employee()).addObject("jobRoleList", jobRoleList).addObject("stateList", stateList);
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @PostMapping(value = {"hr/saveEmployee", "admin/saveEmployee"})
    public ModelAndView addEmployee(@ModelAttribute Employee employee, @RequestParam MultipartFile multipartFile, HttpServletRequest request) {
        String role = BaseMethods.getUserRole();
        this.employeeService.add(employee, multipartFile, request);
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/employee");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/employee");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }


    @GetMapping(value = {"hr/deleteEmployee", "admin/deleteEmployee"})
    public ModelAndView deleteBadge(@RequestParam Integer id) {
        String role = BaseMethods.getUserRole();
        this.employeeService.deleteEmployee(id);
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/employee");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/employee");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }

    @GetMapping(value = {"hr/getEmployeeById/{id}", "admin/getEmployeeById/{id}"})
    public ResponseEntity getEmployee(@PathVariable Integer id) {
        Employee employee = employeeService.findById(id);
        return new ResponseEntity(employee, HttpStatus.OK);
    }

    @GetMapping(value = "employee/getAllEmployeeName")
    public ResponseEntity getEmployee(@ModelAttribute Employee employee) {
        List<Employee> employeeList = employeeService.getName(employee);
        return new ResponseEntity(employeeList, HttpStatus.OK);
    }

    @GetMapping(value = {"admin/getSelectedCity/{id}", "hr/getSelectedCity/{id}"})
    public ResponseEntity getSelectedCity(@PathVariable Integer id) {
        List<City> cityList = employeeService.findByStateId(id);
        return new ResponseEntity(cityList, HttpStatus.OK);
    }

    @GetMapping(value = {"admin/getEmployeeInfo/{id}", "hr/getEmployeeInfo/{id}"})
    public ResponseEntity getEmployeeInfo(@PathVariable Integer id) {
        Employee employee = employeeService.findById(id);
        return new ResponseEntity<>(employee, HttpStatus.OK);
    }

    @GetMapping(value = {"hr/getEmployeeSkillById/{id}", "admin/getEmployeeSkillById/{id}"})
    public ResponseEntity getEmployeeSkillById(@PathVariable Integer id) {
        List<Skill> skillList = skillService.getSkillList(id);
        return new ResponseEntity(skillList, HttpStatus.OK);
    }

}
