package config.AuthenticationConfig;


import constant.UserRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.IOException;

@Configuration
@EnableWebSecurity
public class AuthenticationConfig {
    private static final String[]  WHITE_LIST_URL= {"/jwt","/jwt/**","/login/**"};
    private static final String[] ADMIN_ONLY_URL = {
            "/admin-cm",
            "/users/*",
            "/courses/add",
            "/courses/*/course-content",
            "/courses/*/course-test",
            "new-course-test"
    };

    private static final String[] USER_ONLY_URL = {
            "/assignment/result",
            "/assignment/submit",
            "/assignment/add",
            "/assignment/submissions",
            "/assignment/grade",
            "/class-room",
            "/class-room/*",
            "/class-room/join/*",
            "/role/change",
            "/courses/un-enroll",
            "/courses/enroll",
            "/course-tests/*"
    };

    private static final String[] COMMON_URL = {
            "/courses/all",
            "/courses/*",
            "/courses",
            "/courses/detail"
    };


    @Autowired
    private JwtAuthenticatorFilter jwtAuthenticatorFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
//                .formLogin(Customizer.withDefaults())
                .formLogin(form ->
                        form.loginPage("/login")
//                                .defaultSuccessUrl("/login/authenticate")
                                .successHandler(authenticationSuccessHandler())
                                .permitAll()
                )
                .exceptionHandling(ex ->ex.accessDeniedPage("/redirect/access-denied"))
                .authorizeHttpRequests(req ->
                        req/*.requestMatchers(WHITE_LIST_URL).permitAll()*/
                                .requestMatchers("/css/**", "/js/**", "/images/**").permitAll()
                                .requestMatchers(COMMON_URL).hasAnyRole(UserRole.USER.getName(),UserRole.ADMIN.getName())
                                .requestMatchers(ADMIN_ONLY_URL).hasRole(UserRole.ADMIN.getName())
                                .requestMatchers(USER_ONLY_URL).hasRole(UserRole.USER.getName())
                                .anyRequest().authenticated())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
                    .addFilterBefore(jwtAuthenticatorFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler(){
        return new AuthenticationSuccessHandler(){
            @Override
            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                response.sendRedirect("/lms/login/authenticate");
            }
        };
    }
}
