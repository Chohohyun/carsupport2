package com.support.movement;

import java.util.List;
import java.util.Map;

public interface MobileDAO {
	
	List<MobileBoardDTO> getBoardList();
	
	List<MobileLoginDTO> getLoginList();

	int UpdateCode(Map<String, String> update_code);

	int DeleteCode(Map<String, String> delete_code);

	UserDTO getUserDTO(String select_num);

	//PhoneDTO getPhoneDTO(String select_num);

	int acceptListCode(Map<String, String> update_code);

	String getReserveCnt(Map<String, String> update_code);

	int getLogin(Map<String, String> login);

	String getDriverId(Map<String, String> login);

	List<Map<String, String>> getReserveList(Map<String, String> selectcode);

	String getPhoneNum(String select_num);

	int getReserveRegCnt(Map<String,String> seachRegCnt);

	String getReserveDate(Map<String, String> update_code);

	List<Map<String, String>> getReserveNo(Map<String, String> update_code);

	int getDupleTimeRegCnt(String reservedate);

	int UpdateDenyCode(List<Map<String, String>> reserveNoArr);

	String getCodeStatus(String parameter);
	
	
}
