package constant;

import lombok.Getter;

@Getter
public enum UserRole {
    USER(2),
    ADMIN(1);

    private final int code;
    UserRole(int code){
        this.code = code;
    }

}
