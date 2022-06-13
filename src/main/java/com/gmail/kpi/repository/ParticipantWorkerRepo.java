package com.gmail.kpi.repository;

import com.gmail.kpi.model.ParticipantWorker;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ParticipantWorkerRepo extends JpaRepository<ParticipantWorker, Integer> {
    List<ParticipantWorker> findByConcertid(Integer concertid);
    List<ParticipantWorker> findByWorkerid(Integer workerid);
}
