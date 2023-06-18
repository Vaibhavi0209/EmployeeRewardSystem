package com.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert
@ToString
public abstract class BaseAudit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "created_at",nullable = false)
    private Date createAt;
    @Column(name = "modified_at",nullable = false)
    private Date modifiedAt;
    @JsonIgnore
    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by", referencedColumnName = "id")
    private LoginVO createdBy;
    @JsonIgnore
    @ManyToOne(cascade = CascadeType.ALL,  fetch = FetchType.LAZY)
    @JoinColumn(name = " modified_by", referencedColumnName = "id")
    private LoginVO modifiedBy;

    @Column(name = "status",nullable = false)
    private Boolean status;
}