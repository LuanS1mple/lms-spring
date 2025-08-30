package constant;

import lombok.Getter;

@Getter
public enum UserRole {
    USER(2,"USER"),
    ADMIN(1, "ADMIN");

    private final int code;
    private final String name;
    UserRole(int code,String name){
        this.code = code;
        this.name = name;
    }

}
