package repositories;


import entity.CourseContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
public interface ICourseContentRepository /*extends JpaRepository<CourseContent, Integer> */{

//    @Query(value = "select * from CourseContent where courseId = :courseId", nativeQuery = true)
    public List<CourseContent> getByCourseId(/*@Param("courseId")*/ int courseId);

    public long count();
    public CourseContent save(CourseContent courseContent);
}
