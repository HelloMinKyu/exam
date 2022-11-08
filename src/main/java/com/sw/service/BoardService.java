package com.sw.service;

import com.sw.command.SimpleSearchRequest;
import com.sw.jpa.Board;
import com.sw.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    @Transactional
    public Board getOne(int id) {
        return boardRepository.getOne(id);
    }

    @Transactional
    public void deleteById(int id) {
        boardRepository.deleteById(id);
    }

    @Transactional
    public Board save(Board board) {
        return boardRepository.save(board);
    }

    public List<Board> getList() {
        return boardRepository.findAll();
    }

    @Transactional
    public Page<Board> getPages(int page, int showNum, SimpleSearchRequest request, String type) { //페이지 처리하면서 List 출력
        if(page < 0 ) {
            page = 0;
        }
        PageRequest pageRequest = PageRequest.of(page, showNum, Sort.Direction.DESC, "id");
        String categoryStr = request.getCategory();
        Page<Board> pages = boardRepository.findAllByType(pageRequest, type);
        switch (categoryStr) {
            case "content":
                pages = boardRepository.findAllByTitleAndType(pageRequest, "%" + request.getValue() + "%", type);
                break;
        }
        return pages;
    }
}
