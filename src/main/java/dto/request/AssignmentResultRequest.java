package dto.request;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class AssignmentResultRequest {
    private String submissionUrl;
}
