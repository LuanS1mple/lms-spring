package mapper;


import entity.User;
import dto.request.UserRequest;
import org.springframework.stereotype.Component;

import java.sql.Date;
@Component
public class UserMapper {
    public User userRequesttoUser(UserRequest request){
        User user = new User();
        user.setId(0);
        user.setEmail(request.getEmail());
        user.setPassword(request.getPassword());
        user.setFullName(request.getFullName());
        user.setPhone(request.getPhone());
        user.setAddress(request.getAddress());
        user.setAvatarUrl(request.getAvatarUrl());
        user.setRole(request.getRole());
        user.setStatus(1);
        user.setCreatedAt(new Date(System.currentTimeMillis()));
        return user;
    }
}
