package repositories;


import entity.AssignmentResult;
import entity.IdClass.AssignmentResultId;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository
public interface IAssignmentResultRepository/* extends JpaRepository<AssignmentResult, AssignmentResultId>*/ {

//    @Query(value = "select * from AssignmentResult where assignmentId = :id", nativeQuery = true)
    public List<AssignmentResult> getByAssignment(/*@Param("id")*/ int assignmentId);

//    @Modifying
//    @Transactional
//    @Query(value = "update AssignmentResult set mark = :mark, comment = :comment\" +\n" +
//            "                \"where userId = :userId and assignmentId = :aId", nativeQuery = true)
    public AssignmentResult mark(/*@Param("mark")*/ int score,/*@Param("comment")*/ String comment,/*@Param("aId")*/AssignmentResult assignmentResult );

    public AssignmentResult save(AssignmentResult assignmentResult);

    public long count();
}
