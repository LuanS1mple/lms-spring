package constant;

import lombok.Getter;

@Getter
public enum TestRate {
    RATE_PASS(0.5f);
    private final float value;
    TestRate(float value){
        this.value = value;
    }
}
