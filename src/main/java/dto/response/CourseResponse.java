package dto.response;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CourseResponse {
    private int id;
    private String title;
    private String description;
    private String category;
    private String level;
    private int duration;
    private String status;
    private String author;
    private Date createdAt;
}
