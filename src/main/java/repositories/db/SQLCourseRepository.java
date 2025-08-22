package repositories.db;

import entity.Course;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.ICourseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@Repository
public class SQLCourseRepository implements ICourseRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public Course save(Course course) {
        Transaction transaction = null;
        try(Session session = sessionFactory.openSession()){
            transaction = session.beginTransaction();
            Course newCourse = session.merge(course);
            transaction.commit();
            return newCourse;
        }
        catch (Exception e){
            if(transaction !=null) transaction.rollback();
            return null;
        }
    }

    @Override
    public List<Course> findAll() {
        String sql = "FROM Course";
        try (Session session = sessionFactory.openSession()){
            return session.createQuery(sql, Course.class)
                    .list();
        }
        catch (Exception e){
            return null;
        }
    }

    @Override
    public Course findById(int id) {
        String sql = "From Course c where c.id =:id";
        try (Session session = sessionFactory.openSession()){
            return session.createQuery(sql, Course.class)
                    .setParameter("id",id)
                    .uniqueResult();
        }
        catch (Exception e){
            return null;
        }
    }

//    @Override
//    public void update(Course course) {
//        String sql = "update [Course] set title = ?, description = ?, category = ?, level = ?, duration = ?, status = ?, author = ?, createdAt = ?, updatedAt = ? where id = ?";
//
//        try (Connection connection = DbFacade.getConnection()){
//             PreparedStatement ps = connection.prepareStatement(sql);
//
//            ps.setString(1, course.getTitle());
//            ps.setString(2, course.getDescription());
//            ps.setString(3, course.getCategory());
//            ps.setString(4, course.getLevel());
//            ps.setInt(5, course.getDuration());
//            ps.setString(6, course.getStatus());
//            ps.setString(7, course.getAuthor());
//            ps.setTimestamp(8, new Timestamp(course.getCreatedAt().getTime()));
//            ps.setTimestamp(9, new Timestamp(course.getUpdatedAt().getTime()));
//            ps.setInt(10, course.getId());
//
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }

    @Override
    public void delete(int courseId) {
        String sql = "update Course c set c.status = 'inactive' where c.id = :id";
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()){
            transaction = session.beginTransaction();
            session.createQuery(sql)
                    .setParameter("id",courseId)
                    .executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if(transaction!=null) transaction.rollback();
            System.out.println(e);
        }
    }

    @Override
    public List<Course> inactiveCourses() {
        String sql = " from Course c where c.status ='inactive'";
        try(Session session = sessionFactory.openSession()){
            return session.createQuery(sql, Course.class).list();
        }
        catch (Exception e){
            return null;
        }
    }


}
