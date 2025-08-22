package dto.response;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class CourseTestResultResponse {
    private int userId;
    private int score;
    private int courseTestId;
}
