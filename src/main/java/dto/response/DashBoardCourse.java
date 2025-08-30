package dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DashBoardCourse {
    int totalCourse;
    int activeCourse;
    int totalEnroll;
    List<CourseResponse> courses;
}
