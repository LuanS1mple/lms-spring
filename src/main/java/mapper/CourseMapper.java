package mapper;


import dto.response.CourseResponse;
import entity.Course;
import dto.request.CourseRequest;
import org.springframework.stereotype.Component;

import java.util.Date;
@Component
public class CourseMapper {
    public static Course fromCourseRequesst(CourseRequest request){
        Course course = new Course();
        course.setTitle(request.getTitle());
        course.setDescription(request.getDescription());
        course.setCategory(request.getCategory());
        course.setLevel(request.getLevel());
        course.setDuration(request.getDuration());
        course.setAuthor(request.getAuthor());
        course.setStatus("active");
        course.setCreatedAt(new Date());
        course.setUpdatedAt(new Date());
        return course;
    }
    public static void mapCourse(Course source, Course target) {
        target.setTitle(source.getTitle());
        target.setDescription(source.getDescription());
        target.setCategory(source.getCategory());
        target.setLevel(source.getLevel());
        target.setDuration(source.getDuration());
        target.setStatus(source.getStatus());
        target.setAuthor(source.getAuthor());
        target.setCreatedAt(source.getCreatedAt());
        target.setUpdatedAt(new Date());
    }
    public static CourseResponse fromCourse(Course course){
        return CourseResponse.builder()
                .id(course.getId())
                .title(course.getTitle())
                .level(course.getLevel())
                .description(course.getDescription())
                .author(course.getAuthor())
                .status(course.getStatus())
                .category(course.getCategory())
                .duration(course.getDuration())
                .createdAt(course.getCreatedAt())
                .build();
    }
}
