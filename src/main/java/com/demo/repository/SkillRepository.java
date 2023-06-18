package com.demo.repository;

import com.demo.entity.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Integer> {

    @Query(nativeQuery = true, value = " select * from skill_table st WHERE employee_id =?1")
    List<Skill> findAllByEmployee(Integer id);

}
