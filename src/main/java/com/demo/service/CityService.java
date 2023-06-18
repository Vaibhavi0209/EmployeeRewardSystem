package com.demo.service;

import com.demo.entity.City;

import java.util.List;

public interface CityService {
    List<City> getAll();

    void add(City city);

    void delete(Integer id);

    City findById(Integer id);

}
