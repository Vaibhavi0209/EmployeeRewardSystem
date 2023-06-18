package com.demo.controller;

import com.demo.entity.City;
import com.demo.entity.State;
import com.demo.service.CityService;
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
public class CityController {

    private final CityService cityService;

    private final StateService stateService;

    @GetMapping(value = {"hr/city", "admin/city"})
    public ModelAndView city() {
        List<City> cityList = cityService.getAll();
        List<State> stateList = stateService.getAll();
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("hr/city", "cityList", cityList).addObject("City", new City()).addObject("stateList", stateList);
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("admin/city", "cityList", cityList).addObject("City", new City()).addObject("stateList", stateList);
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }

    @PostMapping(value = {"hr/saveCity", "admin/saveCity"})
    public ModelAndView addCity(@ModelAttribute City city) {
        String role = BaseMethods.getUserRole();
        this.cityService.add(city);
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/city");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/city");
        } else {
            return new ModelAndView("redirect:/logout");
        }
    }


    @GetMapping(value = {"hr/cityDelete", "admin/cityDelete"})
    public ModelAndView deleteCity(@RequestParam Integer id) {
        this.cityService.delete(id);
        String role = BaseMethods.getUserRole();
        if (role.equals("ROLE_HR")) {
            return new ModelAndView("redirect:/hr/city");
        } else if (role.equals("ROLE_ADMIN")) {
            return new ModelAndView("redirect:/admin/city");
        } else {
            return new ModelAndView("redirect:/logout");
        }

    }

    @GetMapping(value = {"hr/getCityById/{id}", "admin/getCityById/{id}"})
    public ResponseEntity editCity(@PathVariable Integer id) {
        City city = this.cityService.findById(id);
        return new ResponseEntity(city, HttpStatus.OK);
    }


}
