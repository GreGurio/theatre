package com.gmail.kpi.service;

import com.gmail.kpi.model.ParticipantActor;
import com.gmail.kpi.repository.ParticipantActorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParticipantActorService {
    @Autowired
    ParticipantActorRepo participantActorRepo;

    public List<ParticipantActor> loadByConcertid(Integer concertid) {
        return participantActorRepo.findByConcertid(concertid);
    }

    public List<ParticipantActor> loadByActorid(Integer actorid) {
        return participantActorRepo.findByActorid(actorid);
    }

    public void deleteAll(List<ParticipantActor> actors) {
        participantActorRepo.deleteAll(actors);
    }

}
