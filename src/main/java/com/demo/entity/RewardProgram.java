package com.demo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import net.bytebuddy.implementation.bind.annotation.Default;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;

@Entity
@Data
@Table(name = "reward_program_tbl")
@AllArgsConstructor
@NoArgsConstructor
public class RewardProgram extends BaseAudit {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event eventId;

    @Column(name = "event_date")
    private String eventDate;

    @NonNull
    @Column(name = "total_rewards")
    private Integer totalRewards;
    @NonNull
    @Column(name = "reward_for_winner")
    private Integer rewardWinner;
    @NonNull
    @Column(name = "reward_for_runner_up")
    private Integer rewardRunnerUp;

    @Column(name = "reward_status")
    private String rewardStatus;

    @Column(name = "is_finished", columnDefinition = "boolean default false")
    private boolean finished;

}
