package mapper;

import dto.request.CourseTestRequest;
import dto.response.CourseTestResponse;
import entity.CourseTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import service.ICourseService;
import service.ICourseTestService;

@Component
public class CourseTestMapper {
    @Autowired
    private ICourseService courseService;
    public CourseTest fromCourseTestRequestAndCourseId(CourseTestRequest request, int courseId) throws Exception {
        if (request == null) {
            return null;
        }
        CourseTest courseTest = new CourseTest();

        courseTest.setCourse(courseService.getById(courseId));

        courseTest.setTestTittle(request.getTestTitle());
        courseTest.setTestDescription(request.getTestDescription());
        courseTest.setType("quiz");
        courseTest.setTestUrl(request.getTestUrl().getOriginalFilename());
        courseTest.setMaxScore(request.getMaxScore());
        courseTest.setDuration(request.getDuration());
        courseTest.setStatus(1);

        return courseTest;
    }
    public CourseTestResponse toCourseTestResponse(CourseTest origin) {
        if (origin == null) {
            return null;
        }

        CourseTestResponse response = new CourseTestResponse();
        response.setId(origin.getId());
        response.setCourse(origin.getCourse());
        response.setTestTittle(origin.getTestTittle());
        response.setTestDescription(origin.getTestDescription());
        response.setType(origin.getType());
        response.setTestUrl(origin.getTestUrl());
        response.setMaxScore(origin.getMaxScore());
        response.setDuration(origin.getDuration());
        response.setStatus(origin.getStatus());

        return response;
    }

}
