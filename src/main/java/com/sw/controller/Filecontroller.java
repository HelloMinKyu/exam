package com.sw.controller;

import com.google.gson.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class Filecontroller {
    @ResponseBody
    @RequestMapping(value = "/upload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
        JsonObject jsonObject = new JsonObject();
        PrintWriter printWriter = null;
        OutputStream out = null;
        MultipartFile file = multiFile.getFile("upload");

        if(file != null) {
            if(file.getSize() >0) {
                if(file.getContentType().toLowerCase().startsWith("image/")) {
                    try{
                        //String fileName = file.getOriginalFilename();
                        byte[] bytes = file.getBytes();

                        String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images"); //저장경로
                        System.out.println("uploadPath:"+uploadPath);

                        File uploadFile = new File(uploadPath);
                        if(!uploadFile.exists()) {
                            uploadFile.mkdirs();
                        }
                        String fileName2 = UUID.randomUUID().toString();
                        //uploadPath = uploadPath + "/" + fileName2 +fileName;
                        uploadPath = uploadPath + "/" + fileName2;

                        out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);

                        printWriter = resp.getWriter();
                        String fileUrl = req.getContextPath() + "/resources/images/" +fileName2; //url경로
                        System.out.println("fileUrl :" + fileUrl);
                        JsonObject json = new JsonObject();
                        json.addProperty("uploaded", 1);
//                        json.addProperty("fileName", fileName);
                        json.addProperty("fileName", fileName2);
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
}
