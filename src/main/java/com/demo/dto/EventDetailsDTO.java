package com.demo.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
public class EventDetailsDTO {

    private Integer employeeId;
    private boolean winner;
    private boolean runnerUp;
}
