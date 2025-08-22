package repositories;


import entity.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository
public interface IUserRepository /*extends JpaRepository<User, Integer> */{
    public List<User> findAll();
    public User findByEmail(String email);
    public User save(User user);
    public User findById(int id);
//
//    @Modifying
//    @Transactional
//    @Query(value = "update [user] set status =0 where id = :id", nativeQuery = true)
    public void delete(/*@Param("id") */int userId);
}
