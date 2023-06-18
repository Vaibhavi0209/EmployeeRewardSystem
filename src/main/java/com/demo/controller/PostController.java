package com.demo.controller;

import com.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @PostMapping(value = {"employee/savePost"})
    public ModelAndView savePost(@RequestParam MultipartFile file, @RequestParam String description, HttpServletRequest request) {
        this.postService.savePost(file, description,request);
        return new ModelAndView("redirect:/employee/index");
    }


}
