package mapper;

import dto.response.CourseTestResultResponse;
import entity.CourseTest;
import entity.CourseTestResult;
import entity.User;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

@Component
public class CourseTestResultMapper {
    public CourseTestResultResponse toCourseTestResultResponse(CourseTestResult courseTestResult){
        if(courseTestResult==null) return null;
        return CourseTestResultResponse.builder()
                .userId(courseTestResult.getUser().getId())
                .score(courseTestResult.getMark())
                .courseTestId(courseTestResult.getCourseTest().getId())
                .build();
    }
    public CourseTestResult fromData(User user, CourseTest courseTest, int mark, String url){
        return CourseTestResult.builder()
                .url(url)
                .courseTest(courseTest)
                .user(user)
                .mark(mark)
                .doneAt(LocalDateTime.now())
                .status(1)
                .build();
    }
}
