package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.sql.Timestamp;

@TableName("body")
@Data
public class Body {

    @TableId(type = IdType.AUTO)
    private int id;

    private String name;

    private int age;

    private String gender;

    private float height;

    private float weight;

    @TableField("bloodSugar")
    private float bloodSugar;

    @TableField("bloodPressureH")
    private float bloodPressureH;

    @TableField("bloodPressureL")
    private float bloodPressureL;

    @TableField("bloodLipid")
    private float bloodLipid;

    private double heartRate;

    private int vision;

    private double sleepDuration;

    private String sleepQuality;

    private int smoking;

    private int drinking;

    private int exercise;

    private String foodTypes;

    private double waterConsumption;

    @TableField("Date")
    private Timestamp date;

}
