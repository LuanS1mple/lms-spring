package mapper;

import constant.AssignmentStatus;
import dto.request.AssignmentResultRequest;
import dto.response.AssignmentResultResponse;
import dto.response.AssignmentSubmissionResponse;
import entity.Assignment;
import entity.AssignmentResult;
import entity.User;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

@Component
public class AssignmentResultMapper {
    public AssignmentResultResponse toAssignmentResultResponse(AssignmentResult assignmentResult){
        if(assignmentResult ==null) return null;
        return AssignmentResultResponse.builder()
                .assignmentId(assignmentResult.getAssignment().getId())
                .mark(assignmentResult.getMark())
                .comment(assignmentResult.getComment())
                .status(assignmentResult.getStatus() == AssignmentStatus.LATE.getValue()? "Late":"On Time")
                .userId(assignmentResult.getUser().getId())
                .build();
    }
    public AssignmentResult fromAssignmentResultRequest(AssignmentResultRequest request, User user, Assignment assignment,int mark,int status,String comment){
        AssignmentResult assignmentResult = new AssignmentResult();
        assignmentResult.setUser(user);
        assignmentResult.setAssignment(assignment);
        assignmentResult.setDoneAt(LocalDateTime.now());
        assignmentResult.setSubmissionUrl(request.getSubmissionUrl());
        assignmentResult.setComment(comment);
        assignmentResult.setStatus(status);
        assignmentResult.setMark(mark);
        return assignmentResult;
    }
    public AssignmentSubmissionResponse toAssignmentSubmissionResponse(Assignment assignment, List<AssignmentResult> assignmentResultList){
        return AssignmentSubmissionResponse.builder()
                .user(assignment.getCreateBy())
                .assignment(assignment)
                .assignmentResults(assignmentResultList)
                .build();
    }
}
