package com.demo.service;

import com.demo.entity.Employee;
import com.demo.entity.Team;
import com.demo.repository.EmployeeRepository;
import com.demo.repository.TeamRepository;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
@Transactional

public class TeamServiceImpl implements TeamService {

    private final TeamRepository teamRepository;
    private final EmployeeRepository employeeRepository;

    @Override
    public List<Team> getAll() {
        return teamRepository.findAllByStatusTrue();
    }

    @Override
    public void delete(Integer id) {
        Team team = teamRepository.findById(id).orElse(new Team());
        team.setStatus(false);
        teamRepository.save(team);
    }

    @Override
    public void add(Team team, String[] employeeIds) {
        if (team.getId() == null) {
            team.setCreateAt(new Date());
            team.setModifiedAt(new Date());
            team.setStatus(true);
            List<Employee> employeeList = new ArrayList<>();
            for (String employeeId : employeeIds) {
                int id = Integer.parseInt(employeeId);
                Employee byId = employeeRepository.findById(id).orElse(new Employee());
                employeeList.add(byId);
            }
            team.setEmployees(employeeList);
            teamRepository.save(team);

        } else {
            Team team1 = teamRepository.findById(team.getId()).orElse(new Team());
            team.setCreateAt(team1.getCreateAt());
            team.setModifiedAt(new Date());
            team.setStatus(true);
            List<Employee> employeeList = team1.getEmployees();
            if (employeeIds != null) {
                for (String employeeId : employeeIds) {
                    int id = Integer.parseInt(employeeId);
                    Employee byId = employeeRepository.findById(id).orElse(new Employee());
                    employeeList.add(byId);
                }
            }
            team.setEmployees(employeeList);
            teamRepository.save(team);
        }
    }

    @Override
    public List<Employee> findTeamMemberById(Integer id) {
        List<Integer> employeeIdList = teamRepository.findEmployeeIds(id).orElse(null);
        List<Employee> employeeList = new ArrayList<>();
        if (employeeIdList != null) {
            employeeIdList.forEach(data -> {
                employeeList.add(employeeRepository.findById(data).orElse(new Employee()));
            });
        }
        return employeeList;
    }

    @Override
    public Team findById(Integer id) {
        return teamRepository.findById(id).orElse(new Team());
    }

    @Override
    public List<Team> findTeamName() {

        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Team> teamByEmployeeId = teamRepository.getTeamByEmployeeId(employeeByEmployeeId);
        return teamByEmployeeId;
    }
}

