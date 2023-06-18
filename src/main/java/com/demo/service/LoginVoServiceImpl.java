package com.demo.service;

import com.demo.entity.LoginVO;
import com.demo.repository.LoginRepository;
import com.demo.repository.LoginVoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LoginVoServiceImpl implements LoginVoService {

    private final LoginVoRepository loginVoRepository;
    private final LoginRepository loginRepository;

    @Override
    public List<LoginVO> getAll() {
        return loginVoRepository.findAll();
    }

    public LoginVO login(String userName, String password, Boolean enable, String role) {
        LoginVO loginVO = new LoginVO();
        loginVO.setUsername(userName);
        loginVO.setPassword(password);
        loginVO.setEnabled(enable);
        loginVO.setRole(role);
        return loginRepository.save(loginVO);
    }

}
