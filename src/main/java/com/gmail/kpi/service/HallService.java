package com.gmail.kpi.service;

import com.gmail.kpi.model.Hall;
import com.gmail.kpi.repository.HallRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HallService {
    @Autowired
    HallRepo hallRepo;

    public List<Hall> loadAll() {
        return hallRepo.findAll();
    }

    public List<Hall> loadByConcertid(Integer concert_id) {
        return hallRepo.findByConcertid(concert_id);
    }

    public void save(Hall hall) {
        hallRepo.save(hall);
    }
}
