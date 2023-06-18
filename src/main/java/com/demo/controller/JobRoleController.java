package com.demo.controller;

import com.demo.entity.JobRole;
import com.demo.service.JobRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor

public class JobRoleController {

    private final JobRoleService jobRoleService;

    @GetMapping("admin/jobRole")
    public ModelAndView jobRole() {
        List<JobRole> jobRolesList = jobRoleService.getAll();
        return new ModelAndView("admin/jobRole", "jobRolesList", jobRolesList).addObject("JobRole", new JobRole());
    }

    @PostMapping("admin/saveJobRole")
    public ModelAndView addJobRole(@ModelAttribute JobRole jobRole) {
        this.jobRoleService.add(jobRole);
        return new ModelAndView("redirect:/admin/jobRole");
    }

    @GetMapping(value = "admin/deleteJobRole")
    public ModelAndView deleteJobRole(@RequestParam Integer id) {
        this.jobRoleService.delete(id);
        return new ModelAndView("redirect:/admin/jobRole");
    }


    @GetMapping(value = "admin/getJobRoleById/{id}")
    public ResponseEntity editJobRole(@PathVariable Integer id) throws Exception {
        JobRole jobRole = this.jobRoleService.findById(id);
        return new ResponseEntity(jobRole, HttpStatus.OK);
    }

}
