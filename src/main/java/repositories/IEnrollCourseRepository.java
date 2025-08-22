package repositories;


import entity.Course;
import entity.EnrollCourse;
import entity.IdClass.EnrollCourseId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
public interface IEnrollCourseRepository/* extends JpaRepository<EnrollCourse, EnrollCourseId>*/ {
//    @Query(value = "SELECT c.* FROM EnrollCourse ec JOIN Course c ON ec.courseId = c.id WHERE ec.userId = :userId", nativeQuery = true)
    List<Course> findCoursesByUserId(/*@Param("userId")*/ int userId);

    public EnrollCourse save(EnrollCourse enrollCourse);
    public boolean delete(int userId,int courseId);
}
