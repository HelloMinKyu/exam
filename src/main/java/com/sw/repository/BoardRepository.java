package com.sw.repository;

import com.sw.jpa.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Integer> {
    Page<Board> findAllByType(Pageable pageable, String type);
    Page<Board> findAllByTitleLikeAndType(Pageable pageable, String title , String type);

    Board findByIdAndType(int id, String type);
}
