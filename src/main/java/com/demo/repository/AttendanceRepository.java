package com.demo.repository;

import com.demo.dto.AttendanceDto;
import com.demo.dto.RewardDto;
import com.demo.entity.Attendance;
import com.demo.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Integer> {

    @Query(nativeQuery = true, value = "select emt.emloyee_name,emt.id from employee_master_tbl emt WHERE id not in (SELECT employee_id from attendance_master_tbl amt WHERE amt.event_id = ?1) and status = true")
    List<Map<String, Object>> findUniqueEmployeeName(Integer id);

    @Query(nativeQuery = true, value = "select emt.id , emt.emloyee_name, amt.attempt_event, amt.attempt_runner_up,amt.attempt_winner,amt.is_runner_up,amt.is_winner from attendance_master_tbl amt inner join employee_master_tbl emt on amt.employee_id = emt.id WHERE event_id = ?1")
    List<Map<String, String>> findEmployeeIds(Integer id);

    @Query(nativeQuery = true, value = "select * from attendance_master_tbl amt WHERE event_id=?1 and employee_id =?2")
    List<Attendance> getAttendanceEmployeeList(int eventId, int employeeId);


    @Query(nativeQuery = true, value = "SELECT amt.attempt_event as totalRewards ,emt.event_name as eventName, amt.attempt_winner as attempWiinner ,amt.attempt_runner_up  as attemptRunnerUp FROM attendance_master_tbl amt inner join reward_program_tbl rpt on rpt.event_id = amt.event_id inner join event_master_tbl emt on amt.event_id = emt.id where rpt.is_finished = true  and amt.employee_id = ?1")
    List<Map<String, String>> findByAllFinishEvent(int employeeId);
}
