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
import javax.websocket.server.PathParam;

@Controller
@RequestMapping("/iBoard")
public class InquiryController {

    @Autowired
    private BoardService boardService;
    @Autowired
    private AccountService accountService;

    //게시판 type에 따른 생성
    @GetMapping("/{type}/create")
    public String create(Model model, @PathVariable String type, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        return "inquiry/create";
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
            board.setStatus("대기중");
            boardService.save(board);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "성공적으로 작성되었습니다.");
        model.addAttribute("returnUrl", "/iBoard/inquiry/" + account.getId() + "/list/0");
        return "redirect";
    }

    //게시판 type에 따른 list
    @RequestMapping("/{type}/{account}/list/{page}")
    public String list(@PathVariable int page, @PathVariable String type, @PathVariable int account, @ModelAttribute("searchReq") SimpleSearchRequest searchReq, Model model, HttpServletRequest request) {
        Account account1 = accountService.getOne(account);
        Page<Board> pages = boardService.getPagesByAccount(page, 10, searchReq, type, account1);
        PagingInfo pagingInfo = new PagingInfo(pages);

        HttpSession session = request.getSession();
        session.getAttribute("user");

        model.addAttribute("pagingInfo", pagingInfo);
        model.addAttribute("pathParam", "?" + searchReq.toPathParam());
        return "inquiry/list";
    }

    //게시판 type에 따른 상세보기
    @GetMapping("/{type}/read/{id}")
    public String read(@PathVariable int id, @PathVariable String type, Model model, HttpServletRequest request) {
        Board board = boardService.getOneByIdAndType(id, type);
        model.addAttribute("board", board);
        HttpSession session = request.getSession();
        session.getAttribute("user");
        return "inquiry/read";
    }

    //게시판 ajax 삭제
    @ResponseBody
    @PostMapping("/delete")
    public void delete(@PathParam("id") int id) {
        boardService.deleteById(id);
    }

    //게시판 type에 따른 수정 화면
    @GetMapping("/{type}/update/{id}")
    public String update(@PathVariable int id, @PathVariable String type, Model model, HttpServletRequest request) {
        Board board = boardService.getOneByIdAndType(id, type);
        model.addAttribute("board", board);
        HttpSession session = request.getSession();
        session.getAttribute("user");
        return "inquiry/update";
    }

    //게시판 type에 따른 수정 동작
    @PostMapping("{type}/modify/{id}")
    public String modify(@PathVariable int id, @PathVariable String type, Model model, HttpServletRequest request) {
        Board board = boardService.getOneByIdAndType(id, type);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String userId = request.getParameter("userId");
        Account account = accountService.getOne(Integer.parseInt(userId));
        try {
            if(account.getGm().equals("1")) {
                board.setStatus("답변완료");
            } else {
                board.setStatus("대기중");
            }
            board.setTitle(title);
            board.setContent(content);
            boardService.save(board);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "정상적으로 수정되었습니다.");
        model.addAttribute("returnUrl", "/iBoard/inquiry/read/" + board.getId());
        return "redirect";
    }
}
