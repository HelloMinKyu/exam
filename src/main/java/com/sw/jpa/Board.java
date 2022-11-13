package com.sw.jpa;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "board")
@ToString(exclude={"account"})
//@Where(clause = "deleted_at is null")
//@SQLDelete(sql = "UPDATE board SET deleted_at=CURRENT_TIMESTAMP WHERE id=?")
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String title;
    private String content;
    private String writer;
    private String type;
    private int view;
    private String status;

    @CreationTimestamp
    private LocalDateTime createdAt;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "user_id")
    private Account account;
}
