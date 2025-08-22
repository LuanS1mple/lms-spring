package entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
@Entity
public class CourseContent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "courseId")
    private Course course;

    @Column(name = "title",length = 255)
    private String title;

    @Column(name = "type",length = 255)
    private String type;

    @Column(name = "contentUrl",length = 500)
    private String contentUrl;

    @Column(name = "duration")
    private int duration;

    @Column(name = "orderIndex")
    private int orderIndex;

    @Column(name = "createdAt")
    private Date createdAt;

    public CourseContent() {
    }

    public CourseContent(int id, Course course, String title, String type, String contentUrl, int duration, int orderIndex, Date createdAt) {
        this.id = id;
        this.course = course;
        this.title = title;
        this.type = type;
        this.contentUrl = contentUrl;
        this.duration = duration;
        this.orderIndex = orderIndex;
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "CourseContent{" +
                "course=" + course +
                ", title='" + title + '\'' +
                ", type='" + type + '\'' +
                ", contentUrl='" + contentUrl + '\'' +
                ", duration=" + duration +
                ", orderIndex=" + orderIndex +
                '}';
    }
}
