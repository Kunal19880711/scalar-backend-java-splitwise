package com.scalar.splitwise.repositories;

import com.scalar.splitwise.models.Expense;
import com.scalar.splitwise.models.Group;
import com.scalar.splitwise.models.User;
import com.scalar.splitwise.models.UserExpense;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long> {
}

