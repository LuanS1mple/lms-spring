package controller.UserControlelr;

import constant.Message;
import constant.ResponseStatus;
import dto.response.CourseTestResultResponse;
import dto.response.ApiResponse;
import entity.CourseTestResult;
import exception.AppException;
import exception.ErrorCode;
import jakarta.servlet.http.HttpSession;
import mapper.CourseTestResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.ICourseTestResultService;
import service.ICourseTestService;
import service.IUserService;

@Controller
@RequestMapping("course-tests")
public class UserCourseTestController {
    @Autowired
    private ICourseTestResultService courseTestResultService;
    @Autowired
    private CourseTestResultMapper courseTestResultMapper;
    @Autowired
    private IUserService userService;
    @Autowired
    private ICourseTestService courseTestService;
    @GetMapping("{courseTestId}")
    @ResponseBody
    public ApiResponse<CourseTestResultResponse> getSResult(@PathVariable int courseTestId, HttpSession session){
        ApiResponse<CourseTestResultResponse> response;
        int userId = (int)session.getAttribute("userId");
            CourseTestResult result = courseTestResultService.getResults(userId,courseTestId);
            return ApiResponse.<CourseTestResultResponse>builder()
                    .message(Message.GET_COURSETESTRESULT_SUCCESS.getMessage())
                    .data(courseTestResultMapper.toCourseTestResultResponse(result))
                    .status(ResponseStatus.GET_COURSETESTRESULT_SUCCESS.getStatus())
                    .build();


    }
    @PostMapping("{courseTestId}")
    @ResponseBody
    public ApiResponse<CourseTestResultResponse> submitCourseTest(HttpSession session, @PathVariable int courseTestId, @RequestBody String fileUrl){
        ApiResponse<CourseTestResultResponse> response;
        int userId = (int)session.getAttribute("userId");
            int mark = courseTestResultService.autoMark(fileUrl, courseTestId);
            CourseTestResult courseTestResult = courseTestResultMapper
                    .fromData(userService.getById(userId)
                    , courseTestService.getById(courseTestId),mark,fileUrl);
            CourseTestResult result = courseTestResultService.add(courseTestResult);
            return ApiResponse.<CourseTestResultResponse>builder()
                    .message(Message.GET_COURSETESTRESULT_SUCCESS.getMessage())
                    .data(courseTestResultMapper.toCourseTestResultResponse(result))
                    .status(ResponseStatus.GET_COURSETESTRESULT_SUCCESS.getStatus())
                    .build();


    }
}
