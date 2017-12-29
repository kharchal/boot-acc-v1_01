package ua.com.hav.acc.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by sunny on 29.12.17
 */
@Data
@Entity
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String number;
    private BigDecimal balance;
    private boolean active;

    @ManyToMany
    @JoinTable(name = "cust_serv",
            joinColumns = @JoinColumn(name = "cust_id"),
            inverseJoinColumns = @JoinColumn(name = "rserv_id"))
    private List<CustService> serviceList;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
