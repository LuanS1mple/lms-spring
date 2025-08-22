package entity.IdClass;

import java.io.Serializable;
import java.util.Objects;

public class EnrollClassRoomId implements Serializable {
    private int user;
    private int classRoom;

    public EnrollClassRoomId() {
    }

    public EnrollClassRoomId(int user, int classRoom) {
        this.user = user;
        this.classRoom = classRoom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EnrollClassRoomId)) return false;
        EnrollClassRoomId that = (EnrollClassRoomId) o;
        return user == that.user && classRoom == that.classRoom;
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, classRoom);
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(int classRoom) {
        this.classRoom = classRoom;
    }
}
