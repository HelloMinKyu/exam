package com.sw.repository;

import com.sw.jpa.Account;
import org.apache.poi.ss.formula.functions.Count;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<Account, Integer> {
    Account findByName(String name);

    Count findAllByName(String name);
}
