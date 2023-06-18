package com.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "complaint_master_tbl")
public class Complaint extends BaseAudit {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "subject")
    private String subject;

    @Column(name = "description")
    private String description;

    @Column(name = "complaint_date")
    private String complaintDate;

    @Column(name = "reply")
    private String reply;

    @Column(name = "reply_date")
    private String replyDate;

    @Column(name = "complaint_status")
    private String complaintStatus;

    @ManyToOne
    @JoinColumn(name = "login_id")
    private LoginVO loginId;
}
