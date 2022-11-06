package com.sw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/free")
public class FreeBoardController {

    @GetMapping("/list")
    public String List() {
        return "freeBoard/list";
    }

    @GetMapping("/create")
    public String create() {
        return "freeBoard/create";
    }

    @GetMapping("/read")
    public String read() {
        return "freeBoard/read";
    }
}
