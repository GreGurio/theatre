package com.gmail.kpi.model;


import org.springframework.stereotype.Controller;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;

@Entity
@Table(name = "workers")
public class Worker {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "workerid")
    private Integer workerid;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "position")
    private String position;

    @Column(name = "filename")
    private String filename;

    @Column(name = "concertid")
    private Integer concertid;

    public Integer getWorkerid() {
        return workerid;
    }

    public void setWorkerid(Integer workerid) {
        this.workerid = workerid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getConcertid() {
        return concertid;
    }

    public void setConcertid(Integer concertid) {
        this.concertid = concertid;
    }
}
