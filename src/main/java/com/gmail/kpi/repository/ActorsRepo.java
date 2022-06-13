package com.gmail.kpi.repository;

import com.gmail.kpi.model.Actor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ActorsRepo extends JpaRepository<Actor, Integer> {
    List<Actor> findActorByConcertid(Integer concertid);
    Actor findBySurname(String surname);
    Actor findByActorid(Integer actorid);
}
