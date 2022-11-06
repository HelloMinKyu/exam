package com.sw.repository;

import com.sw.jpa.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByName(String name);
}
