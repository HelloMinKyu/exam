package com.sw.controller;

import com.google.gson.JsonObject;
import com.sw.dao.BoardRequest;
import com.sw.jpa.Board;
import com.sw.service.BoardService;
import com.sw.util.PagingInfo;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/create")
    public String create() {
        return "board/create";
    }

    @PostMapping("/write")
    public String write(BoardRequest Req, Model model, HttpServletRequest request) {
        boardService.saveBoard(Req);
        model.addAttribute("message", "정상적으로 저장되었습니다.");
        model.addAttribute("returnUrl", "/board/list/0");
        return "redirect";
    }

    @ResponseBody
    @RequestMapping(value = "/fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
        JsonObject jsonObject = new JsonObject();
        PrintWriter printWriter = null;
        OutputStream out = null;
        MultipartFile file = multiFile.getFile("upload");

        if(file != null) {
            if(file.getSize() >0) {
                if(file.getContentType().toLowerCase().startsWith("image/")) {
                    try{
                        String fileName = file.getOriginalFilename();
                        byte[] bytes = file.getBytes();

                        String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images"); //저장경로
                        System.out.println("uploadPath:"+uploadPath);

                        File uploadFile = new File(uploadPath);
                        if(!uploadFile.exists()) {
                            uploadFile.mkdirs();
                        }
                        String fileName2 = UUID.randomUUID().toString();
                        uploadPath = uploadPath + "/" + fileName2 +fileName;

                        out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);

                        printWriter = resp.getWriter();
                        String fileUrl = req.getContextPath() + "/resources/images/" +fileName2 +fileName; //url경로
                        System.out.println("fileUrl :" + fileUrl);
                        JsonObject json = new JsonObject();
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        printWriter.print(json);
                        System.out.println(json);

                    }catch(IOException e){
                        e.printStackTrace();
                    } finally {
                        if (out != null) {
                            out.close();
                        }
                        if (printWriter != null) {
                            printWriter.close();
                        }
                    }
                }
            }
        }
    }

    @RequestMapping("/list/{page}")
    public String List(@PathVariable int page, Model model) {
        Page<Board> pages = boardService.getPages(page,5);
        PagingInfo pagingInfo = new PagingInfo(pages);
        model.addAttribute("pagingInfo",pagingInfo);
        return "/board/list";
    }

    @GetMapping("read/{id}")
    public String read(@PathVariable int id, Model model) {
        Board board = boardService.getOne(id);
        model.addAttribute("board", board);
        return "board/read";
    }
}
