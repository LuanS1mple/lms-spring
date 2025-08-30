package dto.request;

import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CourseTestRequest {
    private String testTitle;
    private String testDescription;
    private MultipartFile testUrl;
    private int maxScore;
    private int duration;
}
