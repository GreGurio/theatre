package com.gmail.kpi.repository;

import com.gmail.kpi.model.Concert;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConcertRepo extends JpaRepository<Concert, Integer> {
    Concert findConcertById(Integer concertid);
    Concert findConcertByName(String name);
}
