package com.demo.service;

import com.demo.dto.BadgeCriteriaDto;
import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface BadgeCriteriaService {
    BadgeCriteria addBadgeCriteria(BadgeCriteria badgeCriteria);

    List<BadgeCriteria> getAll();

    List<BadgeCriteria> BadgeAndStatusTrue(Integer id);

    BadgeCriteriaDto findbyCriteria(Badge badge);

    void deleteBadgeCriteria(Integer id);
}
