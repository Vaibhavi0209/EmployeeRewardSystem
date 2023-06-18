package com.demo.repository;

import com.demo.entity.Badge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BadgeReository extends JpaRepository<Badge,Integer> {

    Optional<Badge> findByIdAndStatusTrue(Integer id);

    List<Badge> findAllByStatusTrue();


}
