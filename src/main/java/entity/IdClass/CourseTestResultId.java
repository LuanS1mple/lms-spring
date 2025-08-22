package entity.IdClass;

import java.io.Serializable;
import java.util.Objects;

public class CourseTestResultId implements Serializable {
    private int user;        // id của User
    private int courseTest;  // id của CourseTest

    public CourseTestResultId() {}

    public CourseTestResultId(int user, int courseTest) {
        this.user = user;
        this.courseTest = courseTest;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CourseTestResultId)) return false;
        CourseTestResultId that = (CourseTestResultId) o;
        return Objects.equals(user, that.user) &&
                Objects.equals(courseTest, that.courseTest);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, courseTest);
    }

    // getters và setters
    public int getUser() {
        return user;
    }
    public void setUser(int user) {
        this.user = user;
    }
    public int getCourseTest() {
        return courseTest;
    }
    public void setCourseTest(int courseTest) {
        this.courseTest = courseTest;
    }
}
