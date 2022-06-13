package com.gmail.kpi.service;

import com.gmail.kpi.model.Concert;
import com.gmail.kpi.repository.ConcertRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConcertService {
    @Autowired
    ConcertRepo concertRepo;

    public List<Concert> loadAll() {
        return concertRepo.findAll();
    }

    public Concert loadConcertById(Integer concertid) {
        return concertRepo.findConcertById(concertid);
    }

    public Concert loadConcertByName(String name) {
        return concertRepo.findConcertByName(name);
    }

}
