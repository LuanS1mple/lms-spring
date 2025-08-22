package entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@Entity
public class User {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;

        @Column(name = "email",length = 255, nullable = true)
        private String email;

        @Column(name = "password",length = 255, nullable = true)
        private String password;

        @Column(name = "fullName", length = 255, nullable = true)
        private String fullName;

        @Column(name = "phone",length = 20, nullable = true)
        private String phone;

        @Column(name = "address", length = 255)
        private String address;

        @Column(name = "avatarUrl", length = 500)
        private String avatarUrl;

        @Column(name = "role")
        private int role;

        @Column(name = "status")
        private int status;

        @Column(name = "createdAt")
        private Date createdAt;

        public User() {
        }
        public User(int id, String email, String password, String fullName, String phone, String adddress, String avatarUrl, int role, int status, Date createdAt) {
                this.id = id;
                this.email = email;
                this.password = password;
                this.fullName = fullName;
                this.phone = phone;
                this.address = adddress;
                this.avatarUrl = avatarUrl;
                this.role = role;
                this.status = status;
                this.createdAt = createdAt;
        }

        @Override
        public String toString() {
                return "Full Name: "+fullName+" - CreatedAt: "+createdAt;
        }
}
