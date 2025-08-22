package mapper;

import dto.request.AssignmentRequest;
import entity.Assignment;
import entity.ClassRoom;
import entity.User;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.LocalTime;

@Component
public class AssignmentMapper {
    public Assignment fromAssignmentRequest(AssignmentRequest request, User user, ClassRoom classRoom){
        Assignment assignment = new Assignment();
        assignment.setClassRoom(classRoom);
        assignment.setDescription(request.getDescription());
        assignment.setAllowLate(true);
        assignment.setTittle(request.getTittle());
        assignment.setStartAt(LocalDateTime.now());
        assignment.setEndAt(request.getEndAt());
        assignment.setMaxScore(request.getMaxScore());
        assignment.setCreateBy(user);
        assignment.setAssignmentUrl(request.getFile().getOriginalFilename());
        return assignment;
    }
}
