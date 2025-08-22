package dto.response;

import entity.Course;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CourseTestResponse {
    private int id;
    private Course course;
    private String testTittle;
    private String testDescription;
    private String type;
    private String testUrl;
    private int maxScore;
    private int duration;
    private int status;
}
