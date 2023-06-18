package com.demo.repository;

import com.demo.entity.Employee;
import com.demo.entity.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TeamRepository extends JpaRepository<Team, Integer> {
    List<Team> findAllByStatusTrue();

    @Query(nativeQuery = true, value = "SELECT employee_id FROM team_mapping_table where team_id = ?1")
    Optional<List<Integer>> findEmployeeIds(Integer id);

    @Modifying
    @Query(nativeQuery = true, value = "DELETE FROM team_mapping_table WHERE team_id = ?1 and employee_id = ?2")
    void deleteEmployeeAndTeamId(Integer employeeId, Integer teamId);

    @Modifying
    @Query(nativeQuery = true, value = "select * FROM team_master_table tmt inner join team_mapping_table tmt2 on tmt.id = tmt2.team_id where tmt2.employee_id = ?1")
    List<Team> getTeamByEmployeeId(Employee id);

}
