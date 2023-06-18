package com.demo.service;

import com.demo.entity.Badge;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface BadgeService {

    List<Badge> getAll();

    void addBadge(Badge badge, MultipartFile multipartFile, HttpServletRequest request, String [] criteria);

    void deleteBadge(Integer id);

    Badge findById(Integer id);



}
