package service;


import entity.CourseContent;

import java.util.List;

public interface ICourseContentService {
    public List<CourseContent> getByCourseId(int courseId);
    public void downLoadCourseContent(CourseContent courseContent);
    public List<CourseContent> getByTittle(String tittle,int courseid);
    public String getContentUrl();
    public CourseContent add(CourseContent courseContent);
    public int size();
}
