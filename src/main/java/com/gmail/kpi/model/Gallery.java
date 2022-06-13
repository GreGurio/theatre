package com.gmail.kpi.model;

import org.springframework.context.annotation.Primary;

import javax.persistence.*;

@Entity
@Table(name = "images")
public class Gallery {
    @Id
    @Column(name = "filename")
    private String filename;

    @Column(name = "concertid")
    private Integer concertid;


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
