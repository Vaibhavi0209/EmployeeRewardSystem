package com.demo.service;

import com.demo.entity.City;
import com.demo.entity.State;
import com.demo.repository.CityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CityServiceImpl implements CityService {

    private final CityRepository cityRepository;


    @Override
    public List<City> getAll() {
        return cityRepository.findAllByStatusTrue();
    }

    @Override
    public void add(City city) {
        if (city.getId() == null) {
            city.setCreateAt(new Date());
            city.setModifiedAt(new Date());
            city.setStatus(true);
            cityRepository.save(city);

        } else {
            City newcity = cityRepository.findById(city.getId()).orElse(new City());
            city.setCreateAt(newcity.getCreateAt());
            city.setModifiedAt(newcity.getModifiedAt());
            city.setStatus(true);
            cityRepository.save(city);
            cityRepository.save(city);
        }
    }

    @Override
    public void delete(Integer id) {
        City city = cityRepository.findById(id).orElse(new City());
        city.setStatus(false);
        cityRepository.save(city);
    }

    @Override
    public City findById(Integer id) {
        return cityRepository.findById(id).orElse(new City());
    }




}
