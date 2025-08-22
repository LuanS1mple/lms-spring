package dto.request;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.LocalTime;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder


public class AssignmentRequest {
    private int classId;
    @NotBlank
    private String tittle;
    @NotBlank
    private String description;
    @Future
    private LocalDateTime endAt;
    @Positive
    private int maxScore;
    @NotNull
    private MultipartFile file;
}
