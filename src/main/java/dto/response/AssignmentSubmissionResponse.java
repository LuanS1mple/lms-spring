package dto.response;

import entity.Assignment;
import entity.AssignmentResult;
import entity.User;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AssignmentSubmissionResponse {
    User user;
    Assignment assignment;
    List<AssignmentResult> assignmentResults;
}
