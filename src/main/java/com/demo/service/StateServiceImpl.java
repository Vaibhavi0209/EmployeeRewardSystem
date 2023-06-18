package com.demo.service;

import com.demo.entity.State;
import com.demo.repository.StateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Service
public class StateServiceImpl implements StateService {

    private final StateRepository stateRepository;

    @Override
    public List<State> getAll() {
        return stateRepository.findAllByStatusTrue();
    }

    @Override
    public void add(State state) {
        if (state.getId() == null) {
            state.setCreateAt(new Date());
            state.setModifiedAt(new Date());
            state.setStatus(true);
            stateRepository.save(state);

        } else {
            State newState = stateRepository.findById(state.getId()).orElse(new State());
            state.setCreateAt(newState.getCreateAt());
            state.setModifiedAt(newState.getModifiedAt());
            state.setStatus(true);
            stateRepository.save(state);
            stateRepository.save(state);
        }
    }

    @Override
    public void delete(Integer id) {
        State state = stateRepository.findById(id).orElse(new State());
        state.setStatus(false);
        stateRepository.save(state);
    }

    @Override
    public State findById(Integer id) {
        return stateRepository.findById(id).orElse(new State());
    }

}


