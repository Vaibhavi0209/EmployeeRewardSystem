package com.demo.controller;

import com.demo.entity.Event;
import com.demo.entity.JobRole;
import com.demo.service.EventService;
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
public class EventController {

    private final EventService eventService;

    @GetMapping(value = {"hr/event", "admin/event", "employee/event"})
    public ModelAndView event() {
        List<Event> eventList = eventService.getAll();

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/event", "eventList", eventList).addObject("Event", new Event());
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/event", "eventList", eventList).addObject("Event", new Event());
        } else if (role.equals("ROLE_EMPLOYEE")) {
            return new ModelAndView("employee/event", "eventList", eventList).addObject("Event", new Event());
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @PostMapping(value = {"hr/saveEvent", "admin/saveEvent"})
    public ModelAndView addEvent(@ModelAttribute Event event, @RequestParam MultipartFile multipartFile, HttpServletRequest request) {
        Event saveEvent = this.eventService.add(event,multipartFile,request);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/event");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/event");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/deleteEvent", "admin/deleteEvent"})
    public ModelAndView deleteEvent(@RequestParam Integer id) {
        this.eventService.delete(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/event");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/event");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }


    @GetMapping(value = {"hr/getEventById/{id}", "admin/getEventById/{id}"})
    public ResponseEntity editEvent(@PathVariable Integer id) throws Exception {
        Event event = this.eventService.findById(id);
        return new ResponseEntity(event, HttpStatus.OK);
    }
}
