package com.demo.service;

import com.demo.entity.State;

import java.util.List;

public interface StateService {
    List<State> getAll();

    void add(State state);

    void delete(Integer id);

    State findById(Integer id);

}
