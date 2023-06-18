package com.demo.repository;

import com.demo.entity.Badge;
import com.demo.entity.BadgeCriteria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BadgeCriteriaRepository extends JpaRepository<BadgeCriteria, Integer> {

    Optional<List<BadgeCriteria>> findAllByBadgeId(Integer id);


    List<BadgeCriteria> findAllByBadgeAndStatusTrue(Badge badge);

    @Query(value = "select * from badge_criteria_tbl abc WHERE abc.badge_id =?1 and status=true", nativeQuery = true)
    List<BadgeCriteria> findCriteria(Integer id);
}
