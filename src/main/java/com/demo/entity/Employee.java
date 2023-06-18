package com.demo.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.Valid;
import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Employee_master_tbl")
@ToString
public class Employee extends BaseAudit {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "emloyee_name")
    private String employeeName;

    @Column(name = "employee_id")
    private String employeeId;

    @Column(name = "gender")
    private String gender;

    @Column(name = "email")
    private String email;

    @Column(name = "phone_no")
    private String phoneNo;

    @Column(name = "dob")
    private String dob;

    @Column(name = "address")
    private String address;
    @ManyToOne
    @JoinColumn(name = "job_role_id")
    private JobRole jobRoleId;
    @Column(name = "pinCode")
    private String pinCode;
    @ManyToOne
    @JoinColumn(name = "state_id")
    private State stateId;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City cityId;

    @Column(name = "employee_file_name")
    private String employeeFileName;

    @Column(name = "employee_file_path")
    private String employeeFilePath;

    @OneToOne
    @JoinColumn(name = "login_id")
    private LoginVO loginVO;

}
