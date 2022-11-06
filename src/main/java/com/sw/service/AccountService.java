package com.sw.service;

import com.sw.jpa.Account;
import com.sw.repository.AccountRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;
    //@Transactional

    @Transactional
    public Account findByUserName(String name) {
        Account account = accountRepository.findByName(name);
        return account;
    }
}
