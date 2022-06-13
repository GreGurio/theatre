package com.gmail.kpi.controller;

import com.gmail.kpi.model.Role;
import com.gmail.kpi.model.User;
import com.gmail.kpi.repository.UserRepo;
import com.gmail.kpi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin-panel/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    //@Autowired
    //private UserRepo userRepo;

    @Autowired
    UserService userService;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.loadAll());
        return "userList2";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit2";
    }

    @GetMapping("/delete/{user}")
    public String delete(@PathVariable User user) {
        userService.delete(user);
        return "redirect:/admin-panel/users";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            @RequestParam String password
    ) {
        user.setUsername(username);
        user.setPassword(password);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userService.save(user);
        return "redirect:/admin-panel/users";
    }
}
