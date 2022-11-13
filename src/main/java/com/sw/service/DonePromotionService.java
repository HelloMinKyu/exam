package com.sw.service;

import com.sw.jpa.DonePromotion;
import com.sw.repository.DonePromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


}
