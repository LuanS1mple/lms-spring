package dto.response;

import entity.Course;
import entity.CourseContent;
import entity.CourseTest;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CourseDetailResponse {
    private Course course;
    private List<CourseContent> contents;
    private List<CourseTest> courseTests;
}
