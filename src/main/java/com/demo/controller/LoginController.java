package com.demo.controller;

import com.demo.entity.Attendance;
import com.demo.entity.Posts;
import com.demo.entity.Request;
import com.demo.service.AttendanceService;
import com.demo.service.PostService;
import com.demo.service.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class LoginController {

    private final PostService postService;
    private final AttendanceService attendanceService;
    private final RequestService requestService;

    @GetMapping({"/", "login"})
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @GetMapping("admin/index")
    public ModelAndView adminIndex() {
        return new ModelAndView("admin/index");
    }

    @GetMapping("hr/index")
    public ModelAndView hrIndex() {
        return new ModelAndView("hr/index");
    }

    @GetMapping("employee/index")
    public ModelAndView employeeIndex() {
        List<Posts> postsList = this.postService.getPosts();

            List ls = this.attendanceService.getAllRewards();
            List rewardsList =this.requestService.getAllRequest();

        return new ModelAndView("employee/index", "postsList", postsList).addObject("ls",ls).addObject("rewardsList",rewardsList);
    }


}
