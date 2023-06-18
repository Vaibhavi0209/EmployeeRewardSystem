package com.demo.dto;

import com.demo.entity.Badge;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
public class BadgeCriteriaDto {

    private Badge badge;

    private List<String> criteriaList;

    private List<Integer> criteriaIdList;

}
