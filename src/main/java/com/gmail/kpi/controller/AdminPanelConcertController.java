package com.gmail.kpi.controller;

import com.gmail.kpi.model.*;
import com.gmail.kpi.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin-panel/concerts")
public class AdminPanelConcertController {
    @Autowired
    ConcertRepo concertRepo;

    @Autowired
    HallRepo hallRepo;

    @Autowired
    ImagesRepo imagesRepo;

    @Autowired
    ActorsRepo actorsRepo;

    @Autowired
    WorkersRepo workersRepo;

    @Autowired
    ParticipantActorRepo participantActorRepo;

    @Autowired
    ParticipantWorkerRepo participantWorkerRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @GetMapping()
    public String concertList(Model model) {
        Iterable<Concert> concerts = concertRepo.findAll();
        List<Integer> prices = new ArrayList<Integer>();

        for (Concert concert: concerts) {
            Iterable<Hall> hall = hallRepo.findByConcertid(concert.getId());
            int min_price = 999999;
            for (Hall h: hall) {
                if (h.getPrice() < min_price)
                    min_price = h.getPrice();
            }
            prices.add(min_price);
        }

        model.addAttribute("concerts", concerts);
        model.addAttribute("prices", prices);


        return "concertList2";
    }

    @GetMapping("/edit/{concert}")
    public String concertEdit(@PathVariable Concert concert, Model model) {
        Iterable<Actor> actors = actorsRepo.findAll();
        Iterable<Worker> workers = workersRepo.findAll();

        List<Actor> chosenActors = new ArrayList<>();
        Iterable<ParticipantActor> chosenActorsIds = participantActorRepo.findByConcertid(concert.getId());
        for (ParticipantActor actorId: chosenActorsIds) {
            Actor actor = actorsRepo.findByActorid(actorId.getActorid());
            chosenActors.add(actor);
        }

        List<Worker> chosenWorkers = new ArrayList<>();
        Iterable<ParticipantWorker> chosenWorkersIds = participantWorkerRepo.findByConcertid(concert.getId());
        for (ParticipantWorker workerId: chosenWorkersIds) {
            Worker worker = workersRepo.findByWorkerid(workerId.getWorkerid());
            chosenWorkers.add(worker);
        }

        model.addAttribute("chosen_actors", chosenActors);
        model.addAttribute("chosen_workers", chosenWorkers);

        model.addAttribute("actors", actors);
        model.addAttribute("workers", workers);

        model.addAttribute("concert", concert);
        return "concertEdit";
    }

    @PostMapping("/edit/{concert}")
    public String concertEditSave(@PathVariable Concert concert,
                                  @RequestParam("name") String name,
                                  @RequestParam("description") String description,
                                  @RequestParam("date") String date,
                                  @RequestParam("file") MultipartFile file,
                                  @RequestParam("files") MultipartFile[] files,
                                  @RequestParam("actor-names") String actorStr,
                                  @RequestParam("worker-names") String workerStr) throws IOException {
        concert.setName(name);
        concert.setDescription(description);
        concert.setDate(date);
        concertRepo.save(concert);

        Iterable<ParticipantActor> chosenActors = participantActorRepo.findByConcertid(concert.getId());
        Iterable<ParticipantWorker> chosenWorkers = participantWorkerRepo.findByConcertid(concert.getId());
        participantActorRepo.deleteAll(chosenActors);
        participantWorkerRepo.deleteAll(chosenWorkers);

        String[] actors = actorStr.split(",");
        List<Actor> actorList = new ArrayList<>();


        if (file != null) {
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            concert.setFilename(resultFilename);
        }


        for (int i = 0; i < actors.length; i++) {
            String[] nameSurname = actors[i].split(" ");

            Actor actor = actorsRepo.findBySurname(nameSurname[1]);

            if (actor != null) {
                // if (actor.getName().equals(nameSurname[0]))
                actorList.add(actor);
            }
        }

        for (Actor actor: actorList) {
            System.out.println(1);
            ParticipantActor participantActor = new ParticipantActor();
            participantActor.setConcertid(concert.getId());
            participantActor.setActorid(actor.getActorid());
            participantActorRepo.save(participantActor);
        }

        String[] workers = workerStr.split(",");
        List<Worker> workerList = new ArrayList<>();


        for (int i = 0; i < workers.length; i++) {
            String[] nameSurname = workers[i].split(" ");

            Worker worker = workersRepo.findBySurname(nameSurname[1]);

            if (worker != null) {
                if (worker.getName().equals(nameSurname[0]))
                    workerList.add(worker);
            }
        }

        for (Worker worker: workerList) {
            System.out.println(1);
            ParticipantWorker participantWorker = new ParticipantWorker();
            participantWorker.setConcertid(concert.getId());
            participantWorker.setWorkerid(worker.getWorkerid());
            participantWorkerRepo.save(participantWorker);
        }

        if (files != null) {
            List<MultipartFile> galleryFiles = new ArrayList<>();
            galleryFiles.addAll(Arrays.asList(files));

            for (MultipartFile aFile : galleryFiles) {
                if (aFile != null) {
                    File uploadDir = new File(uploadPath);

                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    String uuidFile = UUID.randomUUID().toString();
                    String resultFilename = uuidFile + "." + aFile.getOriginalFilename();

                    aFile.transferTo(new File(uploadPath + "/" + resultFilename));

                    Gallery img = new Gallery();
                    img.setConcertid(concert.getId());
                    img.setFilename(resultFilename);
                    imagesRepo.save(img);
                }
            }
        }




        return "redirect:/admin-panel/concerts";
    }

