package repositories.db;

import entity.CourseTest;
import jakarta.transaction.Transactional;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.ICourseRepository;
import repositories.ICourseTestRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SQLCourseTestRepository implements ICourseTestRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<CourseTest> getByCourseId(int courseId) {
        try (Session session =sessionFactory.openSession()){
            return session.createQuery("from CourseTest ct where ct.course.id= :id", CourseTest.class)
                    .setParameter("id",courseId)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public CourseTest findById(int id) {
        try (Session session =sessionFactory.openSession()){
            return session.createQuery("from CourseTest ct where ct.id= :id", CourseTest.class)
                    .setParameter("id",id)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Transactional
    @Override
    public CourseTest save(CourseTest courseTest) {
        Transaction transaction =  null;
        try (Session session =sessionFactory.openSession()){
            transaction = session.beginTransaction();
            session.persist(courseTest);
            transaction.commit();
            return courseTest;
        } catch (Exception e) {
            if(transaction!=null) transaction.rollback();
            System.out.println(e);
            return null;
        }
    }

    @Override
    public long count() {
        try (Session session =sessionFactory.openSession()){
            return session.createQuery("select count(ct) from CourseTest ct", Long.class)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return -1;
        }
    }


}
