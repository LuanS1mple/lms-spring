package constant;

import lombok.Getter;

@Getter
public enum AssignmentStatus {
    UN_MARKED(-1),
    UN_LATE(0),
    LATE(1);
    private final int value;
    AssignmentStatus(int value){
        this.value = value;
    }
}
