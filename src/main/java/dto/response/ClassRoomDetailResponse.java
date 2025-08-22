package dto.response;

import entity.Assignment;
import entity.ClassRoom;
import entity.User;
import lombok.*;

import java.util.List;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class ClassRoomDetailResponse {
    private ClassRoom classRoom;
    private List<User> teachers;
    private List<User> students;
    private List<Assignment> assignments;
}
