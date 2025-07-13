package com.joe.aicustomer.entity;

import com.joe.aicustomer.enums.Gender;
import lombok.Data;

import java.time.LocalDate;

/**
 * @author JOE
 */
@Data
public class User {
    private Integer id;
    private String cnName;
    private String enName;
    private Gender gender;
    private String phone;
    private String email;
    private String cityCn;
    private String cityEn;
    private LocalDate regDate;
    private Integer vipLevel;
}
