package com.sw.controller;

import com.sw.service.AccountService;
import com.sw.service.DonePromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pr")
public class PromotionController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private DonePromotionService donePromotionService;

    @GetMapping("/create")
    public String create(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(request.getSession().getAttribute("user") == null) {
            model.addAttribute("message", "로그인후 다시 시도해주세요.");
            model.addAttribute("returnUrl", "/");
            return "redirect";
        }
        session.getAttribute("user");
        return "promotion";
    }
}
