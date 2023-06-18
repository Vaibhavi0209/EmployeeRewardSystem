package com.demo.repository;

import com.demo.entity.City;
import com.demo.entity.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityRepository extends JpaRepository<City, Integer> {
    List<City> findAllByStatusTrue();

    @Query( "from City cmt WHERE cmt.stateId =?1")
    List<City> findCityByStateId(State stateId);
}
