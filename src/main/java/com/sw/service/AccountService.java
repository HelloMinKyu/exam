package com.sw.service;

import com.sw.jpa.Account;
import com.sw.repository.AccountRepository;
import org.apache.poi.ss.formula.functions.Count;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Transactional
    public Account getOne(int id) {
        return accountRepository.getOne(id);
    }

    @Transactional
    public Account save(Account account) {
        return accountRepository.save(account);
    }

    @Transactional
    public Long cntAccount(int id) {
        return accountRepository.countAccountByLoggedin(id);
    }
}
