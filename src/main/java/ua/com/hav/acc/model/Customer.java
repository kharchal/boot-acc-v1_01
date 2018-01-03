package ua.com.hav.acc.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import javax.swing.text.MaskFormatter;
import java.math.BigDecimal;
import java.text.ParseException;
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


    private String number = "0000000000";
    @JsonIgnore
    private BigDecimal balance = BigDecimal.ZERO;
    @JsonIgnore
    private boolean active;

    @JsonIgnore
    @ManyToMany
    @JoinTable(name = "cust_serv",
            joinColumns = @JoinColumn(name = "cust_id"),
            inverseJoinColumns = @JoinColumn(name = "rserv_id"))
    private List<CustService> serviceList;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @JsonIgnore
    public String getFormattedNumber() {
        MaskFormatter mf = null;
        try {
            mf = new MaskFormatter("(###) ###-##-##");
            mf.setValueContainsLiteralCharacters(false);
            return mf.valueToString(number);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
