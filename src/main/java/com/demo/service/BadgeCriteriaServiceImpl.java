package com.demo.service;

import com.demo.dto.BadgeCriteriaDto;
import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import com.demo.repository.BadgeCriteriaRepository;
import com.demo.repository.BadgeReository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BadgeCriteriaServiceImpl implements BadgeCriteriaService {

    private final BadgeCriteriaRepository badgeCriteriaRepository;

    private final BadgeReository badgeReository;


    @Override
    public BadgeCriteria addBadgeCriteria(BadgeCriteria badgeCriteria) {
        BadgeCriteria b1 = new BadgeCriteria(null, badgeCriteria.getCriteria(), badgeCriteria.getBadge());
        b1.setCreateAt(new Date());
        b1.setModifiedAt(new Date());
        b1.setStatus(Boolean.TRUE);
        return this.badgeCriteriaRepository.save(b1);
    }

    @Override
    public List<BadgeCriteria> getAll() {
        return badgeCriteriaRepository.findAll();
    }

    @Override
    public List<BadgeCriteria> BadgeAndStatusTrue(Integer id) {

        Badge badge = badgeReository.findById(id).orElse(new Badge());
        List<BadgeCriteria> badgeCriteria = this.badgeCriteriaRepository.findAllByBadgeAndStatusTrue(badge);
        return badgeCriteria;
    }

    @Override
    public BadgeCriteriaDto findbyCriteria(Badge badge) {

        Badge newBadge = badgeReository.findById(badge.getId()).orElse(new Badge());
        List<BadgeCriteria> criteList = badgeCriteriaRepository.findCriteria(newBadge.getId());

        BadgeCriteriaDto badgeCriteriaDto = new BadgeCriteriaDto();
        badgeCriteriaDto.setBadge(newBadge);
        List<String> newCriteriaNameList = criteList.stream().map(r -> r.getCriteria()).collect(Collectors.toList());
        badgeCriteriaDto.setCriteriaList(newCriteriaNameList);
        List<Integer> criteriaIdList = criteList.stream().map(r -> r.getId()).collect(Collectors.toList());
        badgeCriteriaDto.setCriteriaIdList(criteriaIdList);
        return badgeCriteriaDto;
    }

    @Override
    public void deleteBadgeCriteria(Integer id) {
        BadgeCriteria badgeCriteria = badgeCriteriaRepository.findById(id).orElse(new BadgeCriteria());
        badgeCriteria.setStatus(false);
        badgeCriteriaRepository.save(badgeCriteria);
    }

}
