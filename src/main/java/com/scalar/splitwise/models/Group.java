package com.scalar.splitwise.models;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity(name = "sw_groups")
public class Group extends BaseModel {
    private String name;
    @ManyToMany(mappedBy = "groups")
    private List<User> users;
    @ManyToOne
    private User owner;
    @OneToMany(mappedBy = "group")
    private List<GroupExpense> expenses;
    @OneToMany(mappedBy = "group")
    private List<GroupTransaction> groupTransactions;
}
