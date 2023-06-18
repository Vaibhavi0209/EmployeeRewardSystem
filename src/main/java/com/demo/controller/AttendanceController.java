package com.demo.controller;

import com.demo.dto.AttendanceDto;
import com.demo.dto.EventDTO;
import com.demo.entity.Attendance;
import com.demo.entity.RewardProgram;
import com.demo.service.AttendanceService;
import com.demo.service.RewardProgramService;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AttendanceController {

    private final RewardProgramService rewardProgramService;

    private final AttendanceService attendanceService;

    @GetMapping(value = {"hr/attendance"})
    public ModelAndView event() {
        List<RewardProgram> rewardProgramList = rewardProgramService.getAll();
        return new ModelAndView("hr/attendance", "rewardProgramList", rewardProgramList)
                .addObject("Attendance", new Attendance());
    }

    @PostMapping(value = {"hr/saveAttendance"})
    public ResponseEntity addAttendance(@RequestBody List<AttendanceDto> attendanceDto) {
        this.attendanceService.add(attendanceDto);
        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping(value = "hr/getEmployeeName/{id}")
    public ResponseEntity getEmployeeName(@PathVariable Integer id) {
        List<Map<String, Object>> employeeName = attendanceService.findEmployeeName(id);
        return new ResponseEntity(employeeName, HttpStatus.OK);
    }


    @GetMapping(value = "hr/getEmployeeIds/{rewardId}/{eventId}")
    public ResponseEntity getEmployeeIds(@PathVariable Integer rewardId, @PathVariable Integer eventId) {
        Map<String, Object> map = attendanceService.getEmployeeIds(rewardId, eventId);
        return new ResponseEntity(map, HttpStatus.OK);
    }

    @PostMapping(value = {"hr/finishEvent"})
    public ResponseEntity finishEvent(@RequestBody EventDTO eventDTO) {
        this.attendanceService.finishEvent(eventDTO);
        return new ResponseEntity(HttpStatus.OK);
    }


}
