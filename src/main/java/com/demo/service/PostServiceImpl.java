package com.demo.service;

import com.demo.entity.Employee;
import com.demo.entity.Posts;
import com.demo.repository.EmployeeRepository;
import com.demo.repository.LoginRepository;
import com.demo.repository.PostRepository;
import com.demo.util.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final EmployeeRepository employeeRepository;
    private final PostRepository postRepository;

    @Override
    public void savePost(MultipartFile file, String description, HttpServletRequest request) {
        try {
            String path = request.getSession().getServletContext().getRealPath("/");
            String filePath = path + "post-images";
            String fileName = file.getOriginalFilename();

            byte barr[] = file.getBytes();
            BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(filePath + "/" + fileName));
            bout.write(barr);
            bout.flush();
            bout.close();

            String userName = BaseMethods.getUser();

            Employee employee
                    = employeeRepository.findEmployeeByEmployeeId(userName);


            Posts posts = new Posts();
            posts.setDescription(description);
            posts.setFileName(fileName);
            posts.setFilePath(filePath);
            posts.setEmployee(employee);

            posts.setCreateAt(new Date());
            posts.setModifiedAt(new Date());
            posts.setStatus(true);

           this.postRepository.save(posts);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Posts> getPosts() {
        return this.postRepository.findAllPost();
    }

    @Override
    public List<Posts> getEmployeePosts(Integer id) {
        return postRepository.findEmployeePosts(id);
    }
}
