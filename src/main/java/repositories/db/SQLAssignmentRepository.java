package repositories.db;


import entity.Assignment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.IAssignmentRepository;

import java.util.List;
@Repository
public class SQLAssignmentRepository implements IAssignmentRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Assignment> getAssignmentByClass(int classId) {
        try (Session session= sessionFactory.openSession()){
            return session.createQuery("From Assignment a where a.classRoom.id=:classId", Assignment.class)
                    .setParameter("classId",classId)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public long count() {
        try (Session session= sessionFactory.openSession()){
            return session.createQuery("select count(a) From Assignment a", Long.class)
                    .getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return -1;
        }
    }

    @Override
    public Assignment save(Assignment assignment) {
        Transaction transaction =null;
        try (Session session = sessionFactory.openSession()){
            transaction = session.beginTransaction();
            Assignment newAssignment = session.merge(assignment);
            transaction.commit();
            return newAssignment;
        }
        catch (Exception e){
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }

    @Override
    public Assignment getById(int assignmentId) {
        try (Session session= sessionFactory.openSession()){
            return session.createQuery("From Assignment a where a.id=:assignmentId", Assignment.class)
                    .setParameter("assignmentId",assignmentId)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
