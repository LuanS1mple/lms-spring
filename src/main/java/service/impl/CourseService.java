package service.impl;

import exception.AppException;
import exception.ErrorCode;
import mapper.CourseMapper;
import entity.Course;
import dto.request.CourseRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.ICourseRepository;
//import repositories.db.SQLCourseRepository;
import service.ICourseService;

import java.util.List;
import java.util.Optional;
import java.util.Scanner;

@Service
public class CourseService implements ICourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private ICourseRepository courseRepository;


    @Override
    public Course addCourse(Course course) {
        return Optional.ofNullable(courseRepository.save(course))
                .orElseThrow(()-> new AppException(ErrorCode.CREATED_COURSE_FAIL));
    }

    @Override
    public List<Course> getAll() {
        return Optional.ofNullable(courseRepository.findAll())
                .orElseThrow(() -> new AppException(ErrorCode.GET_COURSES_FAIL))
                .stream()
                .filter(course -> course.getStatus().equals("active")).toList();
    }

    @Override
    public Course getInputCourse() {
        CourseRequest course = new CourseRequest();
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhập tiêu đề khóa học: ");
        String title = sc.nextLine();
        course.setTitle(title);
        System.out.print("Nhập mô tả khóa học: ");
        String des = sc.nextLine();
        course.setDescription(des);
        System.out.print("Nhập danh mục khóa học: ");
        String category = sc.nextLine();
        course.setCategory(category);
        System.out.print("Nhập cấp độ khóa học: ");
        String level = sc.nextLine();
        course.setLevel(level);
        System.out.print("Nhập thời lượng khóa học: ");
        int duration = Integer.parseInt(sc.nextLine());
        course.setDuration(duration);
        System.out.print("Nhập tác giả: ");
        String author = sc.nextLine().trim();
        course.setAuthor(author);
        return courseMapper.fromCourseRequesst(course);
    }

    @Override
    public void showCourses() {
        List<Course> courses = this.getAll();
        if(courses.isEmpty()){
            System.out.println("No course founded");
            return;
        }
        for (int i = 0; i < courses.size(); i++) {
            System.out.println(courses.get(i).toString());
        }
    }

    @Override
    public Course getById(int id) throws Exception {
        return Optional.ofNullable(courseRepository.findById(id))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSES_FAIL));
    }

    @Override
    public Course getActiveById(int id) throws Exception {
        Course course=  Optional.ofNullable(courseRepository.findById(id))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSES_FAIL));
        if(course!=null && course.getStatus().equals("active")){
            return course;
        }
        else{
            return null;
        }
    }

    @Override
    public Course update(Course course) {
        return Optional.ofNullable(courseRepository.save(course))
                .orElseThrow(()-> new AppException(ErrorCode.UPDATE_COURSE_FAIL));
    }

    @Override
    public void remove(Course course) {
        courseRepository.delete(course.getId());
    }

    @Override
    public List<Course> inactiveCourses() {
        return courseRepository.inactiveCourses();
    }
}
