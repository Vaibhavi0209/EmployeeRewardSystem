package com.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.Valid;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Table(name = "badge_criteria_tbl")
public class BadgeCriteria extends BaseAudit implements Serializable {

    private static final long serialVersionUID= -1840727204032585760L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "criteria")
    private String criteria;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Valid
    @JoinColumn(name = "badge_id")
    private Badge badge;


}
