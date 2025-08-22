package dto.request;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CourseTestRequest {
    private String testTitle;
    private String testDescription;
    private String testUrl;
    private int maxScore;
    private int duration;
}
