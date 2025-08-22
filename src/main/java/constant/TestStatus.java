package constant;

import lombok.Getter;

@Getter
public enum TestStatus {
    PASSED(1);
    private final int value;
    TestStatus(int value){
        this.value = value;
    }
}
