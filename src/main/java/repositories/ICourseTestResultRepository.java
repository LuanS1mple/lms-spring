package repositories;


import entity.CourseTestResult;
import entity.IdClass.CourseTestResultId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository
public interface ICourseTestResultRepository /*extends JpaRepository<CourseTestResult, CourseTestResultId> */{
    public CourseTestResult save(CourseTestResult result);

//    @Query(value = "select * from CourseTestResult where userId = :userId and courseTestId = :courseTestId", nativeQuery = true)
    public CourseTestResult getResults(/*@Param("userId") */int userId,/*@Param("courseTestId")*/ int courseTestId);
}
