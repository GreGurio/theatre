package com.gmail.kpi.service;

import com.gmail.kpi.model.User;
import com.gmail.kpi.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    UserRepo userRepo;

    public User loadByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    public List<User> loadAll() {
        return  userRepo.findAll();
    }

    public void save(User user) {
        userRepo.save(user);
    }

    public void delete(User user) {
        userRepo.delete(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
}
