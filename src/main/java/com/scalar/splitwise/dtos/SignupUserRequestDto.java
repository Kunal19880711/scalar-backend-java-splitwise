package com.scalar.splitwise.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignupUserRequestDto {
    private String name;
    private String phoneNumber;
    private String password;
}

