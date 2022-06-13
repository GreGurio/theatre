package com.gmail.kpi.model;

import javax.persistence.*;

@Entity
@Table(name = "workerconcert")
public class ParticipantWorker {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "statement_id")
    Integer id;

    @Column(name = "concertid")
    Integer concertid;

    @Column(name = "workerid")
    Integer workerid;

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

    public Integer getWorkerid() {
        return workerid;
    }

    public void setWorkerid(Integer workerid) {
        this.workerid = workerid;
    }
}
