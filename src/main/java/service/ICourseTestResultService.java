package service;


import entity.CourseTestResult;

import java.util.List;

public interface ICourseTestResultService {
    public CourseTestResult add(CourseTestResult result);
    public CourseTestResult getResults(int userId, int courseTestId);
    public String getSubmitUrl();
    public void submit(int userId,int testId);
    public int autoMark(String submitUrl, int testId);
}
