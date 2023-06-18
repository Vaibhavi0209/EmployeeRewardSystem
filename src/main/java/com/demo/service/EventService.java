package com.demo.service;

import com.demo.entity.Event;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface EventService {

    Event add(Event event,MultipartFile multipartFile, HttpServletRequest request);
    List<Event> getAll();

    void delete(int id);


    Event findById(Integer id) throws Exception;

}
