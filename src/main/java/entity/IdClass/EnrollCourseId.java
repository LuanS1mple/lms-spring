package entity.IdClass;

import java.io.Serializable;
import java.util.Objects;

public class EnrollCourseId implements Serializable {
    private int user;
    private int course;

    public EnrollCourseId() {}

    public EnrollCourseId(int user, int course) {
        this.user = user;
        this.course = course;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EnrollCourseId)) return false;
        EnrollCourseId that = (EnrollCourseId) o;
        return user == that.user && course == that.course;
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, course);
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }
}
