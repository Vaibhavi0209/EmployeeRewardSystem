package com.demo.controller;


import com.demo.entity.Rewards;
import com.demo.service.RewardsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class RewardController {

    private final RewardsService rewardsService;

    @GetMapping("admin/rewards")
    public ModelAndView rewards() {
        List<Rewards> rewardsList = rewardsService.getAll();
        return new ModelAndView("admin/rewards", "rewardsList", rewardsList).addObject("rewards1", new Rewards());

    }

    @PostMapping("admin/saveRewards")
    public ModelAndView addJobRole(@ModelAttribute Rewards rewards) {
        this.rewardsService.addRewards(rewards);
        return new ModelAndView("redirect:/admin/rewards");
    }

    @GetMapping(value = "admin/deleteRewards")
    public ModelAndView deleteRewards(@RequestParam Integer id) {
        this.rewardsService.deleteRewards(id);
        return new ModelAndView("redirect:/admin/rewards");
    }


    @GetMapping(value = "admin/getRewardsById/{id}")
    public ResponseEntity getRewardsById(@PathVariable Integer id) {
        Rewards rewards = rewardsService.findById(id);
        return new ResponseEntity(rewards, HttpStatus.OK);
    }

}
