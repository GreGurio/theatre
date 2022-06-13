package com.gmail.kpi.model;

import javax.persistence.*;

@Entity
@Table(name = "actors")
public class Actor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "actorid")
    private Integer actorid;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "concertid")
    private Integer concertid;

    @Column(name = "filename")
    private String filename;

    public Integer getActorid() {
        return actorid;
    }

    public void setActorid(Integer actorid) {
        this.actorid = actorid;
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

    public Integer getConcertid() {
        return concertid;
    }

    public void setConcertid(Integer concertid) {
        this.concertid = concertid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
