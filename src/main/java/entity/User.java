package entity;

import constant.UserRole;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

@Getter
@Setter
@Entity
public class User implements UserDetails {
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

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        String role;
        if(this.role== UserRole.USER.getCode()){
            role = UserRole.USER.getName();
        }
        else{
            role = UserRole.ADMIN.getName();
        }
        return List.of(new SimpleGrantedAuthority("ROLE_"+ role));
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return status == 1;
    }
}
