package ua.com.hav.acc.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CustView {

    private Long id;
    private String number;
    private String formattedNumber;
}
