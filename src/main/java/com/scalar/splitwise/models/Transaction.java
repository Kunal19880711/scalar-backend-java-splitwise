package com.scalar.splitwise.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "transaction_type")
public class Transaction extends BaseModel {
    @ManyToOne
    private User from;
    @ManyToOne
    private User to;
    @Enumerated(EnumType.ORDINAL)
    private TransactionStatus transactionStatus;
}
