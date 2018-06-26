package com.neuedu.entity;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
@ToString
@Getter
public class Emp {
    private Integer id;
    private String name;
    private String phone;
    private String sex;
    private Integer salary;
    private Integer dept_id;
    private Dept dept;
}
