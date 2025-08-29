package com.scalar.splitwise.controller;

import com.scalar.splitwise.dtos.*;
import com.scalar.splitwise.models.User;
import com.scalar.splitwise.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {
    @Autowired private UserService userService;

    public SignupUserResponseDto signup(SignupUserRequestDto signUpRequestDTO) {
        SignupUserResponseDto responseDTO = new SignupUserResponseDto();
        try {
            // Basic input validations
            User user = userService.signUp(
                    signUpRequestDTO.getName(),
                    signUpRequestDTO.getPhoneNumber(),
                    signUpRequestDTO.getPassword()
            );
            responseDTO.setUserId(user.getId());
            responseDTO.setResponseStatus(ResponseStatus.SUCCESS);
        } catch (Exception e) {
            System.out.println("Error during user signup: " + e.getMessage());
            responseDTO.setResponseStatus(ResponseStatus.FAILURE);
        }
        return responseDTO;
    }

    public LoginUserResponseDto login(LoginUserRequestDto loginRequestDTO) {
        String phoneNumber = loginRequestDTO.getPhoneNumber();
        String password = loginRequestDTO.getPassword();
        LoginUserResponseDto responseDTO = new LoginUserResponseDto();
        try {
            userService.login(phoneNumber, password);
            responseDTO.setResponseStatus(ResponseStatus.SUCCESS);
        } catch (Exception e) {
            System.out.println("Error during user login: " + e.getMessage());
            responseDTO.setResponseStatus(ResponseStatus.FAILURE);
        }
        return responseDTO;
    }
}
