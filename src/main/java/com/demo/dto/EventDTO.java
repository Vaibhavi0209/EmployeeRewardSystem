package com.demo.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
public class EventDTO {

    private Integer eventId;
    private List<EventDetailsDTO> eventDetailsDTOList;



}
