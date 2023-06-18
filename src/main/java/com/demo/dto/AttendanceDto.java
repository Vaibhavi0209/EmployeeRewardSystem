package com.demo.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.SqlResultSetMapping;

@Getter
@Setter
@RequiredArgsConstructor
public class AttendanceDto {
    private Integer eventId;
    private Integer employeeId;

}
