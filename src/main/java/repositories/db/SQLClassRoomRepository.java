package repositories.db;


import entity.ClassRoom;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repositories.IClassRoomRepository;

import java.sql.ResultSet;
import java.util.List;

@Repository
public class SQLClassRoomRepository implements IClassRoomRepository {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<ClassRoom> findAll() {
        try (Session session=sessionFactory.openSession()){
            return session.createQuery("From ClassRoom", ClassRoom.class)
                    .list();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public ClassRoom save(ClassRoom c) {
        Transaction transaction= null;
        try (Session session=sessionFactory.openSession()){
            transaction = session.beginTransaction();
            ClassRoom newClassRoom = session.merge(c);
            transaction.commit();
            return newClassRoom;
        } catch (Exception e) {
            System.out.println(e);
            if(transaction!=null) transaction.rollback();
            return null;
        }
    }


    @Override
    public ClassRoom getByInviteCode(String inviteCode) {
        try (Session session=sessionFactory.openSession()){
            return session.createQuery("From ClassRoom cr where cr.inviteCode=:inviteCode", ClassRoom.class)
                    .setParameter("inviteCode",inviteCode)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public ClassRoom getById(int classId) {
        try (Session session=sessionFactory.openSession()){
            return session.createQuery("From ClassRoom cr where cr.id=:id", ClassRoom.class)
                    .setParameter("id",classId)
                    .uniqueResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
