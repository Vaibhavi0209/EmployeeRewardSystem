package com.demo.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor(force = true)
@Table(name = "badge_master_tbl")
public class Badge extends BaseAudit{

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Column(name = "badge_name")
    private String badgeName;

    @NonNull
    @Column(name = "badge_description")
    @Size(max=2000)
    private String badgeDescription;

    @Column(name = "badge_image")
    private String badgeImage;

    @Column(name = "badge_Rewards")
    private Integer badgeRewards;

}
