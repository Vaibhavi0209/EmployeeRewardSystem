package com.demo.service;

import com.demo.entity.Employee;
import com.demo.entity.Team;

import java.util.List;

public interface TeamService {
    List<Team> getAll();

    void delete(Integer id);

    void add(Team team, String[] employeeIds);

    List<Employee> findTeamMemberById(Integer id);

    Team findById(Integer id);

    List<Team> findTeamName();
}
