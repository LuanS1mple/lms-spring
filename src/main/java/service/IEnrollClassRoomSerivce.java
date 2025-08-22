package service;


import entity.ClassRoom;
import entity.EnrollClassRoom;
import entity.User;

import java.util.List;

public interface IEnrollClassRoomSerivce {
    public List<ClassRoom> getClassesByUserId(int userId);
    public List<ClassRoom> getClassesUserAsTeacher(int userId);
    public List<ClassRoom> getClassesUserAsStudent(int userId);
    public List<User> getStudentInClass(int classId);
    public List<User> getTeacherInClass(int classId);
    public int getRoleByUserId(int userId, int classId);
    public EnrollClassRoom switchRole(int userId,int classId);
    public boolean removeMember(int userId,int classId);
    public EnrollClassRoom getEnrollClassRoom(int userId, int classId);
    public EnrollClassRoom add(EnrollClassRoom enrollClassRoom);
    public boolean join(String inviteCode,int userId);
    public boolean isEnrolled(int classRoomId, int userId);
}
