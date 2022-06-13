package com.gmail.kpi.service;

import com.gmail.kpi.model.Worker;
import com.gmail.kpi.repository.WorkersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkerService {
    @Autowired
    WorkersRepo workersRepo;

    public List<Worker> loadWorkerByConcertid(Integer concertid) {
        return workersRepo.findWorkerByConcertid(concertid);
    }

    public Worker loadBySurname(String surname) {
        return workersRepo.findBySurname(surname);
    }

    public Worker loadByWorkerid(Integer workerid) {
        return workersRepo.findByWorkerid(workerid);
    }

    public void save(Worker worker) {
        workersRepo.save(worker);
    }

    public void delete(Worker worker) {
        workersRepo.delete(worker);
    }

    public List<Worker> loadAll() {
        return workersRepo.findAll();
    }
}
