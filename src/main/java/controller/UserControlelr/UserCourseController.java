package controller.UserControlelr;


import constant.Message;
import constant.ResponseStatus;
import dto.response.CourseDetailResponse;
import dto.response.ApiResponse;
import entity.Course;
import exception.AppException;
import exception.ErrorCode;
import jakarta.servlet.http.HttpSession;
import mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.*;

import java.util.List;

@Controller
@RequestMapping("courses")
public class UserCourseController {
    @Autowired
    private IEnrollCourseService enrollCourseService;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private ICourseService courseService;
    @Autowired
    private ICourseContentService courseContentService;
    @Autowired
    private ICourseTestService courseTestService;
    @GetMapping()
    public String getUserCourses(@RequestParam int userId, Model model){
        ApiResponse<List<CourseDetailResponse>> response;
            List<Course> courses = enrollCourseService.getCoursesById(userId);
            System.out.println(courses.size());
            response = ApiResponse.<List<CourseDetailResponse>>builder()
                    .data(courses.stream().map(course ->
                         CourseDetailResponse.builder()
                                .course(course)
                                .courseTests(courseTestService.getByCourseId(course.getId()))
                                .contents(courseContentService.getByCourseId(course.getId()))
                                .build()).toList())
                    .status(ResponseStatus.SUCCESS.getStatus())
                    .message(Message.GET_COURSES_SUCCESS.getMessage())
                    .build();
            model.addAttribute("response", response);
            System.out.println(response);
        return "user_CM";
    }
    @GetMapping("detail")
    public String getUserCourse(@RequestParam int courseId, Model model) throws Exception {
        ApiResponse<CourseDetailResponse> response;
            Course course = courseService.getActiveById(courseId);
            response = ApiResponse.<CourseDetailResponse>builder()
                    .data(CourseDetailResponse.builder()
                                    .course(course)
                                    .courseTests(courseTestService.getByCourseId(course.getId()))
                                    .contents(courseContentService.getByCourseId(course.getId()))
                                    .build())
                    .status(ResponseStatus.GET_COURSEDETAIL_SUCCESS.getStatus())
                    .message(Message.GET_COURSEDETAIL_SUCCESS.getMessage())
                    .build();
            model.addAttribute("response", response);
            System.out.println(response);
        System.out.println(response);
        return "user_CD";
    }
    @GetMapping("un-enroll")
    public String getUnEnrolledCourse(@RequestParam int userId, Model model){
        ApiResponse<List<CourseDetailResponse>> response;
            List<Course> courses = enrollCourseService.getUnEnrollCoursesById(userId);
            System.out.println(courses.size());
            response = ApiResponse.<List<CourseDetailResponse>>builder()
                    .data(courses.stream().map(course ->
                            CourseDetailResponse.builder()
                                    .course(course)
                                    .courseTests(courseTestService.getByCourseId(course.getId()))
                                    .contents(courseContentService.getByCourseId(course.getId()))
                                    .build()).toList())
                    .status(ResponseStatus.SUCCESS.getStatus())
                    .message(Message.GET_COURSES_SUCCESS.getMessage())
                    .build();
            model.addAttribute("response", response);
            System.out.println(response);
        return "user-browser-couses";
    }
    @PostMapping("enroll")
    public String enrollCourse(@RequestParam int courseId, HttpSession session) throws Exception {
        enrollCourseService.add((int)session.getAttribute("userId"), courseId);
        return "redirect:/courses?userId=" + session.getAttribute("userId");
    }
    @DeleteMapping("un-enroll")
    @ResponseBody
    public ApiResponse<Boolean> unenroll(@RequestParam int courseId, HttpSession session){
            int userId= (int)session.getAttribute("userId");
            enrollCourseService.unEnroll(userId, courseId);
            return ApiResponse.<Boolean>builder()
                    .status(ResponseStatus.UNENROLL_SUCCESS.getStatus())
                    .message(Message.UNENROLL_SUCCESS.getMessage())
                    .data(true)
                    .build();


    }
}
