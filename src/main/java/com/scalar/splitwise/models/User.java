package com.scalar.splitwise.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity(name = "sw_users")
public class User extends BaseModel {
    private String name;
    private String email;
    private String passHash;
    @ManyToMany
    @JoinTable(
            name = "sw_user_groups",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "group_id")
    )
    private List<Group> groups;
    @OneToMany(mappedBy = "owner")
    private List<Group> ownedGroups;
    @OneToMany(mappedBy = "user")
    private List<UserExpense> userExpenses;
    @OneToMany(mappedBy = "from")
    private List<Transaction> fromTransaction;
    @OneToMany(mappedBy = "to")
    private List<Transaction> toTransaction;
}
