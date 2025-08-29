package com.scalar.splitwise.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignupUserResponseDto {
    private ResponseStatus responseStatus;
    private long userId;
}
