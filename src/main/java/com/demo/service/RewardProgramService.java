package com.demo.service;

import com.demo.entity.RewardProgram;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RewardProgramService {
    List<RewardProgram> getAll();

    void add(RewardProgram rewardProgram);

    void delete(Integer id);

    RewardProgram findById(Integer id);

    void rewardProgramStatus(Integer id);

    void finishEvent(Integer id);
}
