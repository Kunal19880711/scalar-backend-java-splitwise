package com.scalar.splitwise.models;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity(name = "app_users")
public class User extends BaseModel {
    private String name;
    private String phoneNumber;
    private String passHash;
    @ManyToMany(mappedBy = "members")
    private List<Group>  groups;
}
