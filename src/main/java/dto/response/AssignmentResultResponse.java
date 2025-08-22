package dto.response;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class AssignmentResultResponse {
    private int userId;
    private int assignmentId;
    private int mark;
    private String comment;
    private String status;
}
