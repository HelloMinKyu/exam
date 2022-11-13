package com.sw.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ming339696")
public class AdminController {

    @RequestMapping(value = {"/",""})
    public String main(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(request.getSession().getAttribute("user") == null) {
            model.addAttribute("message", "로그인후 다시 시도해주세요.");
            model.addAttribute("returnUrl", "/");
            return "redirect";
        }
        return "admin";
    }
}
