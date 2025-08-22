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
        String sql = "insert into EnrollCourse (userId, courseId, enrollAt) values (?, ?, ?)";

        try (Connection connection = DbFacade.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, enrollCourse.getUser().getId());
            ps.setInt(2, enrollCourse.getCourse().getId());
            ps.setTimestamp(3, new Timestamp(enrollCourse.getEnrollAt().getTime()));

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
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


}
