package dto.response;

import entity.Course;
import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CourseContentResponse {
    private int id;

    private Course course;

    private String title;

    private String type;

    private String contentUrl;

    private int duration;

    private int orderIndex;

    private Date createdAt;
}
