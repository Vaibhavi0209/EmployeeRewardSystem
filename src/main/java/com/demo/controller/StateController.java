package com.demo.controller;

import com.demo.entity.State;
import com.demo.service.StateService;
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
public class StateController {

    private final StateService stateService;

    @GetMapping(value = {"hr/state", "admin/state"})
    public ModelAndView state() {
        List<State> stateList = stateService.getAll();

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/state", "stateList", stateList).addObject("State", new State());
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/state", "stateList", stateList).addObject("State", new State());
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @PostMapping(value = {"hr/saveState", "admin/saveState"})
    public ModelAndView addState(@ModelAttribute State state) {
        String role = BaseMethods.getUserRole();
        this.stateService.add(state);
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/state");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/state");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }


    @GetMapping(value = {"hr/stateDelete", "admin/stateDelete"})
    public ModelAndView deleteState(@RequestParam Integer id) {
        this.stateService.delete(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/state");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/state");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/getStateById/{id}", "admin/getStateById/{id}"})
    public ResponseEntity editState(@PathVariable Integer id) {
        State state = this.stateService.findById(id);
        return new ResponseEntity(state, HttpStatus.OK);
    }


}
