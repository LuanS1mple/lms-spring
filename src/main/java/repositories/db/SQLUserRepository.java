package repositories.db;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import repositories.IUserRepository;

import java.util.List;

@Repository
@Transactional
public class SQLUserRepository implements IUserRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<User> findAll() {
        return entityManager.createQuery("FROM User", User.class)
                .getResultList();
    }

    @Override
    public User findByEmail(String email) {
        String sql = "FROM User u WHERE u.email = :email";
        return entityManager.createQuery(sql, User.class)
                .setParameter("email", email)
                .getResultStream()
                .findFirst()
                .orElse(null);
    }

    @Override
    public User save(User user) {
        // merge vừa insert vừa update
        return entityManager.merge(user);
    }

    @Override
    public User findById(int id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public void delete(int userId) {
        String jpql = "UPDATE User u SET u.status = 0 WHERE u.id = :id";
        entityManager.createQuery(jpql)
                .setParameter("id", userId)
                .executeUpdate();
    }

    @Override
    public int countAll() {
        Long rs = entityManager.createQuery("select count(*) from User",Long.class)
                .getSingleResult();
        return rs.intValue();
    }

    @Override
    public int countAdmin() {
        Long rs = entityManager.createQuery("select count(*) from User u where u.role=1",Long.class)
                .getSingleResult();
        return rs.intValue();
    }

    @Override
    public int countActive() {
        Long rs = entityManager.createQuery("select count(*) from User u where u.status=1 and u.role=2",Long.class)
                .getSingleResult();
        return rs.intValue();
    }

    @Override
    public List<User> findByRoleAndName(int role, String name) {
        String sql = "FROM User u WHERE u.fullName like :name";
        if(role!=-1){
            sql += " and u.role= "+role;
        }
        return entityManager.createQuery(sql, User.class)
                .setParameter("name", "%"+name+"%")
                .getResultList();
    }
}
