package com.demo.service;

import com.demo.entity.Posts;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface PostService {

    void savePost(MultipartFile file, String description, HttpServletRequest request);

    List<Posts> getPosts();

    List<Posts> getEmployeePosts(Integer id);
}
