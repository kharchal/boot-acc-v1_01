package ua.com.hav.acc.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * Created by sunny on 26.12.17
 */
@Data
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 3, max = 10)
    private String name;

    @Min(10)
    @Max(70)
    private int age;

    private String login;
    private String password;
    private String email;
    private String address;
    private String role;

    @ManyToOne
    @JoinColumn(name = "user_id")
//    @JoinTable(name = "users_roles",
//            joinColumns = @JoinColumn(name = "user_id"),
//            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Role rolex;

}
