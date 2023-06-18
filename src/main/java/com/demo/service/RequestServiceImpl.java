package com.demo.service;

import com.demo.entity.Badge;
import com.demo.entity.Complaint;
import com.demo.entity.Employee;
import com.demo.entity.Request;
import com.demo.repository.BadgeCriteriaRepository;
import com.demo.repository.BadgeReository;
import com.demo.repository.EmployeeRepository;
import com.demo.repository.RequestRepository;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.*;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements RequestService {

    private final RequestRepository requestRespository;
    private final EmployeeRepository employeeRepository;
    private final BadgeReository badgeReository;

    @Override
    public void add(Request request, MultipartFile multipartFile, HttpServletRequest httpServletRequest) {

        String path = httpServletRequest.getSession().getServletContext().getRealPath("/");
        String filePath = path + "employee-request-images";
        String fileName = multipartFile.getOriginalFilename();

        if (fileName != null && !fileName.equals("")) {
            try {
                byte barr[] = multipartFile.getBytes();

                BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));
                bout.write(barr);
                bout.flush();
                bout.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        request.setCreateAt(new Date());
        request.setModifiedAt(new Date());
        request.setStatus(true);
        request.setRequestStatus("PENDING");
        request.setFileName(fileName);
        request.setEmployee(employeeByEmployeeId);
        List<Badge> allByStatusTrue = badgeReository.findAllByStatusTrue();
        requestRespository.save(request);
    }

    @Override
    public List<Request> getAll() {


        return requestRespository.findAllByStatusTrue();

    }

    @Override
    public void deleteRequest(Integer id) {
        Request request = requestRespository.findById(id).orElse(new Request());
        request.setStatus(false);
        requestRespository.save(request);
    }

    @Override
    public Request findById(Integer id) {
        return requestRespository.findById(id).orElse(new Request());
    }

    @Override
    public void addReply(Request request) {
        Request requestId = requestRespository.findById(request.getId()).orElse(null);
        request.setStatus(requestId.getStatus());
        request.setModifiedAt(new Date());
        request.setCreateAt(requestId.getCreateAt());
        request.setEmployee(requestId.getEmployee());
        request.setFileName(requestId.getFileName());
        if (Objects.equals(request.getRequestStatus(), "APPROVED")) {
            request.setRequestStatus("APPROVED");
            request.setRewards(request.getRewards());
            request.setTitle(request.getTitle());
            request.setReason(null);
        } else {
            request.setRequestStatus("DECLINED");
        }
        requestRespository.save(request);

    }

    @Override
    public List getAllRequest() {
        String user = BaseMethods.getUser();
        Employee employeeByEmployeeId = employeeRepository.findEmployeeByEmployeeId(user);
        List<Request> rewards = requestRespository.findAllByRequestStatus(employeeByEmployeeId.getId());
        return rewards;
    }

    @Override
    public List getRequestByEmployeeId(Integer employeeId) {
        List<Request> rewardsList = requestRespository.findAllByRequestStatus(employeeId);
        return rewardsList;
    }
}
