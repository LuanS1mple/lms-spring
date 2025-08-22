package repositories.db;


import entity.CourseContent;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.ICourseContentRepository;
import repositories.ICourseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@Repository
public class SQLCourseContentRepository implements ICourseContentRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<CourseContent> getByCourseId(int courseId) {
        try(Session session = sessionFactory.openSession()) {
            return session.createQuery("from CourseContent c where c.course.id =:id", CourseContent.class)
                    .setParameter("id", courseId)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public long count() {
        try (Session session =sessionFactory.openSession()){
            return session.createQuery("select count(ct) from CourseContent ct", Long.class)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return -1;
        }
    }

    @Override
    public CourseContent save(CourseContent courseContent) {
        Transaction transaction=null;
        try (Session session =sessionFactory.openSession()){
            transaction = session.beginTransaction();
            CourseContent newCourseContent = session.merge(courseContent);
            transaction.commit();
            return newCourseContent;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }


}
