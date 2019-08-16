package com.support.movement;

public class DriveHistoryDTO {
	private String drive_start_time;
	private String drive_finish_time;
	private String reserve_apply_car_number;
	private String drive_distance;
	private String start_road_addr;
	private String end_road_addr;

	private String reservation_date;
	private String user_name;
	
	public String getStart_road_addr() {
		return start_road_addr;
	}
	public void setStart_road_addr(String start_road_addr) {
		this.start_road_addr = start_road_addr;
	}
	public String getEnd_road_addr() {
		return end_road_addr;
	}
	public void setEnd_road_addr(String end_road_addr) {
		this.end_road_addr = end_road_addr;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDrive_start_time() {
		return drive_start_time;
	}
	public void setDrive_start_time(String drive_start_time) {
		this.drive_start_time = drive_start_time;
	}
	public String getDrive_finish_time() {
		return drive_finish_time;
	}
	public void setDrive_finish_time(String drive_finish_time) {
		this.drive_finish_time = drive_finish_time;
	}
	public String getReserve_apply_car_number() {
		return reserve_apply_car_number;
	}
	public void setReserve_apply_car_number(String reserve_apply_car_number) {
		this.reserve_apply_car_number = reserve_apply_car_number;
	}
	public String getDrive_distance() {
		return drive_distance;
	}
	public void setDrive_distance(String drive_distance) {
		this.drive_distance = drive_distance;
	}
	
}
