package service;


import entity.CourseTest;
import entity.CourseTestResult;

import java.util.List;

public interface ICourseTestService {
        public List<CourseTest> getByCourseId(int courseId);
        public void downLoadCourseTest(CourseTest test);
        public List<CourseTest> getByTittle(String pattern, int courseId);
        public CourseTest add(CourseTest test);
        public int size();
        public String getCourseTestUrl();
        public CourseTest getById(int id);
        public void delete(int courseTestId);
}
