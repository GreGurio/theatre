package com.gmail.kpi.controller;

import com.gmail.kpi.model.*;
import com.gmail.kpi.service.ConcertService;
import com.gmail.kpi.service.HallService;
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
@RequestMapping("/admin-panel")
public class AdminPanelController {
    @Autowired
    ConcertService concertService;

    @Autowired
    HallService hallService;


    @GetMapping
    public String adminPanel() {
        return "admin-panel";
    }


    @GetMapping("/statistics")
    public String statistics(Model model) {
        Iterable<Concert> concerts = concertService.loadAll();
        List<Integer> ticketsNum = new ArrayList<Integer>();

        List<Integer> prices = new ArrayList<Integer>();

        for (Concert concert: concerts) {
            Iterable<Hall> hall = hallService.loadByConcertid(concert.getId());
            int min_price = 999999;
            for (Hall h: hall) {
                if (h.getPrice() < min_price)
                    min_price = h.getPrice();
            }
            prices.add(min_price);
        }

        for (Concert concert: concerts) {
            List<Hall> hall = hallService.loadByConcertid(concert.getId());
            Integer num = 0;
            for (Hall place: hall) {
                if (place.isOwned()) {
                    num++;
                }
            }
            ticketsNum.add(num);
        }

        model.addAttribute("concerts", concerts);
        model.addAttribute("tickets", ticketsNum);
        model.addAttribute("prices", prices);

        return "statistics2";
    }




}
