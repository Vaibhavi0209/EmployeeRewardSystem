package com.demo.controller;

import com.demo.entity.Badge;
import com.demo.entity.Complaint;
import com.demo.entity.Request;
import com.demo.service.RequestService;
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
public class RequestController {

    private final RequestService requestService;

    @GetMapping("hr/request")
    public ModelAndView request() {
        List<Request> requestList = requestService.getAll();
        return new ModelAndView("hr/request", "requestList", requestList).addObject("request", new Request());
    }

    @GetMapping(value = "hr/deleteRequest")
    public ModelAndView deleteRequest(@RequestParam Integer id) {
        this.requestService.deleteRequest(id);
        return new ModelAndView("redirect:/hr/request");

    }

    @GetMapping(value = "hr/sendReply/{id}")
    public ResponseEntity sendReply(@PathVariable Integer id) {
        Request request = requestService.findById(id);
        return new ResponseEntity(request, HttpStatus.OK);
    }


    @GetMapping(value = "hr/sendReward/{id}")
    public ResponseEntity sendReward(@PathVariable Integer id) {
        Request request = requestService.findById(id);
        return new ResponseEntity(request, HttpStatus.OK);
    }

    @PostMapping("hr/saveReply")
    public ModelAndView addRequest(@ModelAttribute Request request) {
        this.requestService.addReply(request);
        return new ModelAndView("redirect:/hr/request");
    }

}
