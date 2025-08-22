package service.impl;

import entity.User;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IUserRepository;
//import repositories.db.SQLUserRepository;
import service.IUserService;

import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class UserService implements IUserService {
    @Autowired
    private IUserRepository userRepository;
    @Override
    public boolean isCorrectAccount(String email, String password) {
        User user = getByEmail(email);
        if(user==null) return false;
        return password.equals(user.getPassword()) && user.getStatus()==1;
    }

    @Override
    public User getByEmail(String email) {
        return Optional.ofNullable(userRepository.findByEmail(email))
                .orElseThrow(() -> new AppException(ErrorCode.GET_USERS_FAIL));
    }

    @Override
    public User add(User user) {
        return Optional.ofNullable(userRepository.save(user))
                .orElseThrow(() -> new AppException(ErrorCode.CREATED_USER_FAIL));
    }

    @Override
    public User getById(int id) {
        return Optional.ofNullable(userRepository.findById(id))
                .orElseThrow(() -> new AppException(ErrorCode.GET_USERS_FAIL));
    }

    @Override
    public List<User> getAll() {
        return Optional.ofNullable(userRepository.findAll())
                .orElseThrow(() -> new AppException(ErrorCode.GET_USERS_FAIL))
                .stream()
                .filter(user -> user.getStatus()==1).toList();
    }

    @Override
    public List<User> orderByName() {
        return userRepository.findAll().stream()
                .sorted(Comparator.comparing(User::getFullName))
                .filter(user -> user.getStatus()==1).toList();
    }

    @Override
    public List<User> orderByCreateDate() {
        return userRepository.findAll().stream()
                .sorted(Comparator.comparing(User::getCreatedAt))
                .filter(user -> user.getStatus()==1).toList();
    }

    @Override
    public void remove(User user) {
        userRepository.delete(user.getId());
    }

    @Override
    public List<User> search(String pattern) {
        return getAll().stream()
                .filter(user -> user.getEmail().toLowerCase().contains(pattern.toLowerCase().trim())||
                        user.getFullName().toLowerCase().contains(pattern.toLowerCase().trim())).toList();
    }

    @Override
    public User adminLoggin(String email, String password) {
        try{
            return userRepository.findAll().stream()
                    .filter(user -> user.getEmail().equals(email) && user.getPassword().equals(password) && user.getRole()==2).findFirst().get();
        }
        catch (NoSuchElementException e){
            return  null;
        }
    }

    @Override
    public boolean isExistEmail(String email) {
        try {
            userRepository.findAll().stream()
                    .filter(user -> user.getEmail().toLowerCase().equals(email.toLowerCase())).findFirst()
                    .orElseThrow(()-> new AppException(ErrorCode.GET_USERS_FAIL));
            return true;
        }
        catch (Exception e){
            return false;
        }
    }

}
