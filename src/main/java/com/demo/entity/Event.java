package com.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "event_master_tbl")
public class Event extends BaseAudit{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Column(name = "event_name")
    private String eventName;

    @NonNull
    @Column(name = "event_description")
    @Size(max=2000)
    private String eventDescription;

    @Column(name="event_image")
    private String eventImage;

    public Event(int id){
        this.id = id;
    }

}
