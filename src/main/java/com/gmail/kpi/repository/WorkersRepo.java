package com.gmail.kpi.repository;

import com.gmail.kpi.model.Worker;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WorkersRepo extends JpaRepository<Worker, Integer> {
    List<Worker> findWorkerByConcertid(Integer concertid);
    Worker findBySurname(String surname);
    Worker findByWorkerid(Integer workerid);
}
