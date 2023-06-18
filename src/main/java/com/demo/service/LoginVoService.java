package com.demo.service;

import com.demo.entity.LoginVO;

import java.util.List;

public interface LoginVoService {
    List<LoginVO> getAll();

    LoginVO login(String userName, String password, Boolean enable, String role);
}
