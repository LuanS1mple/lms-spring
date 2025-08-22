package service;



import entity.ClassRoom;

import java.util.List;

public interface IClassRoomService {
    public List<ClassRoom> getAll();
    public void add(ClassRoom c);
    public int size();
    public ClassRoom getById(int classId);
}
