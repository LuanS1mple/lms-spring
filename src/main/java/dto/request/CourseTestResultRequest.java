package dto.request;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CourseTestResultRequest {
    private int userId;
    private int courseTestId;
    private String url;
}
