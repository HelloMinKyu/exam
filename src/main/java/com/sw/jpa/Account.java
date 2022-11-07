package com.sw.jpa;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; //pk
    private String name; //userID
    private String password; //userPassword
    private Integer gender; //sex

    @Builder
    public Account (int id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }
}
