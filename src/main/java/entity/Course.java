package entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@Entity
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title", length = 255)
    private String title;

    @Column(name = "description", columnDefinition = "nvarchar(MAX)")
    private String description;

    @Column(name = "category", length = 100)
    private String category;

    @Column(name = "level", length = 50)
    private String level;

    @Column(name = "duration")
    private int duration;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "author", length = 255)
    private String author;

    @Column(name = "createdAt")
    private Date createdAt;

    @Column(name = "updatedAt")
    private Date updatedAt;

    public Course() {
    }

    public Course(int id, String title, String description, String category, String level, int duration, String status, String author, Date createdAt, Date updatedAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.category = category;
        this.level = level;
        this.duration = duration;
        this.status = status;
        this.author = author;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Course{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", category='" + category + '\'' +
                ", level='" + level + '\'' +
                ", duration=" + duration +
                '}';
    }
}
