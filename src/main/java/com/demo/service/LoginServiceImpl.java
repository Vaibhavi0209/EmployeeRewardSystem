package com.demo.service;

import com.demo.entity.LoginVO;
import com.demo.repository.LoginRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final LoginRepository loginRepository;

    @Override
    public void save(LoginVO loginVO) {
        this.loginRepository.save(loginVO);
    }

    @Override
    public LoginVO getById(LoginVO loginVO) {
    	return this.loginRepository.findById(loginVO.getId())
				.orElse(null);
    }

}
