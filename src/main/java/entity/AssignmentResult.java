package entity;
import entity.IdClass.AssignmentResultId;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@IdClass(AssignmentResultId.class)
public class AssignmentResult {
    @Id
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name = "assignmentId")
    private Assignment assignment;

    @Column(name = "doneAt")
    private LocalDateTime doneAt;

    @Column(name = "submissionUrl",length = 500)
    private String submissionUrl;

    @Column(name = "mark")
    private int mark;

    @Column(name = "comment",columnDefinition = "nvarchar(MAX)")
    private String comment;

    @Column(name = "status")
    private int status;

    public AssignmentResult() {
    }

    public AssignmentResult(User user, Assignment assignment, LocalDateTime doneAt, String submissionUrl, int mark, String comment, int status) {
        this.user = user;
        this.assignment = assignment;
        this.doneAt = doneAt;
        this.submissionUrl = submissionUrl;
        this.mark = mark;
        this.comment = comment;
        this.status = status;
    }
}


