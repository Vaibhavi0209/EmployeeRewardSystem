package com.demo.controller;

import com.demo.entity.Complaint;
import com.demo.service.ComplaintService;
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
public class ComplaintController {
    private final ComplaintService complaintService;

    @GetMapping(value = {"hr/complaint", "admin/complaint"})
    public ModelAndView getAllEmployee() {
        String role = BaseMethods.getUserRole();
        List<Complaint> complaintList = complaintService.getAll();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/complaint", "complaintList", complaintList)
                    .addObject("complaint", new Complaint());
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/complaint", "complaintList", complaintList)
                    .addObject("complaint", new Complaint());
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @PostMapping(value = {"hr/saveComplaint", "admin/saveComplaint"})
    public ModelAndView addComplaint(@ModelAttribute Complaint complaint) {
        this.complaintService.add(complaint);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/complaint");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/complaint");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }

    @GetMapping(value = {"hr/deleteComplaint", "admin/deleteComplaint"})
    public ModelAndView deleteComplaint(@RequestParam Integer id) {

        this.complaintService.deleteCompliant(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/complaint");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/complaint");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }

    @GetMapping(value = {"hr/getComplaintById/{id}", "admin/getComplaintById/{id}"})
    public ResponseEntity getComplaintById(@PathVariable Integer id) {
        Complaint complaint = complaintService.findById(id);
        return new ResponseEntity(complaint, HttpStatus.OK);
    }

    @GetMapping(value = {"hr/complaintStatus", "admin/complaintStatus"})
    public ModelAndView complaintStatus(@RequestParam Integer id) {
        this.complaintService.complaintStatus(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/complaint");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/complaint");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }
}
