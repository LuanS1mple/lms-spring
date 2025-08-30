package controller.AdminController;

import constant.Message;
import constant.ResponseStatus;
import dto.request.CourseRequest;
import dto.response.CourseResponse;
import dto.response.ApiResponse;
import dto.response.DashBoardCourse;
import entity.Course;
import exception.AppException;
import exception.ErrorCode;
import jakarta.validation.Valid;
import mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import service.ICourseService;
import service.IEnrollCourseService;

import java.util.List;

@RestController
@RequestMapping("courses")
public class CourseController {
    @Autowired
    private ICourseService courseService;
    @Autowired
    private IEnrollCourseService enrollCourseService;

    @GetMapping("all")
    public ApiResponse<DashBoardCourse> getCourses(){
        List<Course> courses = courseService.getAll();
        List<CourseResponse> courseResponses = courses.stream().map(CourseMapper::fromCourse).toList();
        return ApiResponse.<DashBoardCourse>builder()
                .message(Message.GET_COURSES_SUCCESS.getMessage())
                .status((ResponseStatus.SUCCESS.getStatus()))
                .data(DashBoardCourse.builder()
                        .activeCourse(courseService.countActive())
                        .totalCourse(courseService.countAll())
                        .totalEnroll(enrollCourseService.count())
                        .courses(courseResponses)
                        .build())
                .build();
    }
    @PostMapping("add")
    public ApiResponse<CourseResponse> getCourses(@Valid @RequestBody CourseRequest request, BindingResult bindingResult){
        ApiResponse<CourseResponse> response;
        if(bindingResult.hasErrors()){
            throw new AppException(ErrorCode.INVALID_INPUT);
        }
        else{
            Course course = CourseMapper.fromCourseRequesst(request);
            course= courseService.addCourse(course);
            response = ApiResponse.<CourseResponse>builder()
                    .status(ResponseStatus.CREATED_COURSE_SUCCESS.getStatus())
                    .message(Message.CREATED_COURSE_SUCCESS.getMessage())
                    .data(CourseMapper.fromCourse(course))
                    .build();
        }
        return  response;
    }
    @PutMapping("{id}")
    public ApiResponse<CourseResponse> updateCourse(@PathVariable int id,
                                                    @Valid @RequestBody CourseRequest request,
                                                    BindingResult bindingResult) throws Exception {
        ApiResponse<CourseResponse> response;
        if(bindingResult.hasErrors()){
            throw new AppException(ErrorCode.INVALID_INPUT);
        }
        else{
            Course oldCourse = courseService.getById(id);
            Course newCourse = CourseMapper.fromCourseRequesst(request);
            CourseMapper.mapCourse(newCourse,oldCourse);
            courseService.update(oldCourse);
            response = ApiResponse.<CourseResponse>builder()
                    .status(ResponseStatus.UPDATE_COURSE_SUCCESS.getStatus())
                    .message(Message.UPDATE_COURSE_SUCCESS.getMessage())
                    .data(CourseMapper.fromCourse(oldCourse))
                    .build();
        }
        return response;
    }
    @DeleteMapping("{id}")
    public ApiResponse<CourseResponse> delete(@PathVariable int id) throws Exception {
            Course course = courseService.getById(id);
            courseService.remove(course);
            return ApiResponse.<CourseResponse>builder()
                    .message(Message.DELETE_COURSE_SUCCESS.getMessage())
                    .status(ResponseStatus.DELETE_COURSE_SUCCESS.getStatus())
                    .data(CourseMapper.fromCourse(course))
                    .build();
    }
    @GetMapping("all/search")
    public ApiResponse<DashBoardCourse> getCoursesBySearch(@RequestParam String name){
        List<Course> courses = courseService.findByName(name);
        List<CourseResponse> courseResponses = courses.stream().map(CourseMapper::fromCourse).toList();
        return ApiResponse.<DashBoardCourse>builder()
                .message(Message.GET_COURSES_SUCCESS.getMessage())
                .status((ResponseStatus.SUCCESS.getStatus()))
                .data(DashBoardCourse.builder()
                        .activeCourse(courseService.countActive())
                        .totalCourse(courseService.countAll())
                        .totalEnroll(enrollCourseService.count())
                        .courses(courseResponses)
                        .build())
                .build();
    }
}
