package controller.AdminController;

import constant.Message;
import constant.ResponseStatus;
import dto.request.CourseContentRequest;
import dto.request.CourseTestRequest;
import dto.response.CourseContentResponse;
import dto.response.CourseDetailResponse;
import dto.response.CourseTestResponse;
import dto.response.ApiResponse;
import entity.Course;
import entity.CourseContent;
import entity.CourseTest;
import exception.AppException;
import exception.ErrorCode;
import mapper.CourseContentMapper;
import mapper.CourseTestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.ICourseContentService;
import service.ICourseService;
import service.ICourseTestService;

import java.util.List;

@Controller
@RequestMapping("courses")
public class DetailCourseController {
    @Autowired
    private ICourseService courseService;
    @Autowired
    private ICourseTestService courseTestService;
    @Autowired
    private ICourseContentService courseContentService;
    @Autowired
    private CourseContentMapper courseContentMapper;
    @Autowired
    private CourseTestMapper courseTestMapper;
    @GetMapping("{courseId}")
    @ResponseBody
    public ApiResponse<CourseDetailResponse> getCourseDetail(@PathVariable int courseId) throws Exception {
        ApiResponse<CourseDetailResponse> response;
            Course course = courseService.getActiveById(courseId);
            List<CourseContent> courseContents = courseContentService.getByCourseId(courseId);
            List<CourseTest> courseTests = courseTestService.getByCourseId(courseId);
            CourseDetailResponse data = CourseDetailResponse.builder()
                    .course(course)
                    .courseTests(courseTests)
                    .contents(courseContents)
                    .build();
            response = ApiResponse.<CourseDetailResponse>builder()
                    .data(data)
                    .status(ResponseStatus.GET_COURSEDETAIL_SUCCESS.getStatus())
                    .message(Message.GET_COURSEDETAIL_SUCCESS.getMessage())
                    .build();
        return response;
    }
    @PostMapping("{courseId}/course-content")
    @ResponseBody
    public ApiResponse<CourseContentResponse> uploadCourseContent(@RequestBody CourseContentRequest request, @PathVariable int courseId) throws Exception {
        CourseContent courseContent = courseContentMapper.fromCourseContentRequestAndCourse(request, courseId);
            return ApiResponse.<CourseContentResponse>builder()
                    .message(Message.CREATE_COURSECONTENT_SUCCESS.getMessage())
                    .data(courseContentMapper.toCourseContentResponse(courseContentService.add(courseContent)))
                    .status(ResponseStatus.CREATE_COURSECONTENT_SUCCESS.getStatus())
                    .build();
    }
    @PostMapping("{courseId}/course-test")
    public String uploadCourseTest(@ModelAttribute CourseTestRequest request, @PathVariable int courseId) throws Exception {
        CourseTest courseTest = courseTestMapper.fromCourseTestRequestAndCourseId(request, courseId);
        ApiResponse<CourseTestResponse> response= ApiResponse.<CourseTestResponse>builder()
                    .message(Message.CREATE_COURSETEST_SUCCESS.getMessage())
                    .data(courseTestMapper.toCourseTestResponse(courseTestService.add(courseTest)))
                    .status(ResponseStatus.CREATE_COURSETEST_SUCCESS.getStatus())
                    .build();
        System.out.println(response);
        return "redirect:/admin-cd?courseId="+ courseId;
    }
    @DeleteMapping("course-test/{courseTestId}")
    @ResponseBody
    public ApiResponse<Boolean> deleteCourseTest(@PathVariable int courseTestId){
        courseTestService.delete(courseTestId);
        return ApiResponse.<Boolean>builder()
                .status(ResponseStatus.DELETE_COURSETEST_SUCESS.getStatus())
                .message(Message.DELETE_COURSETEST_SUCCESS.getMessage())
                .data(true)
                .build();
    }
}
