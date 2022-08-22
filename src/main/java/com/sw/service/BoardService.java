package com.sw.service;

import com.sw.dao.BoardRequest;
import com.sw.jpa.Board;
import com.sw.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    @Transactional
    public Board save(Board board) {
        return boardRepository.save(board);
    }

    @Transactional
    public void deleteById(int id) {
        boardRepository.deleteById(id);
    }

    public Board getOne(int id) {
        return boardRepository.getOne(id);
    }

    @Transactional
    public Page<Board> getPages(int page, int showNum) { //페이징 처리하면서 List 출력
        if(page < 0 ) page = 0;
        PageRequest pageRequest = PageRequest.of(page, showNum, Sort.Direction.DESC, "id");
        Page<Board> pages = boardRepository.findAll(pageRequest);
        return pages;
    }

    @Transactional
    public Board saveBoard(BoardRequest request) {
        Board board = new Board();
        board.setTitle(request.getTitle());
        board.setContent(request.getContent());
        board.setWriter(request.getWriter());
        return boardRepository.save(board);
    }
}
