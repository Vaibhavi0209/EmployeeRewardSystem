package com.demo.repository;

import com.demo.entity.Event;
import com.demo.entity.RewardProgram;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RewardProgramRepository extends JpaRepository<RewardProgram, Integer> {
//    @Query(nativeQuery = true, value = "SELECT * FROM reward_program_tbl rpt WHERE reward_status = 'APPROVED' and status = true")
    List<RewardProgram> findAllByStatusTrue();

    @Query(nativeQuery = true, value = "select * from reward_program_tbl where id = ?1")
    RewardProgram findByEventFromId(Integer id);

    RewardProgram findByEventId(Event eventId);
}
