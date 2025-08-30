package repositories;

import entity.Token;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ITokenRepository extends JpaRepository<Token, Integer> {
    public Token findByToken(String token);
    public Token save(Token token);

    @Modifying
    @Transactional
    @Query("update Token t set t.isUsed = true where t.token = :token")
    int markAsUsedByToken(String token);

    @Modifying
    @Transactional
    @Query("update Token t set t.isUsed = true where t.user.id = :userId")
    int markAllAsUsedByUserId(int userId);

}
