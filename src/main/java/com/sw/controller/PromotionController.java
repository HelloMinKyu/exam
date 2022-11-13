package com.sw.controller;

import com.sw.jpa.Account;
import com.sw.jpa.DonePromotion;
import com.sw.service.AccountService;
import com.sw.service.DonePromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    @PostMapping("/write")
    public String write(Model model, HttpServletRequest request) {
        String userID = request.getParameter("userID");
        String gainName = request.getParameter("gainName");
        String content = request.getParameter("content");
        Account account = accountService.getOne(Integer.parseInt(userID));
        try {
            DonePromotion donePromotion = new DonePromotion();
            donePromotion.setGainName(gainName);
            donePromotion.setContent(content);
            donePromotion.setType("홍보");
            donePromotion.setAccount(account);
            donePromotionService.save(donePromotion);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "성공적으로 전송되었습니다.");
        model.addAttribute("returnUrl" , "/");
        return "redirect";
    }
}
