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
@RequestMapping("/dn")
public class DoneController {
    @Autowired
    private DonePromotionService donePromotionService;
    @Autowired
    private AccountService accountService;

    @GetMapping("/create")
    public String create(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(request.getSession().getAttribute("user") == null) {
            model.addAttribute("message", "로그인후 다시 시도해주세요.");
            model.addAttribute("returnUrl", "/");
            return "redirect";
        }
        session.getAttribute("user");
        return "done";
    }

    @PostMapping("/write")
    public String write(Model model, HttpServletRequest request) {
        String userID = request.getParameter("userID");
        String gainName = request.getParameter("gainName");
        String content = request.getParameter("content");
        String type2 = request.getParameter("type2");
        String checkAgree = request.getParameter("checkAgree");
        Account account = accountService.getOne(Integer.parseInt(userID));
        try {
            DonePromotion donePromotion = new DonePromotion();
            donePromotion.setGainName(gainName);
            donePromotion.setContent(content);
            donePromotion.setType2(type2);
            donePromotion.setType("후원");
            donePromotion.setAccount(account);
            donePromotion.setCheckAgree(checkAgree);
            donePromotionService.save(donePromotion);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "성공적으로 전송되었습니다. 감사합니다.");
        model.addAttribute("returnUrl", "/");
        return "redirect";
    }
}
