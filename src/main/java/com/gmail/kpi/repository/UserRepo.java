package com.gmail.kpi.repository;

import com.gmail.kpi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Integer> {
    User findByUsername(String username);
    User findByUserid(int id);
}
