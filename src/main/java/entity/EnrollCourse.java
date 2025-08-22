package entity;

import entity.IdClass.EnrollCourseId;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
@IdClass(EnrollCourseId.class)
public class EnrollCourse {
    @Id
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name = "courseId")
    private Course course;

    @Column(name = "enrollAt")
    private Date enrollAt;

    public EnrollCourse() {
    }

    public EnrollCourse(User user, Course course, Date enrollAt) {
        this.user = user;
        this.course = course;
        this.enrollAt = enrollAt;
    }


}

