package com.sw.controller.admin;

import com.sw.jpa.DonePromotion;
import com.sw.service.DonePromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/ming339696/pr")
public class AdminPromotionController {
    @Autowired
    private DonePromotionService donePromotionService;

    @RequestMapping("/list")
    public String list(Model model) {
        List<DonePromotion> donePromotions = donePromotionService.getListByTypeAndStatus("홍보", "대기중");
        model.addAttribute("dn", donePromotions);
        return "admin/promotion";
    }


}
