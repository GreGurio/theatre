package com.gmail.kpi.service;


import com.gmail.kpi.model.Actor;
import com.gmail.kpi.repository.ActorsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActorService {
    @Autowired
    ActorsRepo actorsRepo;


    public List<Actor> loadActorByConcertid(Integer concertid) {
        return actorsRepo.findActorByConcertid(concertid);
    }
    public Actor loadBySurname(String surname) {
        return actorsRepo.findBySurname(surname);
    }
    public Actor loadByActorid(Integer actorid) {
        return actorsRepo.findByActorid(actorid);
    }

    public void save(Actor actor) {
        actorsRepo.save(actor);
    }

    public void delete(Actor actor) {
        actorsRepo.delete(actor);
    }

    public void deleteAll(List<Actor> actors) {
        actorsRepo.deleteAll(actors);
    }

    public List<Actor> loadAll() {
        return actorsRepo.findAll();
    }
}
