package dto.request;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CourseContentRequest {
    private String title;
    private String type;
    private String contentUrl;
}
