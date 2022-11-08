package com.sw.controller;

import com.sw.command.SimpleSearchRequest;
import com.sw.jpa.Account;
import com.sw.jpa.Board;
import com.sw.service.AccountService;
import com.sw.service.BoardService;
import com.sw.util.PagingInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class NoticeBoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private AccountService accountService;
    
    //게시판 type에 따른 생성
    @GetMapping("/{type}/create")
    public String create(Model model, @PathVariable String type, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        return "noticeBoard/create";
    }

    //게시판 type에 따른 write
    @PostMapping("/{type}/write")
    public String write(Model model, @PathVariable String type, HttpServletRequest request) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String user = request.getParameter("userID");
        Account account = accountService.getOne(Integer.parseInt(user));
        Board board = new Board();
        try {
            board.setTitle(title);
            board.setContent(content);
            board.setWriter(account.getName());
            board.setAccount(account);
            board.setType(type);
            boardService.save(board);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "성공적으로 작성되었습니다.");
        model.addAttribute("returnUrl", "/board/notice/list/0");
        return "redirect";
    }

    //게시판 type에 따른 list
    @RequestMapping("/{type}/list/{page}")
    public String list(@PathVariable int page, @PathVariable String type, @ModelAttribute("searchReq")SimpleSearchRequest searchReq, Model model, HttpServletRequest request) {
        Page<Board> pages = boardService.getPages(page, 10, searchReq, type);
        PagingInfo pagingInfo = new PagingInfo(pages);

        HttpSession session = request.getSession();
        session.getAttribute("user");

        model.addAttribute("pagingInfo", pagingInfo);
        model.addAttribute("pathParam", "?" + searchReq.toPathParam());
        return "noticeBoard/list";
    }
}