    @GetMapping("/add")
    public String concertAdd(Model model) {
        Iterable<Actor> actors = actorsRepo.findAll();
        Iterable<Worker> workers = workersRepo.findAll();

        model.addAttribute("actors", actors);
        model.addAttribute("workers", workers);

        return "concertAdd";
    }



    @PostMapping("/add")
    public String concertSave(Concert concert,
                              Model model,
                              @RequestParam("file") MultipartFile file,
                              @RequestParam("files") MultipartFile[] files,
                              @RequestParam("actor-names") String actorStr,
                              @RequestParam("worker-names") String workerStr) throws IOException {
        Concert concertFromDb = concertRepo.findConcertByName(concert.getName());




        if (concertFromDb != null) {
            Iterable<Actor> actors = actorsRepo.findAll();
            Iterable<Worker> workers = workersRepo.findAll();

            model.addAttribute("actors", actors);
            model.addAttribute("workers", workers);
            model.addAttribute("message", "Концерт існує!");
            return "concertAdd";
        }

        if (file != null) {
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            concert.setFilename(resultFilename);
        }



        concertRepo.save(concert);

        String[] actors = actorStr.split(",");
        List<Actor> actorList = new ArrayList<>();


        for (int i = 0; i < actors.length; i++) {
            String[] nameSurname = actors[i].split(" ");

            Actor actor = actorsRepo.findBySurname(nameSurname[1]);

            if (actor != null) {
                // if (actor.getName().equals(nameSurname[0]))
                actorList.add(actor);
            }
        }

        for (Actor actor: actorList) {
            System.out.println(1);
            ParticipantActor participantActor = new ParticipantActor();
            participantActor.setConcertid(concert.getId());
            participantActor.setActorid(actor.getActorid());
            participantActorRepo.save(participantActor);
        }

        String[] workers = workerStr.split(",");
        List<Worker> workerList = new ArrayList<>();


        for (int i = 0; i < workers.length; i++) {
            String[] nameSurname = workers[i].split(" ");

            Worker worker = workersRepo.findBySurname(nameSurname[1]);

            if (worker != null) {
                if (worker.getName().equals(nameSurname[0]))
                    workerList.add(worker);
            }
        }

        for (Worker worker: workerList) {
            System.out.println(1);
            ParticipantWorker participantWorker = new ParticipantWorker();
            participantWorker.setConcertid(concert.getId());
            participantWorker.setWorkerid(worker.getWorkerid());
            participantWorkerRepo.save(participantWorker);
        }


        List<MultipartFile> galleryFiles = new ArrayList<>();
        galleryFiles.addAll(Arrays.asList(files));

        for (MultipartFile aFile: galleryFiles) {
            if (aFile != null) {
                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + aFile.getOriginalFilename();

                aFile.transferTo(new File(uploadPath + "/" + resultFilename));

                Gallery img = new Gallery();
                img.setConcertid(concert.getId());
                img.setFilename(resultFilename);
                imagesRepo.save(img);
            }
        }

        List<Hall> hall = new ArrayList<>();
        for (int i = 0; i < 132; i++) {
            Hall place = new Hall();
            place.setPlace_num(i+1);
            place.setOwned(false);
            place.setOwner(null);
            place.setConcertid(concert.getId());
            place.setPrice(500);
            hall.add(place);
        }
        hallRepo.saveAll(hall);



        return "redirect:/admin-panel/concerts";
    }

    @GetMapping("/delete/{concert}")
    public String concertDelete(@PathVariable Concert concert, Model model) {
        int id = concert.getId();

        List<Hall> hall = hallRepo.findByConcertid(id);
        hallRepo.deleteAll(hall);

        List<Gallery> gallery = imagesRepo.findByConcertid(id);
        imagesRepo.deleteAll(gallery);

        List<ParticipantActor> actorIds = participantActorRepo.findByConcertid(concert.getId());
        participantActorRepo.deleteAll(actorIds);

        List<ParticipantWorker> workerIds = participantWorkerRepo.findByConcertid(concert.getId());
        participantWorkerRepo.deleteAll(workerIds);

        concertRepo.delete(concert);
        return "redirect:/admin-panel/concerts";
    }

}
