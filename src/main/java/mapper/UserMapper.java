package mapper;


import dto.request.UserUpdateRequest;
import entity.User;
import dto.request.UserRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.sql.Date;
@Component
public class UserMapper {
    @Autowired
    PasswordEncoder passwordEncoder;
    public User userRequesttoUser(UserRequest request){
        User user = new User();
        user.setId(0);
        user.setEmail(request.getEmail());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setFullName(request.getFullName());
        user.setPhone(request.getPhone());
        user.setAddress(request.getAddress());
        user.setAvatarUrl(request.getAvatarUrl());
        user.setRole(request.getRole());
        user.setStatus(1);
        user.setCreatedAt(new Date(System.currentTimeMillis()));
        return user;
    }
    public User updateFromRequest(UserUpdateRequest request, User user, boolean isChangePassword){
        user.setEmail(request.getEmail());
        if(isChangePassword){
            user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        }
        user.setFullName(request.getFullName());
        user.setPhone(request.getPhone());
        user.setAddress(request.getAddress());
        user.setAvatarUrl(request.getAvatarUrl().getOriginalFilename());
        return user;
    }
}
