package com.demo.service;

import com.demo.entity.Complaint;
import com.demo.repository.ComplaintRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CompliantServiceImpl implements ComplaintService {

    private final ComplaintRepository complaintRepository;

    @Override
    public List<Complaint> getAll() {
        return complaintRepository.findAllByStatusTrue();
    }

    @Override
    public void deleteCompliant(Integer id) {
        Complaint complaint = complaintRepository.findById(id).orElse(new Complaint());
        complaint.setStatus(false);
        complaintRepository.save(complaint);
    }

    @Override
    public void add(Complaint complaint) {
        if (complaint.getId() == null) {

            complaint.setReplyDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            complaint.setComplaintDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            complaint.setModifiedAt(new Date());
            complaint.setCreateAt(new Date());
            complaint.setStatus(true);
            complaint.setComplaintStatus("PENDING");
            complaintRepository.save(complaint);
        } else {
            Complaint newComplaint = complaintRepository.findById(complaint.getId()).orElse(new Complaint());
            complaint.setModifiedAt(new Date());
            complaint.setCreateAt(newComplaint.getCreateAt());
            complaint.setStatus(newComplaint.getStatus());
            complaint.setReplyDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            complaint.setComplaintDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            complaint.setComplaintStatus("REPLIED");
            complaintRepository.save(complaint);

        }
    }

    @Override
    public Complaint findById(Integer id) {
        return complaintRepository.findById(id).orElse(new Complaint());
    }

    @Override
    public void complaintStatus(Integer id) {
        Complaint complaint = complaintRepository.findById(id).orElse(new Complaint());
        complaint.setComplaintStatus("Replied");
        complaintRepository.save(complaint);
    }


}
