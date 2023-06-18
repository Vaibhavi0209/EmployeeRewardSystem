package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProfileController {

    private final EmployeeService employeeService;
    private final SkillService skillService;
    private final PostService postService;
    private final RequestService requestService;
    private final AttendanceService attendanceService;

    @GetMapping(value = {"employee/profile", "employee/profile"})
    public ModelAndView profile(@RequestParam(required = false,name = "id") String employeeUserName) {
        Integer employeeId;
        Employee employeeInfo;

        if (employeeUserName == null) {
            employeeInfo = employeeService.getEmployeeProfile();
        } else {
            employeeInfo = employeeService.getEmployeeProfileByUserName(employeeUserName);
        }

        employeeId = employeeInfo.getId();
        List ls = this.attendanceService.getRewardsByEmployeeId(employeeId);
        List rewardsList = this.requestService.getRequestByEmployeeId(employeeId);
        List<Skill> skills = skillService.getSkillList(employeeId);
        List<Posts> postsList = postService.getEmployeePosts(employeeId);

        return new ModelAndView("employee/profile")
                .addObject("employeeInfo", employeeInfo).addObject("skills", skills)
                .addObject("postsList", postsList).addObject("requestData", new Request())
                .addObject("ls", ls)
                .addObject("rewardsList", rewardsList);
    }

    @PostMapping("employee/saveRequest")
    public ModelAndView addRequest(@ModelAttribute Request request, @RequestParam MultipartFile multipartFile, HttpServletRequest httpServletRequest) {
        this.requestService.add(request, multipartFile, httpServletRequest);
        return new ModelAndView("redirect:/employee/profile");
    }

}
