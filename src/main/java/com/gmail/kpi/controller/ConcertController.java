package com.gmail.kpi.controller;


import com.gmail.kpi.model.*;
import com.gmail.kpi.service.*;
import javafx.concurrent.WorkerStateEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/concert")
public class ConcertController {
    @Autowired
    ConcertService concertService;
    @Autowired
    HallService hallService;
    @Autowired
    ImagesService imagesService;

    @Autowired
    ActorService actorsService;

    @Autowired
    ParticipantActorService participantActorService;

    @Autowired
    ParticipantWorkerService participantWorkerService;

    @Autowired
    WorkerService workersService;

    @Autowired
    UserService userService;

    @GetMapping("{concert}")
    public String concert(@PathVariable Concert concert, Model model) {
        Iterable<Gallery> gallery = imagesService.loadByConcertid(concert.getId());
        Iterable<Hall> hall = hallService.loadByConcertid(concert.getId());

        Iterable<ParticipantActor> actorsIds = participantActorService.loadByConcertid(concert.getId());

        List<Actor> actors = new ArrayList<Actor>();
        for (ParticipantActor actorID: actorsIds) {
            Actor actor = actorsService.loadByActorid(actorID.getActorid());
            actors.add(actor);
        }

        Iterable<ParticipantWorker> workerIds = participantWorkerService.loadByConcertid(concert.getId());
        List<Worker> workers = new ArrayList<>();
        for (ParticipantWorker workerID: workerIds) {
            Worker worker = workersService.loadByWorkerid(workerID.getWorkerid());
            workers.add(worker);
        }

        //Iterable<Worker> workers = workersService.loadWorkerByConcertid(concert.getId());

        model.addAttribute("gallery", gallery);
        model.addAttribute("concert", concert);
        model.addAttribute("hall", hall);
        model.addAttribute("actors", actors);
        model.addAttribute("workers", workers);

        return "concert2";
    }

    @GetMapping("/{concert}/{place}")
    public String price(@PathVariable Concert concert, Model model, @PathVariable Hall place) {

        Iterable<Gallery> gallery = imagesService.loadByConcertid(concert.getId());
        Iterable<Hall> hall = hallService.loadByConcertid(concert.getId());
        //Iterable<Worker> workers = workersService.loadWorkerByConcertid(concert.getId());

        Iterable<ParticipantActor> actorsIds = participantActorService.loadByConcertid(concert.getId());

        List<Actor> actors = new ArrayList<Actor>();
        for (ParticipantActor actorID: actorsIds) {
            Actor actor = actorsService.loadByActorid(actorID.getActorid());
            actors.add(actor);
        }

        Iterable<ParticipantWorker> workerIds = participantWorkerService.loadByConcertid(concert.getId());
        List<Worker> workers = new ArrayList<>();
        for (ParticipantWorker workerID: workerIds) {
            Worker worker = workersService.loadByWorkerid(workerID.getWorkerid());
            workers.add(worker);
        }

        model.addAttribute("gallery", gallery);
        model.addAttribute("concert", concert);
        model.addAttribute("hall", hall);
        model.addAttribute("actors", actors);
        model.addAttribute("workers", workers);

        String username;

        try {
            username = place.getOwner().getUsername();
        } catch(Exception e) {
            username = "None";
        }

        model.addAttribute("place", place);
        model.addAttribute("price", place.getPrice());
        model.addAttribute("isowned", place.isOwned());
        model.addAttribute("username", username);
        model.addAttribute("num", place.getPlace_num());
        return "concertPrice";
    }

    @PostMapping("{concert}/{hall}")
    public String ownPLace(@PathVariable Concert concert, @PathVariable Hall hall, @RequestParam("price") String price) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User user = userService.loadByUsername(username);

        if (!price.equals("") && !price.equals(" ") && price != null) {
            hall.setPrice(Integer.parseInt(price));
        }

        hall.setOwned(true);
        hall.setOwner(user);
        hallService.save(hall);
        return "redirect:/concert/{concert}";
    }

    @GetMapping("{concert}/{place}/unown")
    public String unOwn(@PathVariable Concert concert, @PathVariable Hall place) {
        place.setOwned(false);
        place.setOwner(null);
        hallService.save(place);
        return "redirect:/concert/" + concert.getId();
    }

}
