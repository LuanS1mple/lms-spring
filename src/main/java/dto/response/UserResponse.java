package dto.response;

import entity.User;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserResponse {
    private User user;
    private int status;
    private String message;
}
