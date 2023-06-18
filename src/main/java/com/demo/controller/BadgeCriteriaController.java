package com.demo.controller;

import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import com.demo.service.BadgeCriteriaService;
import com.demo.service.BadgeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BadgeCriteriaController {

    private final BadgeCriteriaService badgeCriteriaService;

    private final BadgeService badgeService;


    @PostMapping(value = "admin/saveBadgeCriteria")
    public ModelAndView insertBadge(@ModelAttribute BadgeCriteria badgeCriteria) {
        this.badgeCriteriaService.addBadgeCriteria(badgeCriteria);
        return new ModelAndView("redirect:/");
    }

    @GetMapping(value = "admin/BadgeCriteria")
    public ModelAndView getAllBadgeCriteria() {
        List<BadgeCriteria> badgeCriteriaList = badgeCriteriaService.getAll();
        return new ModelAndView("admin/BadgeCriteria", "badgeCriteriaList", badgeCriteriaList);

    }

    @PostMapping(value = "admin/deleteBadgeCriteria/{id}")
    public ResponseEntity deleteBadgeCriteria(@PathVariable Integer id) {
        this.badgeCriteriaService.deleteBadgeCriteria(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping(value = "editBadgeCriteria")
    public ModelAndView editBadge(@ModelAttribute Badge badge, @RequestParam Integer id) {

        Badge badgeList = this.badgeService.findById(id);

        return new ModelAndView("manageBadge/addBadgeCriteria", "badge", badgeList);
    }
}
