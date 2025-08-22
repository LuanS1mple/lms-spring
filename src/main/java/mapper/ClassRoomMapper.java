package mapper;

import dto.request.ClassRoomRequest;
import dto.response.ClassRoomDetailResponse;
import dto.response.ClassRoomOverviewResponse;
import dto.response.ClassRoomResponse;
import entity.Assignment;
import entity.ClassRoom;
import entity.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class ClassRoomMapper {

    public ClassRoomOverviewResponse toClassRoomOverviewResponse(ClassRoom classRoom, List<Assignment> assignments, List<User> members){
        return ClassRoomOverviewResponse.builder()
                .classRoom(classRoom)
                .noAssignments(assignments.size())
                .noMembers(members.size())
                .build();
    }
    public ClassRoomDetailResponse toClassRoomDetailResponse(ClassRoom classRoom,List<User> teachers,List<User> students,List<Assignment> assignments){
        return ClassRoomDetailResponse.builder()
                .assignments(assignments!=null?assignments:new ArrayList<Assignment>())
                .classRoom(classRoom)
                .students(students)
                .teachers(teachers)
                .build();
    }
    public ClassRoom fromClassRoomRequest(User createBy, String inviteCode, ClassRoomRequest request){
        ClassRoom classRoom = new ClassRoom();
        classRoom.setCreateBy(createBy);
        classRoom.setClassName(request.getClassName());
        classRoom.setCreateAt(new Date());
        classRoom.setInviteCode(inviteCode);
        return classRoom;
    }
    public ClassRoomResponse toClassRoomResponse(ClassRoom classRoom){
        return ClassRoomResponse.builder()
                .id(classRoom.getId())
                .className(classRoom.getClassName())
                .createAt(classRoom.getCreateAt())
                .createBy(classRoom.getCreateBy())
                .inviteCode(classRoom.getInviteCode())
                .build();
    }
}
