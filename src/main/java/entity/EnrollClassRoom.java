package entity;


import entity.IdClass.EnrollClassRoomId;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@Entity
@IdClass(EnrollClassRoomId.class)
public class EnrollClassRoom {
    @Id
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name = "classRoomId")
    private ClassRoom classRoom;

    @Column(name = "enrollAt")
    private Date enrollAt;

    @Column(name = "role")
    private int role;

    public EnrollClassRoom() {
    }

    public EnrollClassRoom(User user, ClassRoom classRoom, Date enrollAt, int role) {
        this.user = user;
        this.classRoom = classRoom;
        this.enrollAt = enrollAt;
        this.role = role;
    }


}

