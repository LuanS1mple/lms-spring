package service.impl;

import entity.Course;
import entity.EnrollCourse;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IEnrollCourseRepository;
//import repositories.db.SQLEnrollCourseRepository;
import service.ICourseService;
import service.IEnrollCourseService;
import service.IUserService;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EnrollCourseService implements IEnrollCourseService {
    @Autowired
    private IEnrollCourseRepository enrollCourseRepository;
    @Autowired
    private ICourseService courseService;
    @Autowired
    private IUserService userService;
    @Override
    public List<Course> getCoursesById(int id) {
        return Optional.ofNullable(enrollCourseRepository.findCoursesByUserId(id))
                .orElseThrow(()-> new AppException(ErrorCode.GET_COURSES_FAIL));
    }

    @Override
    public void showCourseEnrolled(int userId) {
        List<Course> courses = this.getCoursesById(userId);
        if(courses.isEmpty()){
            System.out.println("No course founded");
            return;
        }
        for (int i = 0; i < courses.size(); i++) {
            System.out.println((i+1)+". 1"+courses.get(i).toString());
        }
    }

    @Override
    public List<Course> getUnEnrollCoursesById(int id) {
        List<Course> all = courseService.getAll();
        List<Course> enrolled = this.getCoursesById(id);
        return all.stream().
                filter(course -> enrolled.stream().noneMatch(e->e.getId()== course.getId())).toList();
    }

    @Override
    public void showUnEnrollCourses(int id) {
        List<Course> courses = this.getUnEnrollCoursesById(id);
        if(courses.isEmpty()){
            System.out.println("No course founded");
            return;
        }
        for (int i = 0; i < courses.size(); i++) {
            System.out.println((i+1)+". "+courses.get(i).getTitle());
        }
    }

    @Override
    public EnrollCourse add(int userId, int coureId) throws Exception {
        EnrollCourse enrollCourse = new EnrollCourse();
        enrollCourse.setUser(userService.getById(userId));
        enrollCourse.setCourse(courseService.getActiveById(coureId));
        Date now = new Date(System.currentTimeMillis());
        enrollCourse.setEnrollAt(now);
        return Optional.ofNullable(enrollCourseRepository.save(enrollCourse))
                .orElseThrow(()-> new AppException(ErrorCode.ENROLL_FAIL));
    }

    @Override
    public List<Course> getEnrolledCourseByTitle(String title,int userId) {
        return enrollCourseRepository.findCoursesByUserId(userId).stream()
                .filter(course-> course.getTitle().toLowerCase().contains(title.toLowerCase())).toList();
    }

    @Override
    public List<Course> getUnEnrollCourseByTittle(String title,int userId) {
        return this.getUnEnrollCoursesById(userId).stream()
                .filter(couse -> couse.getTitle().toLowerCase().contains(title.toLowerCase())).toList();
    }

    @Override
    public boolean unEnroll(int userId, int courseId) {
        return enrollCourseRepository.delete(userId,courseId);
    }


}
