package com.gmail.kpi.controller;

import com.gmail.kpi.model.Concert;
import com.gmail.kpi.model.Hall;
import com.gmail.kpi.repository.ConcertRepo;
import com.gmail.kpi.repository.HallRepo;
import com.gmail.kpi.service.ConcertService;
import com.gmail.kpi.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {


    @Autowired
    ConcertService concertService;

    @Autowired
    HallService hallService;

    @GetMapping("/")
    public String main(Model model)  {
        Iterable<Concert> concerts = concertService.loadAll();
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

        model.addAttribute("concerts", concerts);
        model.addAttribute("prices", prices);

        return "main2";
    }


    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }

}
