package com.demo.repository;

import com.demo.entity.Posts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Posts, Integer> {

    @Modifying
    @Query(nativeQuery = true, value = "select * from post_tbl pt WHERE login_id =?1")
    List<Posts> findEmployeePosts(Integer id);
    @Query(nativeQuery = true, value = "select * from post_tbl order by id DESC")
    List<Posts> findAllPost();
}
