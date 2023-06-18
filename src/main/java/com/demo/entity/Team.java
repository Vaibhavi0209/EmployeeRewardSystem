package com.demo.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "team_master_table")
@Data
@ToString
public class Team extends BaseAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "team_name")
    private String teamName;
    @Column(name = "team_description")
    private String teamDescription;


    @ManyToMany
    @JoinTable(
            name = "team_mapping_table",
            joinColumns = @JoinColumn(name = "team_id"),
            inverseJoinColumns = @JoinColumn(name = "employee_id")
    )
    private List<Employee> employees;



}
