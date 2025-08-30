package repositories;


import entity.Course;
import entity.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
public interface ICourseRepository /*extends JpaRepository<Course, Integer> */{
    public Course save(Course course);
    public List<Course> findAll();
    public Course findById(int id);

//    @Modifying
//    @Transactional
//    @Query(value = "update Course set status ='inactive' where id = :id", nativeQuery = true)
    public void delete(/*@Param("id")*/ int courseId);

//    @Query(value = "select * from course where status ='inactive'", nativeQuery = true)
    public List<Course> inactiveCourses();
    public int countAll();
    public int countActive();
    public List<Course> findByName(String name);
}
