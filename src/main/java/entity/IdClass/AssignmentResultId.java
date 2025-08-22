package entity.IdClass;

import java.io.Serializable;
import java.util.Objects;

public class AssignmentResultId implements Serializable {

    private int user;       // kiểu id của User
    private int assignment; // kiểu id của Assignment

    public AssignmentResultId() {
    }

    public AssignmentResultId(int user, int assignment) {
        this.user = user;
        this.assignment = assignment;
    }

    // equals và hashCode rất quan trọng
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AssignmentResultId)) return false;
        AssignmentResultId that = (AssignmentResultId) o;
        return Objects.equals(user, that.user) &&
                Objects.equals(assignment, that.assignment);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, assignment);
    }

    // getters và setters
    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getAssignment() {
        return assignment;
    }

    public void setAssignment(int assignment) {
        this.assignment = assignment;
    }
}
