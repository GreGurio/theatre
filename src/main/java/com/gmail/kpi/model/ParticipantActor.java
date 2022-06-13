package com.gmail.kpi.model;

import javax.persistence.*;

@Entity
@Table(name = "actorconcert")
public class ParticipantActor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "statement_id")
    Integer id;

    @Column(name = "concertid")
    Integer concertid;

    @Column(name = "actorid")
    Integer actorid;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConcertid() {
        return concertid;
    }

    public void setConcertid(Integer concertid) {
        this.concertid = concertid;
    }

    public Integer getActorid() {
        return actorid;
    }

    public void setActorid(Integer actorid) {
        this.actorid = actorid;
    }
}
