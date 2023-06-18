package com.demo.service;

import com.demo.dto.AttendanceDto;
import com.demo.dto.EventDTO;
import com.demo.dto.EventDetailsDTO;
import com.demo.entity.Attendance;
import com.demo.entity.Employee;
import com.demo.entity.Event;
import com.demo.entity.RewardProgram;
import com.demo.repository.*;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional
public class AttendanceServiceImpl implements AttendanceService {


    private final AttendanceRepository attendanceRepository;
    private final EventRepository eventRepository;
    private final EmployeeRepository employeeRepository;
    private final RewardProgramRepository rewardProgramRepository;

    @Override
    public List<Map<String, Object>> findEmployeeName(Integer id) {
        return attendanceRepository.findUniqueEmployeeName(id);
    }

    @Override
    public void add(List<AttendanceDto> attendanceDto) {
        attendanceDto.forEach(attendance -> {
            Employee employee = employeeRepository.findById(attendance.getEmployeeId()).orElse(new Employee());
            Event event = eventRepository.findById(attendance.getEventId()).orElse(new Event());
            Attendance newAttandance = new Attendance();
            newAttandance.setEmployeeId(employee);
            newAttandance.setEventId(event);
            newAttandance.setCreateAt(new Date());
            newAttandance.setModifiedAt(new Date());
            newAttandance.setStatus(true);
            attendanceRepository.save(newAttandance);
        });
    }

    @Override
    public Map<String, Object> getEmployeeIds(Integer rewardId, Integer eventId) {

        List<Map<String, String>> employeeNames = attendanceRepository.findEmployeeIds(eventId);
        RewardProgram rewardProgram = this.rewardProgramRepository.findByEventFromId(rewardId);
        Map<String, Object> map = new HashMap<>();
        map.put("rewardProgram", rewardProgram);
        map.put("employeeNames", employeeNames);

        return map;
    }

    @Override
    public void finishEvent(EventDTO eventDTO) {

        // Get reward details of event
        int eventId = eventDTO.getEventId();

        RewardProgram rewardProgram = rewardProgramRepository.findByEventId(new Event(eventId));
        // Count Rewards
        int winnerRewards = rewardProgram.getRewardWinner();
        int runnerUpRewards = rewardProgram.getRewardRunnerUp();
        int reward = rewardProgram.getTotalRewards();

        // Winner count
        long winnerCount = eventDTO.getEventDetailsDTOList().stream().filter(EventDetailsDTO::isWinner).count();

        // Runner-Up count
        long runnerUpCount = eventDTO.getEventDetailsDTOList().stream().filter(EventDetailsDTO::isRunnerUp).count();

        // Reward per winner
        long totalRewardOfWinner = winnerRewards * winnerCount;

        // Reward per runner-up
        long totalRewardOfRunnerUp = runnerUpRewards * runnerUpCount;
        long remainingRewards = reward - (totalRewardOfWinner + totalRewardOfRunnerUp);

        long rewardToAttempt = remainingRewards / eventDTO.getEventDetailsDTOList().size();

        eventDTO.getEventDetailsDTOList().stream().forEach(eventDetailsDTO -> {

            List<Attendance> attendanceList = attendanceRepository.getAttendanceEmployeeList(eventId, eventDetailsDTO.getEmployeeId());
            Attendance attendance = attendanceList.get(0);

            attendance.setAttemptEvent((int) rewardToAttempt);
            attendance.setAttemptRunnerUp(0);
            attendance.setAttemptWinner(0);

            if (eventDetailsDTO.isRunnerUp()) {
                attendance.setAttemptRunnerUp(runnerUpRewards);
                attendance.setIsRunnerUp(true);
                attendance.setIsWinner(false);
            } else if (eventDetailsDTO.isWinner()) {
                attendance.setAttemptWinner(winnerRewards);
                attendance.setIsWinner(true);
                attendance.setIsRunnerUp(false);
            }
            attendanceRepository.save(attendance);
        });

        rewardProgram.setFinished(true);
        this.rewardProgramRepository.save(rewardProgram);

    }

    @Override
    public List getAllRewards() {
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Map<String, String>> attendanceList = attendanceRepository.findByAllFinishEvent(employeeByEmployeeId.getId());
        return attendanceList;
    }

    @Override
    public List getRewardsByEmployeeId(Integer employeeId) {
        List<Map<String, String>> rewardsList = attendanceRepository.findByAllFinishEvent(employeeId);
        return rewardsList;
    }

}
