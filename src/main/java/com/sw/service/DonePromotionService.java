package com.sw.service;

import com.sw.jpa.DonePromotion;
import com.sw.repository.DonePromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class DonePromotionService {
    @Autowired
    private DonePromotionRepository donePromotionRepository;

    @Transactional
    public DonePromotion save(DonePromotion donePromotion) {
        return donePromotionRepository.save(donePromotion);
    }

    @Transactional
    public DonePromotion getOne(int id) {
        return donePromotionRepository.getOne(id);
    }

    @Transactional
    public void deleteById(int id) {
        donePromotionRepository.deleteById(id);
    }

    @Transactional
    public List<DonePromotion> getListByTypeAndStatus(String type, String status) {
        return donePromotionRepository.findAllByTypeAndStatus(type,status);
    }


    @Transactional
    public void giveDnPr(List<String> IdxArray) {
        for(int i = 0; i < IdxArray.size(); i++) {
            String Idx = IdxArray.get(i);
            Optional<DonePromotion> optional = donePromotionRepository.findById(Integer.parseInt(Idx));
            if(optional.isPresent()) {
                DonePromotion donePromotion = optional.get();
                donePromotion.setStatus("지급완료");
                donePromotionRepository.save(donePromotion);
            } else {
                throw  new NullPointerException();
            }
        }
    }


}
