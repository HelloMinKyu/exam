package com.sw.controller.admin;

import com.sw.jpa.Board;
import com.sw.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/ming339696/Inquiry")
public class AdminInquiryController {
    @Autowired
    private BoardService boardService;

    @RequestMapping("/list")
    public String list(Model model) {
        List<Board> boards = boardService.getListByTypeAndStatus("inquiry", "대기중");
        model.addAttribute("board" ,boards);
        return "admin/inquiry";
    }
}
