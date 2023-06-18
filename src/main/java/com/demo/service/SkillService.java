package com.demo.service;

import com.demo.entity.Skill;

import java.util.List;

public interface SkillService {
    void save(Skill skill1);

    List<Skill> getSkillList(Integer id);
}
