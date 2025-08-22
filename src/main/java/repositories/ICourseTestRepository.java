package repositories;


import entity.CourseTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
public interface ICourseTestRepository /*extends JpaRepository<CourseTest, Integer> */{
//    @Query(value = "select * from CourseTest where courseId = :courseId", nativeQuery = true)
    public List<CourseTest> getByCourseId(@Param("courseId") int courseId);

    public CourseTest findById(int id);
    public CourseTest save(CourseTest courseTest);
    public long count();
}
