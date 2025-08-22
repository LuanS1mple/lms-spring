package constant;

import lombok.Getter;

@Getter
public enum ClassRole {
    TEACHER_ROLE(1),
    STUDENT_ROLE(0);
    private final int code;
    ClassRole(int code){
        this.code = code;
    }
}
