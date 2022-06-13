package com.gmail.kpi.repository;

import com.gmail.kpi.model.Gallery;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImagesRepo extends JpaRepository <Gallery, Integer> {
    List<Gallery> findByConcertid(Integer concertid);
}
