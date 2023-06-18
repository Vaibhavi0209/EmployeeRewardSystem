package com.demo.service;

import com.demo.entity.LoginVO;

public interface LoginService {

    void save(LoginVO loginVO);

    LoginVO getById(LoginVO loginVO);

}
