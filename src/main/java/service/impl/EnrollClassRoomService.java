package service.impl;

import constant.ClassRole;
import entity.ClassRoom;
import entity.EnrollClassRoom;
import entity.User;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IClassRoomRepository;
import repositories.IEnrollClassRoomRepository;
import repositories.IUserRepository;
//import repositories.db.SQLClassRoomRepository;
//import repositories.db.SQLEnrollClassRoomRepository;
//import repositories.db.SQLUserRepository;
import service.IEnrollClassRoomSerivce;

import java.sql.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class EnrollClassRoomService implements IEnrollClassRoomSerivce {
    @Autowired
    private IEnrollClassRoomRepository enrollClassRoomRepository;
    @Autowired
    private IClassRoomRepository classRoomRepository;
    @Autowired
    private IUserRepository userRepository;
    private static final int TEACHER_ROLEID = ClassRole.TEACHER_ROLE.getCode();
    private static final int STUDENT_ROLEID= ClassRole.STUDENT_ROLE.getCode();

    public static int getTEACHER_ROLEID() {
        return TEACHER_ROLEID;
    }

    public static int getSTUDENT_ROLEID() {
        return STUDENT_ROLEID;
    }

    @Override
    public List<ClassRoom> getClassesByUserId(int userId) {
        return Optional.ofNullable(enrollClassRoomRepository.getClassesByUser_Id(userId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_CLASSOVERVIEW_FAIL));
    }

    @Override
    public List<ClassRoom> getClassesUserAsTeacher(int userId) {
        return enrollClassRoomRepository.findByUser_Id(userId).stream()
                .filter(enrollClassRoom -> enrollClassRoom.getRole()==TEACHER_ROLEID)
                .map(enrollClassRoom -> enrollClassRoom.getClassRoom())
                .toList();
    }

    @Override
    public List<ClassRoom> getClassesUserAsStudent(int userId) {
        return enrollClassRoomRepository.findByUser_Id(userId).stream()
                .filter(enrollClassRoom -> enrollClassRoom.getRole()==STUDENT_ROLEID)
                .map(enrollClassRoom -> enrollClassRoom.getClassRoom())
                .toList();
    }

    @Override
    public List<User> getStudentInClass(int classId) {
        return  Optional.ofNullable(enrollClassRoomRepository.findByClass_Id(classId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_USERS_FAIL))
                .stream()
                .filter(enrollClassRoom -> enrollClassRoom.getRole()== STUDENT_ROLEID)
                .map(EnrollClassRoom::getUser)
                .toList();
    }

    @Override
    public List<User> getTeacherInClass(int classId) {
        return  Optional.ofNullable(enrollClassRoomRepository.findByClass_Id(classId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_USERS_FAIL)).stream()
                .filter(enrollClassRoom -> enrollClassRoom.getRole()== TEACHER_ROLEID)
                .map(EnrollClassRoom::getUser)
                .toList();
    }

    @Override
    public int getRoleByUserId(int userId, int classId) {
        return this.getEnrollClassRoom(userId, classId).getRole();
    }

    @Override
    public EnrollClassRoom switchRole(int userId, int classId) {
        int currentRole = this.getRoleByUserId(userId,classId);
        if(currentRole == EnrollClassRoomService.getSTUDENT_ROLEID()){
            currentRole = EnrollClassRoomService.getTEACHER_ROLEID();
        }
        else{
            currentRole = EnrollClassRoomService.getSTUDENT_ROLEID();
        }
        EnrollClassRoom enrollClassRoom = getEnrollClassRoom(userId,classId);
        enrollClassRoom.setRole(currentRole);
        return Optional.ofNullable(enrollClassRoomRepository.save(enrollClassRoom))
                .orElseThrow(()-> new AppException(ErrorCode.GET_ENROLLCLASS_FAIL));
    }

    @Override
    public boolean removeMember(int userId, int classId) {
//        EnrollClassRoom enrollClassRoom = this.getEnrollClassRoom(userId,classId);
        return enrollClassRoomRepository.delete(userId, classId);
    }

    @Override
    public EnrollClassRoom getEnrollClassRoom(int userId, int classId) {
        return enrollClassRoomRepository.findByUser_Id(userId).stream()
                .filter(enrollClassRoom -> enrollClassRoom.getClassRoom().getId()==classId)
                .findFirst().orElseThrow(()-> new AppException(ErrorCode.GET_ENROLLCLASS_FAIL));
    }

    @Override
    public EnrollClassRoom add(EnrollClassRoom enrollClassRoom) {
        return Optional.ofNullable(enrollClassRoomRepository.save(enrollClassRoom))
                .orElseThrow(()-> new AppException(ErrorCode.ENROLL_FAIL));
    }

    @Override
    public boolean join(String inviteCode,int userId) {
        ClassRoom classRoom = classRoomRepository.getByInviteCode(inviteCode);
        if(classRoom!=null && isEnrolled(classRoom.getId(),userId)){
            return false;
        }
        if(classRoom !=null){
            EnrollClassRoom enrollClassRoom = new EnrollClassRoom();
            enrollClassRoom.setUser(userRepository.findById(userId));
            enrollClassRoom.setClassRoom(classRoom);
            enrollClassRoom.setRole(EnrollClassRoomService.getSTUDENT_ROLEID());
            enrollClassRoom.setEnrollAt(new Date(System.currentTimeMillis()));
            enrollClassRoomRepository.save(enrollClassRoom);
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean isEnrolled(int classRoomId, int userId) {
        try{
            enrollClassRoomRepository.getClassesByUser_Id(userId).stream()
                    .filter(classRoom -> classRoom.getId()==classRoomId).findFirst()
                    .orElseThrow(() -> new AppException(ErrorCode.GET_ENROLLCLASS_FAIL));
            return true;
        }
        catch (NoSuchElementException e){
            return false;
        }
    }
}
