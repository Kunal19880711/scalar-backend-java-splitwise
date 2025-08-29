package com.scalar.splitwise.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity(name = "app_groups")
public class Group extends BaseModel {
    private String name;
    @ManyToMany
    private List<User> members;
    @Enumerated(EnumType.ORDINAL)
    private GroupType groupType;
    @OneToMany(mappedBy = "group")
    private List<Expense> expenses;
    @ManyToOne
    private User admin;
}
