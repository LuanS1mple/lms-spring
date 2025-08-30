package repositories.db;



import entity.Course;
import entity.EnrollCourse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.IEnrollCourseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SQLEnrollCourseRepository implements IEnrollCourseRepository {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Course> findCoursesByUserId(int id) {
        String sql = "Select e.course FROM EnrollCourse e where e.user.id= :id";
        try (Session session = sessionFactory.openSession()){
            return session.createQuery(sql, Course.class)
                    .setParameter("id",id)
                    .list();
        }
        catch (Exception e){
            System.out.println(e);
            return null;
        }
//        String sql = "select c.* from EnrollCourse ec join Course c on ec.courseId = c.id where ec.userId = ?";
//        List<Course> courses = new ArrayList<>();
//
//        try (Connection connection = DbFacade.getConnection()){
//             PreparedStatement ps = connection.prepareStatement(sql);
//
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                Course course = new Course();
//                course.setId(rs.getInt("id"));
//                course.setTitle(rs.getString("title"));
//                course.setDescription(rs.getString("description"));
//                course.setCategory(rs.getString("category"));
//                course.setLevel(rs.getString("level"));
//                course.setDuration(rs.getInt("duration"));
//                course.setStatus(rs.getString("status"));
//                course.setAuthor(rs.getString("author"));
//                course.setCreatedAt(rs.getTimestamp("createdAt"));
//                course.setUpdatedAt(rs.getTimestamp("updatedAt"));
//                courses.add(course);
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        return courses;
    }

    @Override
    public EnrollCourse save(EnrollCourse enrollCourse) {
        Transaction transaction=null;
        try (Session session=sessionFactory.openSession()){
            transaction=session.beginTransaction();
            EnrollCourse rs =session.merge(enrollCourse);
            transaction.commit();
            return rs;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }

    @Override
    public boolean delete(int userId, int courseId) {
        Transaction transaction=null;
        try (Session session=sessionFactory.openSession()){
            transaction=session.beginTransaction();
            session.createQuery("delete from EnrollCourse ce where ce.user.id=:userId and ce.course.id=:courseId")
                    .setParameter("userId",userId)
                    .setParameter("courseId", courseId)
                    .executeUpdate();
            transaction.commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return false;
        }
    }

    @Override
    public int count() {
        String sql = "Select count(*) from EnrollCourse";
        try (Session session = sessionFactory.openSession()){
            Long rs = session.createQuery(sql, Long.class)
                    .getSingleResult();
            return rs.intValue();
        }
        catch (Exception e){
           return -1;
        }
    }


}
