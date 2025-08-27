package com.scalar.splitwise.models;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class GroupExpense extends Expense {
    @ManyToOne
    private Group group;
}
