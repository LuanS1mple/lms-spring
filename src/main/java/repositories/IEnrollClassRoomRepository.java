package repositories;


import entity.ClassRoom;
import entity.EnrollClassRoom;
import entity.IdClass.EnrollClassRoomId;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.lang.annotation.Native;
import java.util.List;
//@Repository
public interface IEnrollClassRoomRepository /*extends JpaRepository<EnrollClassRoom, EnrollClassRoomId>*/ {
    /*@Query(value = "select c.* from EnrollClassRoom ec \" +\n" +
            "                \"join ClassRoom c on ec.classRoomId = c.id \" +\n" +
            "                \"where ec.userId = :userId", nativeQuery = true)*/
    public List<ClassRoom> getClassesByUser_Id(/*@Param("userId")*/ int userId);

//    @Query(value = "select * from EnrollClassRoom where userId = :userId", nativeQuery = true)
    public List<EnrollClassRoom> findByUser_Id(/*@Param("userId")*/int userId);

//    @Query(value = "select * from EnrollClassRoom where classRoomId = :classId", nativeQuery = true)
    public List<EnrollClassRoom>  findByClass_Id(/*@Param("classId")*/ int classId);

//    @Modifying
//    @Transactional
//    @Query(value = "delete from EnrollClassRoom where userId = :userId and classRoomId = :classRoomId", nativeQuery = true)
    public boolean delete(/*@Param("userId")*/ int userId,/*@Param("classRoomId")*/ int classRoomId);

    public EnrollClassRoom save(EnrollClassRoom enrollClassRoom);
}
