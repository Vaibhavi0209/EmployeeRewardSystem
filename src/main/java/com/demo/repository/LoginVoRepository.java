package com.demo.repository;

import com.demo.entity.LoginVO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginVoRepository extends JpaRepository<LoginVO, Integer> {
}
