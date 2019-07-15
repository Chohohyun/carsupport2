package com.support.movement;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	int getAcceptPermit(String id);

	int getAcceptListAllCnt();

	List<Map<String, String>> getAcceptList();

	int getAcceptDriverCnt(int driver_no);

	int getDriverRegCnt(DriverDTO driverDTO);

	int getDriverUpDelListAllCnt();

	List<Map<String, String>> getDriverUpDelList();

	DriverDTO getDriverDTO(int driver_no);

	int getDriverUpCnt(DriverDTO driverDTO);

	int getDriverDelCnt(DriverDTO driverDTO);

	int getCarDriverDelCnt(DriverDTO driverDTO);

	int getUserRegCnt(UserDTO userDTO);

	int getUserUpDelListAllCnt();

	List<Map<String, String>> getUserUpDelList();

	UserDTO getUserDTO(int user_no);

	int getUserUpCnt(UserDTO userDTO);

	int getUserDelCnt(UserDTO userDTO);

	List<Map<String, String>> getDriverList();

	int getCarRegCnt(CarDTO carDTO);

	int getCarListAllCnt();

	List<Map<String, String>> getCarList();
	
	CarDTO getCarDTO(int car_info_no);

	int getCarUpdateCnt(CarDTO carDTO);

	int getCarDeleteCnt(int car_info_no);

	int getCarMaintanceRegCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintanceListAllCnt();

	List<Map<String, String>> getCarMaintanceList();

	CarMaintanceDTO getCarMaintanceDTO(int car_maintance_info_no);

	int getCarMaintanceUpdateCnt(CarMaintanceDTO carMaintanceDTO);

	int getCarMaintancDeleteCnt(int car_maintance_info_no);

	List<Map<String, String>> getQnaList(int question_group_no);

	int insertQna(QnaDTO qnaDTO);

	QnaDTO getQnaDTO(int question_no);

	int getBoardCnt(QnaDTO qnaDTO);

	int updateQna(QnaDTO qnaDTO);

	int deleteQna(QnaDTO qnaDTO);

	int getAdminDiscontentListAllCnt();

	List<Map<String, String>> getAdminDiscontentList();

	int getReadcountUp(int adminDiscontent_no);

	DiscontentDTO getDiscontentDTO(int adminDiscontent_no);

	int updatePrint_no(DiscontentDTO discontentDTO);

	int insertAdminDiscontent(DiscontentDTO discontentDTO);

	int getDiscontentCnt(DiscontentDTO discontentDTO);

	int getDiscontentUpCnt(DiscontentDTO discontentDTO);

	int getDiscontentDelCnt(DiscontentDTO discontentDTO);

	int getGroupCnt(Map<String, String> paramsMap);

	int getCheckCarNumber(CarDTO carDTO);

}
