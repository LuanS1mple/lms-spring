package repositories.db;


import entity.Assignment;
import entity.AssignmentResult;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.IAssignmentRepository;
import repositories.IAssignmentResultRepository;
import repositories.IClassRoomRepository;
import repositories.IUserRepository;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Repository
public class SQLAssignmentResultRepository implements IAssignmentResultRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<AssignmentResult> getByAssignment(int assignmentId) {
        try (Session session=sessionFactory.openSession()){
            return session.createQuery("From AssignmentResult ar where ar.assignment.id=:assignmentId",AssignmentResult.class)
                    .setParameter("assignmentId",assignmentId)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return new ArrayList<>();
        }
    }

    @Override
    public AssignmentResult mark(int score, String comment, AssignmentResult assignmentResult) {
        assignmentResult.setMark(score);
        assignmentResult.setComment(comment);
        Transaction transaction =null;
        try (Session session=sessionFactory.openSession()){
            transaction = session.beginTransaction();
            AssignmentResult assignmentResult1 = session.merge(assignmentResult);
            transaction.commit();
            return assignmentResult1;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }

    @Override
    public AssignmentResult save(AssignmentResult assignmentResult) {
        Transaction transaction =null;
        try (Session session=sessionFactory.openSession()){
            transaction = session.beginTransaction();
            AssignmentResult result = session.merge(assignmentResult);
            transaction.commit();
            return result;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }

    @Override
    public long count() {
        try (Session session=sessionFactory.openSession()){
            return session.createQuery("select count(ar) From AssignmentResult ar", Long.class)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return -1;
        }
    }


}
