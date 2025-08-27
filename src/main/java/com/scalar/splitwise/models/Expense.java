package com.scalar.splitwise.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "expense_type")
public class Expense extends BaseModel {
    private String description;
    private Date doneAt;
    @OneToMany(mappedBy = "expense")
    private List<UserExpense> userExpenses;
}
