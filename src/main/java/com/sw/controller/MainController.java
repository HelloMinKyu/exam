package com.sw.controller;

import com.sw.jpa.Account;
import com.sw.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.GeneralSecurityException;

@Controller
public class MainController {
    @Autowired
    private AccountService accountService;
    private static final String LOGIN_MEMBER = "LOGIN_MEMBER";

    @RequestMapping(value = {"/",""})
    public String main() {
        return "main";
    }

    @RequestMapping(value = "/header")
    public String header(Model m, HttpSession session) throws IOException, GeneralSecurityException {
        //m.addAttribute("user",(SessionUser) session.getAttribute("user"));
        return "template/header";
    }

    @RequestMapping(value = "/head")
    public String head() throws IOException, GeneralSecurityException {
        return "template/head";
    }

    @RequestMapping(value = "/sub")
    public String sub() throws IOException, GeneralSecurityException {
        return "template/sub";
    }

    @RequestMapping(value = "/footer")
    public String footer(Model m) throws IOException, GeneralSecurityException {
        return "template/footer";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request, Model model) {
        String id = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        Account account = new Account();
        try {
            Account findAccount = accountService.findByUserName(id);
            if(findAccount == null) { //존재하는 아이디 체크.
                model.addAttribute("message", "존재하지 않는 아이디 입니다.");
                model.addAttribute("returnUrl", "/");
                return "redirect";
            }
            if(!findAccount.getPassword().equals(pwd)) { //비밀번호가 틀리면
                model.addAttribute("message", "비밀번호가 틀렸습니다.");
                model.addAttribute("returnUrl", "/");
                return "redirect";
            }
            //로그인 성공시
            HttpSession session = request.getSession();
            session.setAttribute(LOGIN_MEMBER, findAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "");
        model.addAttribute("returnUrl", "/");
        return "redirect3";
    }
}