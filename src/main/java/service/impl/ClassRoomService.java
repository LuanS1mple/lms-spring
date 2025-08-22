package service.impl;

import entity.ClassRoom;
import entity.EnrollClassRoom;
import exception.AppException;
import exception.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.IClassRoomRepository;
import repositories.IEnrollClassRoomRepository;
//import repositories.db.SQLClassRoomRepository;
//import repositories.db.SQLEnrollClassRoomRepository;
import service.IClassRoomService;

import java.sql.Date;
import java.util.List;
import java.util.Optional;


@Service
public class ClassRoomService implements IClassRoomService {
    @Autowired
    private IClassRoomRepository classRoomRepository;
    @Autowired
    private IEnrollClassRoomRepository enrollClassRoomRepository;
    @Override
    public List<ClassRoom> getAll() {
        return Optional.ofNullable(classRoomRepository.findAll())
                .orElseThrow(()-> new AppException(ErrorCode.GET_CLASSOVERVIEW_FAIL));
    }

    @Override
    public void add(ClassRoom c) {
        ClassRoom classRoom =classRoomRepository.save(c);
        Date now = new Date(System.currentTimeMillis());
        EnrollClassRoom enrollClassRoom = new EnrollClassRoom();
        enrollClassRoom.setUser(c.getCreateBy());
        enrollClassRoom.setClassRoom(classRoom);
        enrollClassRoom.setEnrollAt(now);
        enrollClassRoom.setRole(EnrollClassRoomService.getTEACHER_ROLEID());
        enrollClassRoomRepository.save(enrollClassRoom);
    }

    @Override
    public int size() {
        return classRoomRepository.findAll().size();
    }

    @Override
    public ClassRoom getById(int classId) {
        return Optional.ofNullable(classRoomRepository.getById(classId))
                .orElseThrow(()-> new AppException(ErrorCode.GET_CLASSDETAIL_FAIL));
    }
}
