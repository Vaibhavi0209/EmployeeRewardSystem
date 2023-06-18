package com.demo.service;

import com.demo.dto.AttendanceDto;
import com.demo.dto.EventDTO;
import com.demo.dto.RewardDto;
import com.demo.entity.Attendance;

import java.util.List;
import java.util.Map;

public interface AttendanceService {
    List<Map<String, Object>> findEmployeeName(Integer id);

    void add(List<AttendanceDto> attendanceDto);

    Map<String,Object> getEmployeeIds(Integer rewardId,Integer eventId);

    void finishEvent(EventDTO eventDTO);

    List<RewardDto> getAllRewards();

    List getRewardsByEmployeeId(Integer employeeId);
}
