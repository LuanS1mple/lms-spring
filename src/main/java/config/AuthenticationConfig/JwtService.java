package config.AuthenticationConfig;

import config.AppEnvironment;
import entity.RefreshToken;
import entity.Token;
import entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import jakarta.annotation.PostConstruct;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import repositories.IRefreshTokenRepository;
import repositories.ITokenRepository;

import java.security.Key;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Optional;
import java.util.UUID;
import java.util.function.Function;
@Service
@Setter
public class JwtService {

    private final AppEnvironment environment;
    private String secretKey;
    private long jwtExpiration;
    private long refreshExpiration;
    private ITokenRepository tokenRepository;
    private IRefreshTokenRepository refreshTokenRepository;

    @Autowired
    public JwtService(AppEnvironment environment, IRefreshTokenRepository refreshTokenRepository,ITokenRepository tokenRepository) {
        this.refreshTokenRepository= refreshTokenRepository;
        this.tokenRepository = tokenRepository;
        this.environment = environment;
    }

    @PostConstruct
    public void init() {
        this.secretKey = environment.SIGNER_KEY;
        this.jwtExpiration = environment.JWT_VALID_DURATION_AT;
        this.refreshExpiration = environment.JWT_VALID_DURATION_RT;
    }
    public String generateJwt(UserDetails userDetails){
        HashMap<String, Object> extraClaims = new HashMap<>();
        return Jwts.builder()
                .setClaims(extraClaims)
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + jwtExpiration*1000))
                .signWith(getSignInkey(), SignatureAlgorithm.HS256)
                .compact();
    }
    public String extractUsername(String token) {
        try {
            return extractClaims(token, Claims::getSubject);
        } catch (ExpiredJwtException ex) {
            return ex.getClaims().getSubject();
        }
    }

    public Date extractExpireTime(String token) {
        try {
            return extractClaims(token, Claims::getExpiration);
        } catch (ExpiredJwtException ex) {
            return ex.getClaims().getExpiration();
        }
    }
    public <T> T extractClaims(String token, Function<Claims,T> claimsResolver){
        Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }
    public Claims extractAllClaims(String token){
        return Jwts
                .parserBuilder()
                .setSigningKey(getSignInkey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
    public Key getSignInkey(){
        byte[] keyBytes = Decoders.BASE64.decode(secretKey);
        return Keys.hmacShaKeyFor(keyBytes);
    }
    public boolean isExpiredToken(String token){
        return extractExpireTime(token).before(new Date());
    }
    public boolean isValidAccessToken(String token, UserDetails userDetails){
        String email = extractUsername(token);
        return email.equals(userDetails.getUsername()) && !isExpiredToken(token);
    }
    public boolean isValidRefreshToken(String refreshToken){
        Optional<RefreshToken> tokenEntity = refreshTokenRepository.findByToken(refreshToken);
        if(tokenEntity == null){
            return false;
        }
        else{
            return !tokenEntity.get().isUsed();
        }
    }
    public RefreshToken getRefreshToken(String token){
        return refreshTokenRepository.findByToken(token).get();
    }
    public String generateRefreshToken(User user){
        RefreshToken refreshToken = new RefreshToken();
        refreshToken.setToken(UUID.randomUUID().toString());
        refreshToken.setExpireTime(LocalDateTime.now().plusDays(refreshExpiration));
        refreshToken.setUsed(false);
        refreshToken.setUser(user);
        return refreshTokenRepository.save(refreshToken).getToken();
    }
    public void killAllRefreshToken(int userId){
        refreshTokenRepository.markAllUsedByUserId(userId);
    }
    public void killAllToken(int userId){
        tokenRepository.markAllAsUsedByUserId(userId);
    }
    public Token save(String token, User user){
            Token newToken = new Token();
            newToken.setToken(token);
            newToken.setUsed(false);
            newToken.setExpired(false);
            newToken.setUser(user);
            return tokenRepository.save(newToken);
    }
    public void killAllKindOfToken(int userId){
        killAllToken(userId);
        killAllRefreshToken(userId);
    }
}
