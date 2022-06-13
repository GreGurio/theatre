package com.gmail.kpi.controller;

import com.gmail.kpi.model.Actor;
import com.gmail.kpi.model.ParticipantActor;
import com.gmail.kpi.service.ActorService;
import com.gmail.kpi.service.ParticipantActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin-panel/actors")
public class AdminPanelActorController {

    @Autowired
    ActorService actorsService;

    @Autowired
    ParticipantActorService participantActorService;

    
    @Value("${upload.actorpath}")
    private String uploadActorPath;


    @GetMapping()
    public String actorList(Model model) {
        Iterable<Actor> actors = actorsService.loadAll();

        model.addAttribute("actors", actors);

        return "actorList";
    }

    @GetMapping("/edit/{actor}")
    public String actorEdit(@PathVariable Actor actor, Model model) {

        model.addAttribute("actor", actor);

        return "actorEdit";
    }

    @PostMapping("/edit/{actor}")
    public String actorSave(@PathVariable Actor actor,
                            @RequestParam String name,
                            @RequestParam String surname,
                            @RequestParam("file") MultipartFile file) throws IOException {

        actor.setName(name);
        actor.setSurname(surname);

        if (file != null && !actor.getFilename().equals(file.getOriginalFilename())) {
            File uploadDir = new File(uploadActorPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadActorPath + "/" + resultFilename));

            actor.setFilename(resultFilename);
        }


        actorsService.save(actor);

        return "redirect:/admin-panel/actors";
    }

    @GetMapping("/delete/{actor}")
    public String actorDelete(@PathVariable Actor actor) {
        actorsService.delete(actor);

        List<ParticipantActor> actorsIds = participantActorService.loadByActorid(actor.getActorid());
        participantActorService.deleteAll(actorsIds);

        return "redirect:/admin-panel/actors";
    }

    @GetMapping("/create")
    public String actorCreate() {
        return "actorCreate";
    }


    @PostMapping("/create")
    public String saveActor(Actor actor, Model model, @RequestParam("file") MultipartFile file) throws IOException {
        Actor actorFromDb = actorsService.loadBySurname(actor.getSurname());

        if (actorFromDb != null) {
            model.addAttribute("message", "Актор існує!");
            return "actorCreate";
        }

        if (file != null) {
            File uploadDir = new File(uploadActorPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadActorPath + "/" + resultFilename));

            actor.setFilename(resultFilename);
        }


        actorsService.save(actor);

        return "redirect:/admin-panel/actors";
    }


}
