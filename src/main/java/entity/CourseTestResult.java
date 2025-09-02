package entity;


import entity.IdClass.CourseTestResultId;
import jakarta.persistence.*;
import lombok.*;
import service.impl.CourseTestResultService;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(CourseTestResultId.class)
public class CourseTestResult {
    @Id
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "courseTestId")
    @com.fasterxml.jackson.annotation.JsonIgnore
    private CourseTest courseTest;

    @Column(name = "url")
    private String url;

    @Column(name = "mark")
    private int mark;

    @Column(name = "doneAt")
    private LocalDateTime doneAt;

    @Column(name = "status")
    private int status;



    public CourseTestResult(User user, CourseTest courseTest, int mark, LocalDateTime doneAt, int status) {
        this.user = user;
        this.courseTest = courseTest;
        this.mark = mark;
        this.doneAt = doneAt;
        this.status = status;
    }


    @Override
    public String toString() {
        String statusText;
        if(status == CourseTestResultService.getStatusPassNumber()){
            statusText ="Đạt";
        }
        else{
            statusText ="Chưa đạt";
        }
        return "Thời gian: "+this.getDoneAt()+" - Điểm: "+this.getMark() + " - Trạng thái: " +status;
    }
}

