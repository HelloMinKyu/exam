package com.sw.controller.admin;

import com.sw.jpa.DonePromotion;
import com.sw.service.DonePromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/ming339696/dn")
public class AdminDoneController {
    @Autowired
    private DonePromotionService donePromotionService;

    @RequestMapping("/list")
    public String list(Model model) {
        List<DonePromotion> donePromotions = donePromotionService.getListByTypeAndStatus("후원", "대기중");
        model.addAttribute("dn", donePromotions);
        return "admin/done";
    }

    @ResponseBody
    @PostMapping("/give")
    public List<String> give(@RequestBody List<String> IdxArray) {
        donePromotionService.giveDnPr(IdxArray);
        return IdxArray;
    }
}
