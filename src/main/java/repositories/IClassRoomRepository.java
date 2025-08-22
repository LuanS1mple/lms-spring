package repositories;


import entity.ClassRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repositor
public interface IClassRoomRepository/* extends JpaRepository<ClassRoom, Integer> */{
    public List<ClassRoom> findAll();
    public ClassRoom save(ClassRoom c);

    public ClassRoom getByInviteCode(String inviteCode);
    public ClassRoom getById(int classId);
}
