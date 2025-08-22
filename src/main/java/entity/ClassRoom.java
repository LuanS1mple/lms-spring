package entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@Entity
public class ClassRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "className", length = 255)
    private String className;

    @Column(name = "createAt")
    private Date createAt;

    @ManyToOne
    @JoinColumn(name = "createBy")
    private User createBy;

    @Column(name = "inviteCode", length = 100)
    private String inviteCode;

    public ClassRoom() {
    }

    public ClassRoom(int id, String className, Date createAt, User createBy, String inviteCode) {
        this.id = id;
        this.className = className;
        this.createAt = createAt;
        this.createBy = createBy;
        this.inviteCode = inviteCode;
    }



}
