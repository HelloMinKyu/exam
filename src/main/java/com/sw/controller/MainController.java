package com.sw.controller;

import com.sw.jpa.Account;
import com.sw.jpa.Board;
import com.sw.service.AccountService;
import com.sw.service.BoardService;
import org.apache.poi.ss.formula.functions.Count;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private BoardService boardService;
    private static final String user = "user";

    @RequestMapping(value = {"/",""})
    public String main(Model model) {
        List<Board> notice = boardService.getListByType("notice");
        List<Board> update = boardService.getListByType("update");
        model.addAttribute("notice", notice);
        model.addAttribute("update" ,update);
        Long cnt = accountService.cntAccount(2);
        model.addAttribute("cnt", cnt);
        return "main";
    }

    @RequestMapping(value = "/header")
    public String header(Model m, HttpServletRequest request) throws IOException, GeneralSecurityException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
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

    //로그인
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
            session.setAttribute(user, findAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "");
        model.addAttribute("returnUrl", "/");
        return "redirect3";
    }

    //로그아웃 세션x
    @GetMapping("/logout")
    public String logOut(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", "");
        model.addAttribute("returnUrl", "/");
        return "redirect3";
    }

    //회원가입
    @GetMapping("/register")
    public String register() {
        return "register";
    }

    //회원가입 동작
    @PostMapping("/register/write")
    public String registerWrite(Model model, HttpServletRequest request) {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String sex = request.getParameter("sex");
        Account account = new Account();
        try {
            if(accountService.findByUserName(id) != null) {
                model.addAttribute("message", "누군가가 이 아이디를 사용하고 있어요");
                model.addAttribute("returnUrl", "/register");
                return "redirect";
            }
            account.setName(id);
            account.setPassword(pwd);
            account.setGender(Integer.parseInt(sex));
            account.setGm("0");
            accountService.save(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message", "FLONA 회원가입을 축하합니다!");
        model.addAttribute("returnUrl", "/");
        return "redirect";
    }

    //실시간 중복idCheck
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id) {
        int cnt = 0;
        if(accountService.findByUserName(id) != null) {
            cnt = 1;
        } else {
            cnt = 0;
        }
        return cnt;
    }
}