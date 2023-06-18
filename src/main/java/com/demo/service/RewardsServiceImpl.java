package com.demo.service;

import com.demo.entity.Rewards;
import com.demo.repository.RewardsRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RewardsServiceImpl implements RewardsService {

    private final RewardsRepository rewardsRepository;

    @Override
    public Rewards addRewards(Rewards rewards) {

        if (rewards.getId() == null) {
            rewards.setCreateAt(new Date());
            rewards.setModifiedAt(new Date());
            rewards.setStatus(Boolean.TRUE);
            return this.rewardsRepository.save(rewards);
        } else {
            Rewards rewards1 = rewardsRepository.findById(rewards.getId()).get();
            rewards.setCreateAt(rewards1.getCreateAt());
            rewards.setModifiedAt(new Date());
            rewards.setStatus(rewards1.getStatus());
            return this.rewardsRepository.save(rewards);
        }
    }

    @Override
    public List<Rewards> getAll() {
        List<Rewards> rewardsList = this.rewardsRepository.findAllByStatusTrue();
        return rewardsList;
    }

    @Override
    public void deleteRewards(Integer id) {
        Rewards rewards = this.rewardsRepository.findById(id).orElse(new Rewards());
        rewards.setModifiedAt(new Date());
        rewards.setStatus(Boolean.FALSE);
        this.rewardsRepository.save(rewards);
    }

    @Override
    public Rewards findById(Integer id) {
        return rewardsRepository.findById(id).orElse(new Rewards());
    }




}
