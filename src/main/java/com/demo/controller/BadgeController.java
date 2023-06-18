package com.demo.controller;

import com.demo.dto.BadgeCriteriaDto;
import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import com.demo.service.BadgeCriteriaService;
import com.demo.service.BadgeService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BadgeController {

    private final BadgeService badgeService;

    private final BadgeCriteriaService badgeCriteriaService;


    @GetMapping(value = {"admin/badge", "hr/badge"})
    public ModelAndView getAllBadge() {
        List<Badge> badgeList = badgeService.getAll();

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/badge", "badgeList", badgeList)
                    .addObject("Badge", new Badge());
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/badge", "badgeList", badgeList)
                    .addObject("Badge", new Badge());
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @PostMapping(value = {"admin/saveBadge", "hr/saveBadge"})
    public ModelAndView addBadge(@ModelAttribute Badge badge, @RequestParam MultipartFile multipartFile, HttpServletRequest request) {
        String criteria[] = request.getParameterValues("criteriadetail");
        this.badgeService.addBadge(badge, multipartFile, request, criteria);

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/badge");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/badge");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }

    @GetMapping(value = {"admin/deleteBadge", "hr/deleteBadge"})
    public ModelAndView deleteBadge(@RequestParam Integer id) {
        this.badgeService.deleteBadge(id);

        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/badge");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/badge");
        } else {
            return new ModelAndView("redirect:/logout");
        }


    }

    @GetMapping(value = {"admin/getBadgeById/{id}", "hr//getBadgeById/{id}"})
    public ResponseEntity<BadgeCriteriaDto> editBadge(@PathVariable Integer id) {
        Badge badgeId = badgeService.findById(id);

        BadgeCriteriaDto badgeCriteriaDto = badgeCriteriaService.findbyCriteria(badgeId);
        return new ResponseEntity(badgeCriteriaDto, HttpStatus.OK);
    }

    @GetMapping(value = {"admin/getCriteriaById/{id}", "hr/getCriteriaById/{id}"})
    public ResponseEntity<List<BadgeCriteria>> getCriteria(@PathVariable Integer id) {
        return new ResponseEntity<>(badgeCriteriaService.BadgeAndStatusTrue(id), HttpStatus.OK);
    }


}
