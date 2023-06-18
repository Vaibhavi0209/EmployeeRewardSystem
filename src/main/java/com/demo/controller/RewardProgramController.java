package com.demo.controller;

import com.demo.entity.Event;
import com.demo.entity.RewardProgram;
import com.demo.service.AttendanceService;
import com.demo.service.EventService;
import com.demo.service.RewardProgramService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class RewardProgramController {
    private final RewardProgramService rewardProgramService;
    private final EventService eventService;
    private  final AttendanceService attendanceService;

    @GetMapping(value = {"hr/rewardProgram", "admin/rewardProgram"})
    public ModelAndView event() {
        List<RewardProgram> rewardProgramList = rewardProgramService.getAll();
        List<Event> eventList = eventService.getAll();

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/rewardProgram", "rewardProgramList", rewardProgramList).addObject("RewardProgram", new RewardProgram()).addObject("eventList", eventList);
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/rewardProgram", "rewardProgramList", rewardProgramList).addObject("RewardProgram", new RewardProgram()).addObject("eventList", eventList);
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @PostMapping(value = {"hr/saveRewardProgram", "admin/saveRewardProgram"})
    public ModelAndView addRewardProgram(@ModelAttribute RewardProgram rewardProgram) {
        this.rewardProgramService.add(rewardProgram);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/rewardProgram");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/rewardProgram");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/deleteRewardProgram", "admin/deleteRewardProgram"})
    public ModelAndView deleteRewardProgram(@RequestParam Integer id) {
        this.rewardProgramService.delete(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/rewardProgram");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/rewardProgram");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/statusRewardProgram", "admin/statusRewardProgram"})
    public ModelAndView statusRewardProgram(@RequestParam Integer id) {
        this.rewardProgramService.rewardProgramStatus(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/rewardProgram");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/rewardProgram");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/getRewardProgramById/{id}", "admin/getRewardProgramById/{id}"})
    public ResponseEntity editRewardProgram(@PathVariable Integer id) throws Exception {
        RewardProgram rewardProgram = this.rewardProgramService.findById(id);
        return new ResponseEntity(rewardProgram, HttpStatus.OK);
    }


    @GetMapping(value = "hr/finishEvent")
    public ModelAndView finishEvent(@RequestParam Integer id) {
        rewardProgramService.finishEvent(id);
        return new ModelAndView("redirect:/hr/attendance");


    }

}
