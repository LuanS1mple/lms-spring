package dto.response;

import entity.ClassRoom;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ClassRoomOverviewResponse {
    private ClassRoom classRoom;
    private int noAssignments;
    private int noMembers;
}
