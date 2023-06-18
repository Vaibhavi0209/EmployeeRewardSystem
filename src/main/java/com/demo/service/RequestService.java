package com.demo.service;

import com.demo.entity.Request;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface RequestService {
    void add(Request request, MultipartFile multipartFile, HttpServletRequest httpServletRequest);

    List<Request> getAll();

    void deleteRequest(Integer id);

    Request findById(Integer id);

    void addReply(Request request);

    List<Request> getAllRequest();

    List getRequestByEmployeeId(Integer employeeId);
}
