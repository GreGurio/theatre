package com.gmail.kpi.controller;


import com.gmail.kpi.model.ParticipantWorker;
import com.gmail.kpi.model.Worker;
import com.gmail.kpi.service.ParticipantWorkerService;
import com.gmail.kpi.service.WorkerService;
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
@RequestMapping("/admin-panel/workers")
public class AdminPanelWorkerController {
    
    @Autowired
    WorkerService workersService;


    @Autowired
    ParticipantWorkerService participantWorkerService;

    @Value("${upload.workerpath}")
    private String uploadWorkerPath;


    @GetMapping("/create")
    public String workerCreate() {
        return "workerCreate";
    }

    @PostMapping("/create")
    public String workerSave(Worker worker, Model model, @RequestParam("file") MultipartFile file) throws IOException {
        Worker workerFromBb = workersService.loadBySurname(worker.getSurname());

        if(workerFromBb != null) {
            model.addAttribute("message", "Працівник існує!");
            return "workerCreate";
        }

        if (file != null) {
            File uploadDir = new File(uploadWorkerPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadWorkerPath + "/" + resultFilename));

            worker.setFilename(resultFilename);
        }

        workersService.save(worker);

        return "redirect:/admin-panel/workers/";
    }



    @PostMapping("/edit/{worker}")
    public String workerSave(@PathVariable Worker worker,
                             @RequestParam String name,
                             @RequestParam String surname,
                             @RequestParam String position,
                             @RequestParam("file") MultipartFile file) throws IOException {
        worker.setName(name);
        worker.setSurname(surname);
        worker.setPosition(position);

        if (file != null && !worker.getFilename().equals(file.getOriginalFilename())) {
            File uploadDir = new File(uploadWorkerPath);

            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadWorkerPath + "/" + resultFilename));

            worker.setFilename(resultFilename);
        }

        workersService.save(worker);
        return "redirect:/admin-panel/workers";
    }

    @GetMapping()
    public String workerList(Model model) {
        Iterable<Worker> workers = workersService.loadAll();

        model.addAttribute("workers", workers);

        return "workerList";
    }

    @GetMapping("/edit/{worker}")
    public String workerEdit(@PathVariable Worker worker, Model model) {
        model.addAttribute("worker", worker);

        return "workerEdit";
    }

    @GetMapping("/delete/{worker}")
    public String workerDelete(@PathVariable Worker worker) {
        workersService.delete(worker);

        List<ParticipantWorker> workerIds = participantWorkerService.loadByWorkerid(worker.getWorkerid());
        participantWorkerService.deleteAll(workerIds);

        return "redirect:/admin-panel/workers";
    }
}
