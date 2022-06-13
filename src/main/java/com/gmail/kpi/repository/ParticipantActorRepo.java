package com.gmail.kpi.repository;

import com.gmail.kpi.model.ParticipantActor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ParticipantActorRepo extends JpaRepository<ParticipantActor, Integer> {
    List<ParticipantActor> findByConcertid(Integer concertid);
    List<ParticipantActor> findByActorid(Integer actorid);

}
