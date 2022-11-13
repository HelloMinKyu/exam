package com.sw.repository;

import com.sw.jpa.DonePromotion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DonePromotionRepository extends JpaRepository<DonePromotion, Integer> {
    List<DonePromotion> findAllByTypeAndStatus(String type, String status);
}
