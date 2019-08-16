package com.support.movement;

import java.util.List;
import java.util.Map;


public interface DriverDAO {

	DriverDTO getDriverDTO(String id);

	CarDTO getDriverCarInfo(String id);

	int getDriveListAllCnt(DriveSearchDTO driveSearchDTO);

	List<Map<String, String>> getDriveList(DriveSearchDTO driveSearchDTO);

	int getDriverUserReresveListAllCnt(ReserveSearchDTO reserveSearchDTO);

	List<Map<String, String>> getDriverUserReresveList(ReserveSearchDTO reserveSearchDTO);

	ReviewDTO getDriverGrade(int reserve_apply_car_number);

	List<Map<String, String>> getQnaList(QnaSearchDTO qnaSearchDTO);

	DriveHistoryDTO getDriveReg(int reserve_apply_car_number);

	int getDriveChangeStatus(DriveHistoryDTO driveHistoryDTO);

	int getDriveAcceptStatus(DriveHistoryDTO driveHistoryDTO);

	int insertDriveHistory(DriveHistoryDTO driveHistoryDTO);

	int updateCarDistance(DriveHistoryDTO driveHistoryDTO);

}
