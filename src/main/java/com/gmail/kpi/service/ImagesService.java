package com.gmail.kpi.service;

import com.gmail.kpi.model.Gallery;
import com.gmail.kpi.repository.ImagesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImagesService {
    @Autowired
    ImagesRepo imagesRepo;

    public List<Gallery> loadByConcertid(Integer concertid) {
        return imagesRepo.findByConcertid(concertid);
    }

}
