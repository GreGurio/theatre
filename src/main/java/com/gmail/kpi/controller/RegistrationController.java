package com.gmail.kpi.controller;

import com.gmail.kpi.model.Role;
import com.gmail.kpi.model.User;
import com.gmail.kpi.repository.UserRepo;
import com.gmail.kpi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration2";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userService.loadByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "Користувач існує!");
            return "registration2";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userService.save(user);

        return "redirect:/login";
    }
}
