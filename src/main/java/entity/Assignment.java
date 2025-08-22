package entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Getter
@Setter
@Entity
public class Assignment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "classRoomId")
    private ClassRoom classRoom;

    @Column(name = "title", length = 255)
    private String tittle;

    @Column(name = "description", columnDefinition = "nvarchar(MAX)")
    private String description;

    @Column(name = "assignmentUrl", length = 500)
    private String assignmentUrl;

    @Column(name = "startAt")
    private LocalDateTime startAt;

    @Column(name = "endAt")
    private LocalDateTime endAt;

    @Column(name = "maxScore")
    private int maxScore;

    @ManyToOne
    @JoinColumn(name = "createBy")
    private User createBy;

    @Column(name = "isAllowLate")
    private boolean isAllowLate;

    public Assignment() {
    }

    @Override
    public String toString() {
        return "Assignment{" +
                "tittle='" + tittle + '\'' +
                ", description='" + description + '\'' +
                ", startAt=" + startAt +
                ", createBy=" + createBy +
                ", maxScore=" + maxScore +
                ", endAt=" + endAt +
                '}';
    }

    public Assignment(int id, ClassRoom classRoom, String tittle, String description, String assignmentUrl, LocalDateTime startAt, LocalDateTime endAt, int maxScore, User createBy, boolean isAllowLate) {
        this.id = id;
        this.classRoom = classRoom;
        this.tittle = tittle;
        this.description = description;
        this.assignmentUrl = assignmentUrl;
        this.startAt = startAt;
        this.endAt = endAt;
        this.maxScore = maxScore;
        this.createBy = createBy;
        this.isAllowLate = isAllowLate;
    }


}
