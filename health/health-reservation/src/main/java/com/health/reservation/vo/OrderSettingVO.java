package com.health.reservation.vo;

public class OrderSettingVO {
    private Long id;
    private Integer date;        // 1 ~ 31
    private Integer number;      // 可预约人数
    private Integer reservations; // 已预约人数

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Integer getDate() { return date; }
    public void setDate(Integer date) { this.date = date; }
    public Integer getNumber() { return number; }
    public void setNumber(Integer number) { this.number = number; }
    public Integer getReservations() { return reservations; }
    public void setReservations(Integer reservations) { this.reservations = reservations; }
}
