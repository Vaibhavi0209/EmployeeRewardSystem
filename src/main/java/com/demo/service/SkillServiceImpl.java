package com.demo.service;

import com.demo.entity.Skill;
import com.demo.repository.SkillRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SkillServiceImpl implements SkillService {

    private final SkillRepository skillRepository;

    @Override
    public void save(Skill skill1) {
        skillRepository.save(skill1);
    }

    @Override
    public List<Skill> getSkillList(Integer id) {
        List<Skill> allByEmployee = skillRepository.findAllByEmployee(id);
        return allByEmployee;
    }
}
