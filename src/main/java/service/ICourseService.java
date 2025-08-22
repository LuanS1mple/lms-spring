package service;


import entity.Course;

import java.util.List;

public interface ICourseService {
    public Course addCourse(Course course);
    public List<Course> getAll();
    public Course getInputCourse();
    public void showCourses();
    public Course getById(int id) throws Exception;
    public Course getActiveById(int id) throws Exception;
    public Course update(Course course);
    public void remove(Course course);
    public List<Course> inactiveCourses();
}
