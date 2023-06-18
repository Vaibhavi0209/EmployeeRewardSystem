package com.demo.repository;

import com.demo.entity.LoginVO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoginRepository extends JpaRepository<LoginVO, Integer> {
}
