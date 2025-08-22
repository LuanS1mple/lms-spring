package repositories;



import entity.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository
public interface IAssignmentRepository/* extends JpaRepository<Assignment, Integer> */{

//    @Query(value = "select * from Assignment where classRoomId =:classId",nativeQuery = true)
    public List<Assignment> getAssignmentByClass(/*@Param("classId")*/ int classId);

    public long count();
    public Assignment save(Assignment assignment);
    public Assignment getById(int assignmentId);
}
