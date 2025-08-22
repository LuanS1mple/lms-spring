package dto.response;

import entity.User;
import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class ClassRoomResponse {
    private int id;
    private String className;
    private Date createAt;
    private User createBy;
    private String inviteCode;
}
