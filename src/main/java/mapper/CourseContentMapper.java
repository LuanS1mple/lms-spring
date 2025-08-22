package mapper;

import dto.request.CourseContentRequest;
import dto.response.CourseContentResponse;
import entity.CourseContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import service.ICourseContentService;
import service.ICourseService;

import java.sql.Date;
@Component
public class CourseContentMapper {
    @Autowired
    private  ICourseContentService courseContentService;
    @Autowired
    private  ICourseService courseService;
    public  CourseContent fromCourseContentRequestAndCourse(CourseContentRequest request, int courseId) throws Exception {
        CourseContent courseContent = new CourseContent();
        courseContent.setCourse(courseService.getById(courseId));
        courseContent.setContentUrl(request.getContentUrl());
        courseContent.setType(request.getType());
        courseContent.setTitle(request.getTitle());
        courseContent.setDuration(20);
        courseContent.setOrderIndex(courseContentService.getByCourseId(courseId).size()+1);
        courseContent.setCreatedAt(new Date(System.currentTimeMillis()));
        return  courseContent;
    }
    public  CourseContentResponse toCourseContentResponse(CourseContent origin) {
        if (origin == null) {
            return null;
        }
        CourseContentResponse response = new CourseContentResponse();
        response.setId(origin.getId());
        response.setCourse(origin.getCourse());
        response.setTitle(origin.getTitle());
        response.setType(origin.getType());
        response.setContentUrl(origin.getContentUrl());
        response.setDuration(origin.getDuration());
        response.setOrderIndex(origin.getOrderIndex());
        response.setCreatedAt(origin.getCreatedAt());

        return response;
    }

}
