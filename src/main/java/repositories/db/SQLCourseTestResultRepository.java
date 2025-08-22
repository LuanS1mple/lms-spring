package repositories.db;


import entity.CourseTestResult;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.ICourseTestRepository;
import repositories.ICourseTestResultRepository;
import repositories.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SQLCourseTestResultRepository implements ICourseTestResultRepository {
    @Autowired
    private SessionFactory sessionFactory;
        @Override
        public CourseTestResult save(CourseTestResult result) {
            Transaction transaction =null;
            try (Session session = sessionFactory.openSession()){
                transaction = session.beginTransaction();
                session.merge(result);
                transaction.commit();
                return result;
            } catch (Exception e) {
                if(transaction!=null) transaction.rollback();
                System.out.println(e);
                return null;
            }
        }

    @Override
    public CourseTestResult getResults(int userId, int courseTestId) {
        String sql =  "From CourseTestResult ctr where ctr.user.id= :id and ctr.courseTest.id =:courseTestId";
        try(Session session=sessionFactory.openSession()) {
            return  session.createQuery(sql, CourseTestResult.class)
                    .setParameter("id", userId)
                    .setParameter("courseTestId", courseTestId)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
