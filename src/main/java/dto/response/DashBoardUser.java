package dto.response;

import entity.User;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DashBoardUser {
    int totalUser;
    int totalAdmin;
    int totalUserActive;
    List<User> users;
}
