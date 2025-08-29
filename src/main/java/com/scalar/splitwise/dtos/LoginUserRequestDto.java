package com.scalar.splitwise.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginUserRequestDto {
    private String phoneNumber;
    private String password;
}
