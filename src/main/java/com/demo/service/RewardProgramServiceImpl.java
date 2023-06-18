package com.demo.service;

import com.demo.entity.Attendance;
import com.demo.entity.Event;
import com.demo.entity.RewardProgram;
import com.demo.repository.EventRepository;
import com.demo.repository.RewardProgramRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class RewardProgramServiceImpl implements RewardProgramService {

    private final RewardProgramRepository rewardProgramRepository;
    private final EventRepository eventRepository;

    private final AttendanceService attendanceService;

    @Override
    public List<RewardProgram> getAll() {
        return rewardProgramRepository.findAllByStatusTrue();
    }

    @Override
    public void add(RewardProgram rewardProgram) {
        if (rewardProgram.getId() == null) {
            rewardProgram.setCreateAt(new Date());
            rewardProgram.setModifiedAt(new Date());
            rewardProgram.setStatus(true);
            rewardProgram.setRewardStatus("PENDING");
            rewardProgramRepository.save(rewardProgram);
        } else {
            RewardProgram rewardProgram1 = rewardProgramRepository.findById(rewardProgram.getId()).get();
            rewardProgram.setCreateAt(rewardProgram1.getCreateAt());
            rewardProgram.setModifiedAt(new Date());
            rewardProgram.setStatus(rewardProgram1.getStatus());
            rewardProgram.setRewardStatus(rewardProgram1.getRewardStatus());
            rewardProgramRepository.save(rewardProgram);
        }
    }

    @Override
    public void delete(Integer id) {
        RewardProgram rewardProgramId = rewardProgramRepository.findById(id).orElse(new RewardProgram());
        rewardProgramId.setStatus(Boolean.FALSE);
        rewardProgramRepository.save(rewardProgramId);


    }

    @Override
    public RewardProgram findById(Integer id) {
        return rewardProgramRepository.findById(id).orElse(new RewardProgram());
    }

    @Override
    public void rewardProgramStatus(Integer id) {
        RewardProgram rewardProgramId = rewardProgramRepository.findById(id).orElse(new RewardProgram());
        rewardProgramId.setRewardStatus("APPROVED");
        rewardProgramRepository.save(rewardProgramId);
    }

    @Override
    public void finishEvent(Integer id) {
        Event event = eventRepository.findById(id).orElse(new Event());
        RewardProgram rewardProgram = rewardProgramRepository.findByEventId(event);
        rewardProgram.setFinished(true);
        rewardProgramRepository.save(rewardProgram);

    }
}
