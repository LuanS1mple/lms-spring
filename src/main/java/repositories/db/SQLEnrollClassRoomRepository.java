package repositories.db;


import entity.ClassRoom;
import entity.EnrollClassRoom;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.IClassRoomRepository;
import repositories.IEnrollClassRoomRepository;
import repositories.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SQLEnrollClassRoomRepository implements IEnrollClassRoomRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<ClassRoom> getClassesByUser_Id(int userId) {
        try(Session session = sessionFactory.openSession()){
            return session.createQuery("select ecr.classRoom from EnrollClassRoom ecr where ecr.user.id=:userId", ClassRoom.class)
                    .setParameter("userId", userId)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public List<EnrollClassRoom> findByUser_Id(int userId) {
        try{
            try (Session session=sessionFactory.openSession()){
                return session.createQuery("From EnrollClassRoom ecr where ecr.user.id=:userId", EnrollClassRoom.class)
                        .setParameter("userId",userId)
                        .list();
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public List<EnrollClassRoom> findByClass_Id(int classId) {
        try{
            try (Session session=sessionFactory.openSession()){
                return session.createQuery("From EnrollClassRoom ecr where ecr.classRoom.id=:classId", EnrollClassRoom.class)
                        .setParameter("classId",classId)
                        .list();
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public boolean delete(int userId,int classRoomId) {
        Transaction transaction=null;
        try(Session session=sessionFactory.openSession()){
            transaction = session.beginTransaction();
            session.createQuery("delete from EnrollClassRoom ecr where ecr.user.id=:userId and ecr.classRoom.id=:classRoomId")
                    .setParameter("userId",userId)
                    .setParameter("classRoomId",classRoomId)
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
    public EnrollClassRoom save(EnrollClassRoom enrollClassRoom) {
        Transaction transaction=null;
        try(Session session=sessionFactory.openSession()){
            transaction = session.beginTransaction();
            EnrollClassRoom newEnrollClassRoom = session.merge(enrollClassRoom);
            transaction.commit();
            return enrollClassRoom;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }


}
