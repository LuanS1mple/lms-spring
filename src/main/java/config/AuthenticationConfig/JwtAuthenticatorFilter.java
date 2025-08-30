package config.AuthenticationConfig;

import entity.RefreshToken;
import entity.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
@Component
public class JwtAuthenticatorFilter extends OncePerRequestFilter {
    @Autowired
    private JwtService jwtService;
    @Autowired
    private CustomUserDetailService userDetailService;
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException
    {
        final Cookie[] cookies = request.getCookies();
        String accessToken=null;
        String refreshToken=null;
        if(cookies==null){
            filterChain.doFilter(request,response);
            return;
        }
        for (Cookie cookie : cookies){
            if(cookie.getName().equals("accessToken")){
                accessToken = cookie.getValue();
            }
            if(cookie.getName().equals("refreshToken")){
                refreshToken = cookie.getValue();
            }
        }
        if(accessToken ==null){
            filterChain.doFilter(request,response);
            return;
        }

        String email = jwtService.extractUsername(accessToken);
        if(email!=null && SecurityContextHolder.getContext().getAuthentication()==null){
            UserDetails userDetails = userDetailService.loadUserByUsername(email);
            if(jwtService.isValidAccessToken(accessToken,userDetails)){
                UsernamePasswordAuthenticationToken authen = new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
                authen.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails(request)
                );
                SecurityContextHolder.getContext().setAuthentication(authen);
            }
            else if(refreshToken!=null && jwtService.isValidRefreshToken(refreshToken)){
                RefreshToken refreshTokenEntity = jwtService.getRefreshToken(refreshToken);
                if(refreshTokenEntity.getUser().getEmail().equals(email)){
                    User user = refreshTokenEntity.getUser();
                    jwtService.killAllKindOfToken(user.getId());
                    String newToken = jwtService.generateJwt(userDetails);
                    jwtService.save(newToken, user);
                    String newRefreshToken = jwtService.generateRefreshToken(refreshTokenEntity.getUser());
                    addCookies(response, newToken,newRefreshToken);
                    UsernamePasswordAuthenticationToken authen = new UsernamePasswordAuthenticationToken(
                                userDetails,
                                null,
                                userDetails.getAuthorities()
                    );
                    authen.setDetails(
                                new WebAuthenticationDetailsSource().buildDetails(request)
                    );
                    SecurityContextHolder.getContext().setAuthentication(authen);
                }
            }
        }
        filterChain.doFilter(request,response);
    }
    public void addCookies(HttpServletResponse response, String accessToken, String refreshToken) {
        Cookie accessCookie = new Cookie("accessToken", accessToken);
        accessCookie.setHttpOnly(true);
        accessCookie.setSecure(true);
        accessCookie.setPath("/");
        accessCookie.setMaxAge(60 * 15);

        Cookie refreshCookie = new Cookie("refreshToken", refreshToken);
        refreshCookie.setHttpOnly(true);
        refreshCookie.setSecure(true);
        refreshCookie.setPath("/");
        refreshCookie.setMaxAge(60 * 60 * 24 * 7);

        response.addCookie(accessCookie);
        response.addCookie(refreshCookie);
    }

}
