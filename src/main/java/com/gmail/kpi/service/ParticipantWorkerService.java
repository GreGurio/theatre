package com.gmail.kpi.service;

import com.gmail.kpi.model.ParticipantActor;
import com.gmail.kpi.model.ParticipantWorker;
import com.gmail.kpi.repository.ParticipantWorkerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ParticipantWorkerService {
    @Autowired
    ParticipantWorkerRepo participantWorkerRepo;

    public List<ParticipantWorker> loadByConcertid(Integer concertid) {
        return participantWorkerRepo.findByConcertid(concertid);
    }

    public List<ParticipantWorker> loadByWorkerid(Integer workerid) {
        return participantWorkerRepo.findByWorkerid(workerid);
    }

    public void deleteAll(List<ParticipantWorker> workers) {
        participantWorkerRepo.deleteAll(workers);
    }

}
