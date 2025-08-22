package entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class CourseTest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "courseId")
    private Course course;

    @Column(name = "testTitle", columnDefinition = "nvarchar(255)")
    private String testTittle;

    @Column(name = "testDescription", columnDefinition = "nvarchar(MAX)")
    private String testDescription;

    @Column(name = "type", length = 50)
    private String type;

    @Column(name = "testUrl", length = 500)
    private String testUrl;

    @Column(name = "maxScore")
    private int maxScore;

    @Column(name = "duration")
    private int duration;

    @Column(name = "status")
    private int status;

    public CourseTest() {
    }

    public CourseTest(int id, Course course, String testTittle, String testDescription, String type, String testUrl, int maxScore, int duration, int status) {
        this.id = id;
        this.course = course;
        this.testTittle = testTittle;
        this.testDescription = testDescription;
        this.type = type;
        this.testUrl = testUrl;
        this.maxScore = maxScore;
        this.duration = duration;
        this.status = status;
    }


    @Override
    public String toString() {
        return "CourseTest{" +
                "course=" + course +
                ", testTittle='" + testTittle + '\'' +
                ", testDescription='" + testDescription + '\'' +
                ", type='" + type + '\'' +
                ", maxScore=" + maxScore +
                ", duration=" + duration +
                '}';
    }
}
