package com.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "request_master_tbl")
public class Request extends BaseAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String subject;
    private String description;
    private String fileName;
    private String requestStatus;
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
    private String reason;
    private String rewards;
    private String title;
}
