package com.demo.controller;

import com.demo.dto.BadgeCriteriaDto;
import com.demo.entity.*;
import com.demo.service.EmployeeService;
import com.demo.service.TeamService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor

public class TeamController {

    private final TeamService teamService;

    private final EmployeeService employeeService;

    @GetMapping(value = {"hr/team", "employee/teamDetails"})
    public ModelAndView team() {
        List<Team> teamList = teamService.getAll();
        List<Employee> employeeList = employeeService.getAll();
        String role = BaseMethods.getUserRole();
        Employee employeeName = employeeService.getEmployeeProfile();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/team", "teamList", teamList).addObject("Team", new Team()).addObject("employeeList", employeeList);

        } else if (role.equals("ROLE_EMPLOYEE")) {
            return new ModelAndView("employee/teamDetails", "teamList", teamList)
                    .addObject("Team", new Team())
                    .addObject("employeeName", employeeName);

        } else {
            return new ModelAndView("redirect:/logout");
        }
    }


    @PostMapping("hr/saveTeam")
    public ModelAndView addTeam(@ModelAttribute Team team, HttpServletRequest request) {
        String[] employeeIds = request.getParameterValues("teamMembers");
        this.teamService.add(team, employeeIds);
        return new ModelAndView("redirect:/hr/team");
    }

    @GetMapping(value = "hr/teamDelete")
    public ModelAndView deleteTeam(@RequestParam Integer id) {
        this.teamService.delete(id);
        return new ModelAndView("redirect:/hr/team");
    }


    @PostMapping(value = "hr/deleteMember/{id}/{teamId}")
    public ResponseEntity deleteTeamMember(@PathVariable Integer id, @PathVariable Integer teamId) {
        employeeService.deleteEmployeeWithTeam(id, teamId);
        return new ResponseEntity(HttpStatus.OK);
    }


    @GetMapping(value = "hr/getTeamMembersById/{id}")
    public ResponseEntity getTeamMember(@PathVariable Integer id) {
        List<Employee> teamMemberList = this.teamService.findTeamMemberById(id);
        return new ResponseEntity(teamMemberList, HttpStatus.OK);
    }


    @GetMapping(value = {"hr/getTeamById/{id}", "employee/getTeamById/{id}"})
    public ResponseEntity getTeamById(@PathVariable Integer id) {
        Team teamId = teamService.findById(id);
        return new ResponseEntity(teamId, HttpStatus.OK);
    }

    @GetMapping(value = "employee/getAllTeamsName")
    public ResponseEntity getTeamName() {
        List<Team> teamList = teamService.findTeamName();
        return new ResponseEntity(teamList, HttpStatus.OK);
    }

    @GetMapping(value = "employee/teamDetailsInfo")
    public ResponseEntity teamDetails() {
        List<Team> teamList = teamService.findTeamName();
        return new ResponseEntity(teamList, HttpStatus.OK);

    }

}
