package com.demo.service;

import com.demo.entity.*;
import com.demo.repository.*;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


@Transactional
@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;
    private final LoginVoService loginVoService;
    private final BaseMethods baseMethods;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final TeamRepository teamRepository;
    private final CityRepository cityRepository;
    private final StateRepository stateRepository;
    private final SkillService skillService;
    private final SkillRepository skillRepository;

    @Override
    public List<Employee> getAll() {
        return employeeRepository.findAllByStatusTrue();
    }

    @Override
    public void add(Employee employee, MultipartFile multipartFile, HttpServletRequest request) {

        try {


            String[] skills = request.getParameterValues("skillName");

            String path = request.getSession().getServletContext().getRealPath("/");
            String filePath = path + "employee-images";
            String fileName = multipartFile.getOriginalFilename();
            String generatePassword = baseMethods.generatePassword();

            if (employee.getId() == null) {

                Employee employeeDto = employeeRepository.findEmployeeId();
                if (employeeDto == null) {
                    employee.setEmployeeId("RS0001");
                } else {
                    String employeeId = this.baseMethods.getEmployeeId(employeeDto.getEmployeeId());
                    employee.setEmployeeId(employeeId);
                }

                employee.setModifiedAt(new Date());
                employee.setCreateAt(new Date());
                employee.setStatus(true);
                employee.setEmployeeFileName(fileName);
                employee.setEmployeeFilePath(filePath);
                LoginVO roleEmployee = loginVoService.login(employee.getEmployeeId(), bCryptPasswordEncoder.encode(generatePassword),
                        employee.getStatus(), "ROLE_EMPLOYEE");
                employee.setLoginVO(roleEmployee);
                employeeRepository.save(employee);

                if (skills != null) {
                    for (String skill : skills) {
                        Skill skill1 = new Skill();
                        skill1.setSkillName(skill);
                        skill1.setEmployee(employee);
                        skillService.save(skill1);
                    }
                }

                String content = "Hello " + employee.getEmployeeName() + ", You have been registered in Rising Stars System by Admin. " +
                        "Here are the credentials to get login <br> Username : <b>" + employee.getEmployeeId() + "</b><br> Password : <b>" + generatePassword + "</b>";

                BaseMethods.sendMail(employee.getEmail(), "Rising Stars  System", content);


            } else {
                Employee newEmployee = employeeRepository.findById(employee.getId()).get();
                employee.setModifiedAt(new Date());
                employee.setCreateAt(newEmployee.getCreateAt());
                employee.setStatus(newEmployee.getStatus());
                if (fileName != null && !fileName.equals("")) {
                    employee.setEmployeeFileName(fileName);
                    employee.setEmployeeFilePath(filePath);
                } else {
                    employee.setEmployeeFileName(newEmployee.getEmployeeFileName());
                    employee.setEmployeeFilePath(newEmployee.getEmployeeFilePath());
                }
                List<Skill> skillList = skillRepository.findAllByEmployee(employee.getId());

                for (Skill skill : skillList) {
                    skillRepository.delete(skill);
                }
                if (skills != null) {
                    for (String skill : skills) {
                        Skill skill1 = new Skill();
                        skill1.setSkillName(skill);
                        skill1.setEmployee(employee);
                        skillService.save(skill1);
                    }
                }

                employee.setEmployeeId(newEmployee.getEmployeeId());


                employeeRepository.save(employee);
                
            }

            if (fileName != null && !fileName.equals("")) {
                try {
                    byte barr[] = multipartFile.getBytes();
                    BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));
                    bout.write(barr);
                    bout.flush();
                    bout.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                employee.setEmployeeFilePath(null);
                employee.setEmployeeFileName(null);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteEmployeeWithTeam(Integer id, Integer teamId) {
        teamRepository.deleteEmployeeAndTeamId(teamId, id);
    }

    @Override
    public void deleteEmployee(Integer id) {
        Employee employee = employeeRepository.findById(id).orElse(new Employee());
        employee.setStatus(false);
        this.employeeRepository.save(employee);
    }

    @Override
    public Employee findById(Integer id) {
        return employeeRepository.findById(id).orElse(new Employee());
    }


    @Override
    public List<Employee> getName(Employee employee) {

        List<Employee> employeeList = employeeRepository.findEmployeeByCurrentDate();
        employeeList.stream().map(r -> r.getEmployeeName()).collect(Collectors.toList());
        return employeeList;
    }

    @Override
    public List<City> findByStateId(Integer id) {
        State state = stateRepository.findById(id).orElse(null);
        return cityRepository.findCityByStateId(state);
    }

    @Override
    public Employee getEmployeeProfile() {
        String user = BaseMethods.getUser();
        Employee employeeProfile = employeeRepository.findEmployeeByEmployeeId(user);
        return employeeProfile;
    }

    @Override
    public Employee getEmployeeProfileByUserName(String employeeUserName) {
        Employee employeeProfile = employeeRepository.findEmployeeByEmployeeId(employeeUserName);
        return employeeProfile;
    }

}
