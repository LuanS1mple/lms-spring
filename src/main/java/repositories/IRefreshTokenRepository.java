package repositories;

import entity.RefreshToken;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface IRefreshTokenRepository extends JpaRepository<RefreshToken, Integer> {
    public RefreshToken save(RefreshToken refreshToken);
    Optional<RefreshToken> findByToken(String token);
    boolean existsByTokenAndIsUsedTrue(String token);
    boolean existsByTokenAndExpireTimeBefore(String token, LocalDateTime now);

    @Modifying
    @Transactional
    @Query("update RefreshToken r set r.isUsed = true where r.user.id = :userId")
    int markAllUsedByUserId(int userId);

}
