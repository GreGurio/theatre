package com.gmail.kpi.model;

import javax.persistence.*;

@Entity
@Table(name = "hall")
public class Hall {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "statement_id")
    private Integer statement_id;

    @Column(name = "place_num")
    private Integer place_num;

    @Column(name = "price")
    private Integer price;

    @Column(name = "concertid")
    private Integer concertid;

    @Column(name = "isowned")
    private boolean isowned;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User userId;

    public String getOwnerName() {
        return userId != null ? userId.getUsername() : "<none>";
    }

    public Integer getStatement_id() {
        return statement_id;
    }

    public void setStatement_id(Integer statement_id) {
        this.statement_id = statement_id;
    }

    public Integer getPlace_num() {
        return place_num;
    }

    public void setPlace_num(Integer place_num) {
        this.place_num = place_num;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getConcertid() {
        return concertid;
    }

    public void setConcertid(Integer concertid) {
        this.concertid = concertid;
    }

    public User getOwner() {
        return userId;
    }

    public void setOwner(User owner) {
        this.userId = owner;
    }

    public boolean isOwned() {
        return isowned;
    }

    public void setOwned(boolean owned) {
        isowned = owned;
    }
}
