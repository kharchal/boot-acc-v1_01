package ua.com.hav.acc.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by sunny on 28.12.17
 */
@Data
@Entity
public class CustService {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private BigDecimal cost;

    @ManyToOne
    @JoinColumn(name = "serv_id")
    private CustServicePeriod period;

}
