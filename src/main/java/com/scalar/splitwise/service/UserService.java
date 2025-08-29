package com.scalar.splitwise.service;

import com.scalar.splitwise.models.User;
import com.scalar.splitwise.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public User signUp(String name, String phoneNumber, String password) {
        Optional<User> optionalUser = userRepository.findByPhoneNumber(phoneNumber);
        if (optionalUser.isPresent()) {
            throw new RuntimeException("User already exists with phoneNumber: " + phoneNumber);
        }
        String passHash = passwordEncoder.encode(password);
        return userRepository.save(createUserDto(name, phoneNumber, passHash));
    }

    private User createUserDto(String name, String phoneNumber, String passHash) {
        User user = new User();
        user.setName(name);
        user.setPhoneNumber(phoneNumber);
        user.setPassHash(passHash);
        return user;
    }

    public void login(String phoneNumber, String password) {
        User user =  userRepository.findByPhoneNumber(phoneNumber)
                .orElseThrow(() -> new RuntimeException("User does not exist with phoneNumber: " + phoneNumber));
        if (!passwordEncoder.matches(password, user.getPassHash())) {
            throw new RuntimeException("Invalid password");
        }
    }
}