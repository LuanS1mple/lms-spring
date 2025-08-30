package service;


import entity.Course;
import entity.EnrollCourse;

import java.util.List;

public interface IEnrollCourseService {
    public List<Course> getCoursesById(int id);
    public void showCourseEnrolled(int userId);
    public List<Course> getUnEnrollCoursesById(int id);
    public void showUnEnrollCourses(int id);
    public EnrollCourse add(int userId, int coureId) throws Exception;
    public List<Course> getEnrolledCourseByTitle(String title,int userId);
    public List<Course> getUnEnrollCourseByTittle(String title, int userId);
    public boolean unEnroll(int userId,int courseId);
    public int count();

}
