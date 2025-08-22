package repositories.db;

import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.luans1mple.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import repositories.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@Repository
public class SQLUserRepository implements IUserRepository {
    private final SessionFactory sessionFactory;

    public SQLUserRepository(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public List<User> findAll() {

        try(Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM User", User.class).list();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public User findByEmail(String email) {
        String sql ="From User u where u.email= :email";
        try(Session session = sessionFactory.openSession()){
            return session.createQuery(sql, User.class)
                    .setParameter("email", email)
                    .uniqueResult();
        } catch (Exception e) {
            return  null;
        }
    }

    @Override
    public User save(User user) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            User newUser = session.merge(user);
            transaction.commit();
            return newUser;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User findById(int id) {
        String sql ="From User u where u.id =:id";
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(sql, User.class)
                    .setParameter("id",id)
                    .uniqueResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void delete(int userId) {
        Transaction transaction =null;
        String sql ="UPDATE User u set u.status = 0 where u.id =:id";
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.createQuery(sql)
                    .setParameter("id",userId)
                    .executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if(transaction !=null) transaction.rollback();
        }
    }

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(Application.class);
        SQLUserRepository dao = (SQLUserRepository) context.getBean("sQLUserRepository");
        System.out.println(dao.findAll());
    }
}
