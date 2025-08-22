package service;


import entity.User;

import java.util.List;

public interface IUserService {
    public boolean isCorrectAccount(String email,String password);
    public User getByEmail(String email);
    public User add(User user);
    public User getById(int id);
    public List<User> getAll();
    public List<User> orderByName();
    public List<User> orderByCreateDate();
    public void remove(User user);
    public List<User> search(String pattern);
    public User adminLoggin(String email,String password);
    public boolean isExistEmail(String email);
}
