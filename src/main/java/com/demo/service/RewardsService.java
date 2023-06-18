package com.demo.service;

import com.demo.entity.Badge;
import com.demo.entity.Rewards;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RewardsService {

    Rewards addRewards(Rewards rewards);

    List<Rewards> getAll();

    void deleteRewards(Integer id);

    Rewards findById(Integer id);

}
