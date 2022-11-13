package com.sw.repository;

import com.sw.jpa.Account;
import com.sw.jpa.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Integer> {
    Page<Board> findAllByType(Pageable pageable, String type);

    Page<Board> findAllByTypeAndAccount(Pageable pageable, String type, Account account);
    Page<Board> findAllByTitleLikeAndType(Pageable pageable, String title , String type);

    Board findByIdAndType(int id, String type);

    List<Board> findAllByType(String type);
}
