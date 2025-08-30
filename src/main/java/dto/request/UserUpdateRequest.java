package dto.request;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserUpdateRequest {
    private int id;

    @NotBlank()
    private String fullName;

    @NotBlank()
    private String email;

    //    @Pattern(
//            regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$",
//            message = "Password phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt"
//    )
    private String newPassword;
    private String oldPassword;
    @NotBlank()
    private String phone;

    @NotBlank()
    private String address;
    private int role;

    private MultipartFile avatarUrl;


}
