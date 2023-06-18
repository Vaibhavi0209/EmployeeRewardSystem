package com.demo.repository;

import com.demo.entity.Rewards;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RewardsRepository extends JpaRepository<Rewards,Integer> {
    Optional<Rewards> findByIdAndStatusTrue(Integer id);

    List<Rewards> findAllByStatusTrue();
}
