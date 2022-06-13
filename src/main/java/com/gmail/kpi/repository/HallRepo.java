package com.gmail.kpi.repository;

import com.gmail.kpi.model.Hall;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface HallRepo extends JpaRepository<Hall, Integer> {
    List<Hall> findByConcertid(Integer concert_id);
}
