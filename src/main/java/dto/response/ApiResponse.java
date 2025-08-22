package dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ApiResponse<T>{
    private int status;
    private String message;
    private T data;
}
