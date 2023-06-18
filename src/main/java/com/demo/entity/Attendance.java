package com.demo.entity;


import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "attendance_master_tbl")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Attendance extends BaseAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "event_id")
    private Event eventId;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "employee_id")
    private Employee employeeId;
    @Column(name = "is_winner")
    private Boolean isWinner;

    @Column(name = "is_runner_up")
    private Boolean isRunnerUp;

    @Column(name = "attempt_winner")
    private Integer attemptWinner;

    @Column(name = "Attempt_runner_up")
    private Integer attemptRunnerUp;
    @Column(name = "attempt_event")
    private Integer attemptEvent;

}
