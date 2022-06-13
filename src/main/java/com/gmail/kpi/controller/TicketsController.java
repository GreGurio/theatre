package com.gmail.kpi.controller;

import com.gmail.kpi.model.Concert;
import com.gmail.kpi.model.Hall;
import com.gmail.kpi.model.User;
import com.gmail.kpi.repository.ConcertRepo;
import com.gmail.kpi.repository.HallRepo;
import com.gmail.kpi.repository.UserRepo;
import com.gmail.kpi.service.ConcertService;
import com.gmail.kpi.service.HallService;
import com.gmail.kpi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.ArrayList;
import java.util.List;


@Controller
public class TicketsController {

    //@Autowired
    //UserRepo userRepo;

    //@Autowired
    //HallRepo hallRepo;

    @Autowired
    HallService hallService;

    @Autowired
    UserService userService;

    //@Autowired
    //ConcertRepo concertRepo;

    @Autowired
    ConcertService concertService;

    @GetMapping("/my-tickets")
    public String tickets(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User user = userService.loadByUsername(username);

        Iterable<Hall> places = hallService.loadAll();
        List<Hall> usersPlaces = new ArrayList<Hall>();

        for (Hall place: places) {
            if (place.getOwner() != null && place.getOwner().getUserid() == user.getUserid()) {
                usersPlaces.add(place);
            }
        }

        List<Concert> concerts = new ArrayList<Concert>();

        for (Hall place: usersPlaces) {
            Concert concert = concertService.loadConcertById(place.getConcertid());
            concerts.add(concert);
        }

        model.addAttribute("places", usersPlaces);
        model.addAttribute("concerts", concerts);

        return "my-tickets2";
    }

    @GetMapping("/my-tickets/delete/{hall}")
    public String deleteTicket(@PathVariable Hall hall) {
        hall.setOwned(false);
        hall.setOwner(null);
        hallService.save(hall);
        return "redirect:/my-tickets";
    }

}
